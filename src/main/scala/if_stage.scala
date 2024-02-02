//if_stage  取指模块

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import define.myc01_core_define._

class if_stage extends Module {
  val io = IO(new Bundle {
  //to ifid_reg
	val pc          = Output(UInt(INST_ADDR_WIDTH))  //PC寄存器值 <64>
	val inst_o      = Output(UInt(INST_WIDTH))       //向译码阶段输出当前类sram端口返回的指令 <32> 
    val BTB_hit_o   = Output(UInt(2.W))              //向译码阶段输出当前指令的BTB命中情况 <2>
	val BTB_false_o = Output(UInt(1.W))              //向译码阶段输出BTB预测失败信号，对id阶段冲刷 <1>
													 
  //from id_stage                                    
	val jump_addr   = Input(UInt(INST_ADDR_WIDTH))   //译码阶段传回的跳转目标地址<64>
	val jump_flag   = Input(UInt(1.W))               //译码阶段传回的跳转信号 <1>
	val jump_inst   = Input(UInt(1.W))               //译码阶段传回的跳转指令信号 <1>
	val id_pc       = Input(UInt(INST_ADDR_WIDTH))   //处于译码阶段指令的pc <64>
	val id_BTB_hit  = Input(UInt(2.W))               //处于译码阶段指令的BTB_hit情况 <2>
	
  //icache类sram交互端口
	val inst_req       = Output(UInt(1.W))              //icache访存请求信号 <1>  
	val iaddr          = Output(UInt(INST_ADDR_WIDTH))  //icache访存请求地址 <64> 
    val inst_rdata     = Input (UInt(64.W))             //icache返回的数据 <64>（64位，需要根据地址进行截取）
	val inst_data_ok   = Input (UInt(1.W))              //icache事务完成信号 <1>
	val icache_invalid = Output(UInt(1.W))              //清空icache信号 <1>
	
  //from stall_ctrl
	val stall       = Input(UInt(5.W))               //来自stall_ctrl模块的流水线暂停信号 <5>
	
  //from clint
	val flush       = Input(UInt(1.W))               //来自clint的冲刷信号 <1>
	val excaddr     = Input(UInt(INST_ADDR_WIDTH))   //来自clint的异常跳转地址 <64>
  })
  //指令存储器使能
  val ice_reg = RegInit(0.U(1.W))         //定义ice值寄存器
  ice_reg := 1.U                          //复位结束后ice_reg赋值为1
 
  //PC寄存器
  val pc_reg = RegInit(0.U(INST_ADDR_WIDTH))    //定义pc值寄存器 <64>
  

  /*icache类sram端口交互与指令发射---------------------------------------------------------------------------------------------------------------*/
  //当不暂停取指/不冲刷pc时 向icache发起inst_req
  io.inst_req := Mux((io.stall(1) === 1.U || io.flush === 1.U ), 0.U, ice_reg) 
  //io.iaddr := Mux((io.inst_req === 1.U), pc_reg, 0.U)   //向icache输出取指地址
  io.iaddr := pc_reg
  
  val ready_go  = io.inst_req === 1.U && io.inst_data_ok === 1.U && io.BTB_false_o === 0.U && (io.flush /*| flush_reg*/) === 0.U//允许指令发射
  val pc_stall = ready_go === 0.U //指令发射允许前 pc更新暂停 PC值保持不变 

  io.pc := Mux(ready_go===1.U, pc_reg, 0.U)     //指令发射允许时，一同将pc值发射
  //根据pc地址从inst_rdata中截取指令同时根据小端模式组织指令字 
  io.inst_o := MuxCase(0.U,Seq(
               (ready_go === 1.U && io.iaddr(2,0) === "b000".U) -> Cat(io.inst_rdata(39,32),io.inst_rdata(47,40),io.inst_rdata(55,48),io.inst_rdata(63,56)),
		       (ready_go === 1.U && io.iaddr(2,0) === "b100".U) -> Cat(io.inst_rdata(7,0)  ,io.inst_rdata(15,8) ,io.inst_rdata(23,16),io.inst_rdata(31,24))))

  //流水线冲刷
  val flush_reg = RegInit(0.U(1.W))
  when(io.flush === 1.U){
	flush_reg := 1.U
  }.elsewhen(flush_reg === 1.U && io.inst_req === 1.U && io.inst_data_ok === 1.U){
    flush_reg := 0.U
  } 

  /*分支预测模块-------------------------------------------------------------------------------------------------------------*/	
  //构建BTB存储器  V(1bit) Tag(8bit) BTA(62bit) BHT(2bit)
   val V_reg   = RegInit(VecInit(Seq.fill(32)(0.U(1.W)))) 
   val Tag_reg = RegInit(VecInit(Seq.fill(32)(0.U(8.W)))) 
   val BTA_reg = RegInit(VecInit(Seq.fill(32)(0.U(62.W)))) 
   val BHT_reg = RegInit(VecInit(Seq.fill(32)(0.U(2.W)))) 
   
   val BTB_false_reg = RegInit(0.U(1.W))  //分支预测失败状态寄存
   val correct_pc_reg = RegInit(0.U(64.W))//分支预测更正pc寄存
   
   val predicted_pc = WireInit(0.U)    //分支预测器输出的预测指令地址
   val correct_pc   = WireInit(0.U)    //分支预测错误后需要更正的指令地址
   val BTB_hit      = WireInit(0.U)    //当前指令BTB命中情况，低位:是否命中，高位:是否根据预测进行了跳转 
   val BTA          = WireInit(0.U)    //从BTB中读出的预测地址
   val BTB_false    = WireInit(0.U)    //BTB预测错误信号
   
   //根据当前pc的index位寻址BTB存储器，判断是否命中与跳转并输出结果
   when(Tag_reg(pc_reg(6,2)) === pc_reg(14,7) && V_reg(pc_reg(6,2)) === 1.U) //BTB命中
   {
	  BTA := BTA_reg(pc_reg(6,2)) << 2.U             //计算跳转地址
	  when(BHT_reg(pc_reg(6,2))(1) === 1.U){         //命中且预测跳转，输出预测地址:BTA
	  	predicted_pc := BTA
	  	BTB_hit := "b11".U
	  }.elsewhen(BHT_reg(pc_reg(6,2))(1) === 0.U){   //命中且预测不跳转，输出预测地址:当前pc+4
	  	predicted_pc := pc_reg + 4.U
	  	BTB_hit := "b01".U
	  }  
   }.otherwise{                                     //未命中，预测为不跳转:当前pc+4，
      predicted_pc := pc_reg + 4.U
      BTB_hit := "b00".U 
	  BTA := 0.U 
   }
   io.BTB_hit_o := BTB_hit  //输出BTB命中情况
   
   //根据译码阶段传回的跳转结果结合id_BTB_hit判断上次预测对错并更新BTB存储器 id_BTB_hit="b10".U表示当前传回的分支预测无效 流水线冲刷时不需要管BTB
   when(io.id_BTB_hit === "b11".U && io.jump_flag === 1.U && ((io.stall(1)|io.stall(0)) === 0.U) && (io.flush | flush_reg) === 0.U){    
    //先前BTB命中且跳转，译码阶段判断跳转，预测正确  
	  BTB_false  := 0.U
	  correct_pc := 0.U
	  BHT_reg(io.id_pc(6,2)) := MuxCase(0.U,Seq(
	      (BHT_reg(io.id_pc(6,2)) === "b11".U) -> "b11".U,
		  (BHT_reg(io.id_pc(6,2)) === "b10".U) -> "b11".U
	  ))
   }.elsewhen(io.id_BTB_hit === "b11".U && io.jump_flag === 0.U && ((io.stall(1)|io.stall(0)) === 0.U) && (io.flush | flush_reg) === 0.U){ 
    //先前BTB命中且跳转，译码阶段判断不跳转，预测错误
	  BTB_false := 1.U                                   //向ctrl模块发出预测错误信号
	  correct_pc := io.id_pc + 4.U                       //提供更正的pc = 上一条指令pc+4
	  BHT_reg(io.id_pc(6,2)) := MuxCase(0.U,Seq(
	      (BHT_reg(io.id_pc(6,2)) === "b11".U) -> "b10".U,
		  (BHT_reg(io.id_pc(6,2)) === "b10".U) -> "b01".U
	  ))
   }.elsewhen(io.id_BTB_hit === "b01".U && io.jump_flag === 0.U && ((io.stall(1)|io.stall(0)) === 0.U) && (io.flush | flush_reg) === 0.U){  
    //先前BTB命中且不跳转，译码阶段判断不跳转，预测正确
	  BTB_false  := 0.U
	  correct_pc := 0.U  
	  BHT_reg(io.id_pc(6,2)) := MuxCase(0.U,Seq(
	      (BHT_reg(io.id_pc(6,2)) === "b01".U) -> "b00".U,
		  (BHT_reg(io.id_pc(6,2)) === "b00".U) -> "b00".U
	  ))
   }.elsewhen(io.id_BTB_hit === "b01".U && io.jump_flag === 1.U && ((io.stall(1)|io.stall(0)) === 0.U) && (io.flush | flush_reg) === 0.U){   
    //先前BTB命中且不跳转，译码阶段判断跳转，预测错误
	  BTB_false := 1.U                                   //向ctrl模块发出预测错误信号
	  correct_pc := io.jump_addr                         //提供更正的pc = 译码阶段返回的跳转地址
	  BHT_reg(io.id_pc(6,2)) := MuxCase(0.U,Seq(
	      (BHT_reg(io.id_pc(6,2)) === "b01".U) -> "b10".U,
		  (BHT_reg(io.id_pc(6,2)) === "b00".U) -> "b01".U
	  ))
   }.elsewhen(io.id_BTB_hit === "b00".U && io.jump_inst === 1.U && ((io.stall(1)|io.stall(0)) === 0.U) && (io.flush | flush_reg) === 0.U){   
    //先前BTB未命中，但译码阶段是跳转指令 
	  //更新BTB  
	  V_reg(io.id_pc(6,2)) := 1.U                   //置V位
	  Tag_reg(io.id_pc(6,2)) := io.id_pc(14,7)      //置tag
	  BTA_reg(io.id_pc(6,2)) := io.jump_addr(63,2)  //置BTA
	  BHT_reg(io.id_pc(6,2)) := "b01".U             //置计数器为初始态
	  when(io.jump_flag === 1.U){                   //如果译码结果为跳转，则预测错误
	    BTB_false := 1.U                            //向ctrl模块发出预测错误信号
	    correct_pc := io.jump_addr                  //提供更正后的pc = 译码阶段返回的跳转地址
	  }
   }  
  io.BTB_false_o := BTB_false_reg === 1.U || BTB_false === 1.U

  when(BTB_false === 1.U){
	BTB_false_reg := 1.U
  }.elsewhen((BTB_false_reg === 1.U && io.inst_req === 1.U && io.inst_data_ok === 1.U)|| io.flush === 1.U){
    BTB_false_reg := 0.U
  }
  
  when(BTB_false_reg === 1.U ){
    correct_pc_reg := correct_pc_reg
  }.otherwise{
	correct_pc_reg := correct_pc
  }
  
 // val pc_next = Mux(BTB_false_reg === 1.U, correct_pc_reg, predicted_pc)  //BTB预测失败使用更正pc,否则使用预测pc
    val pc_next = MuxCase(predicted_pc,Seq(
	              (BTB_false === 1.U) ->  correct_pc,
	              (BTB_false_reg === 1.U) -> correct_pc_reg
	             ))
	

 
  /*---------------------------------------------------------------------------------------------------------------------------*/	
  
  
  /*pc寄存器更新--------------------------------------------------------------------------------------------------------------*/	
  when(ice_reg === 0.U){
     pc_reg := 0.U                    //ice_reg=0时禁止使能  pc_reg为0
  }.elsewhen(io.flush === 1.U){      
	 pc_reg := io.excaddr              //发生中断或异常后，跳转到excp送来的异常处理地址
  }.elsewhen(io.stall(0) === 1.U || (pc_stall === 1.U && io.BTB_false_o/*BTB_false_reg*/ === 0.U)){
     pc_reg := pc_reg                 //stall暂停更新PC，pc_reg暂停更新 但是BTB_false时需要更新
  }.otherwise{
     pc_reg := pc_next                //pc_reg等于pc_next
  }  
  /*---------------------------------------------------------------------------------------------------------------------------*/
  
  /*--icache同步fence.i-------------------------------------------------------------------------------------------------------*/
  //预译码inst_fencei指令 并与icache通讯
  val inst_fencei = (io.inst_o(6,0) === "b0001111".U) && (io.inst_o(14,12) === "b001".U) && (io.inst_o(31,25) === "b0000000".U)
  io.icache_invalid := inst_fencei
  
}

