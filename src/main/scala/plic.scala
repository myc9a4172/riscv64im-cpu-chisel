//plic  平台级中断控制器(支持6个外部中断)

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import define.myc01_core_define._

class plic extends Module {
  val io = IO(new Bundle {
   //val int_i          = Input(UInt(7.W))  //1-6号引脚分别接入6个中断
   
   val int_i_1 = Input(UInt(1.W))
   val int_i_2 = Input(UInt(1.W))
   val int_i_3 = Input(UInt(1.W))
   val int_i_4 = Input(UInt(1.W))
   val int_i_5 = Input(UInt(1.W))
   val int_i_6 = Input(UInt(1.W))

   val excint  = Output(UInt(1.W)) //输出的中断信号
     
   //与hart的交互信息
   val re    = Input (UInt(1.W))
   val rdata = Output(UInt(64.W))
   val we    = Input (UInt(1.W))
   val wdata = Input (UInt(3.W))
   val addr  = Input (UInt(64.W))
  }) 
  
  val pending   = RegInit(VecInit(Seq.fill(7)(0.U(1.W))))  //第0位永远为0，1表示存在中断等待
  val enable    = RegInit(VecInit(Seq.fill(7)(1.U(1.W))))  //1表示使能中断源 0表示关闭中断源
  val threshold = RegInit(VecInit(Seq.fill(7)(0.U(3.W))))  //中断阈值 优先级不大于自身threshold的中断会被扔掉 0表示默认中断发生 7表示扔掉中断
  val gate      = RegInit(VecInit(Seq.fill(7)(1.U(1.W))))  //中断门控
  val priority  = RegInit(VecInit(Seq.fill(7)(7.U(3.W))))  //中断优先级
  val Max_pri   = RegInit(0.U(3.W)) //最高优先级
  val Max_id    = RegInit(0.U(3.W)) //最高优先级对应的中断id
  val claim     = RegInit(0.U(3.W)) //中断响应/完成寄存器
  
  //根据中断源输入与gate状态输出等待状态
  when(io.int_i_1 === 1.U && gate(1) === 1.U){
	 gate(1) := 0.U
	 pending(1) := 1.U //表示1号中断源等待
  }
  when(io.int_i_2 === 1.U && gate(2) === 1.U){
	 gate(2) := 0.U
	 pending(2) := 1.U //表示2号中断源等待
  }
  when(io.int_i_3 === 1.U && gate(3) === 1.U){
	 gate(3) := 0.U
	 pending(3) := 1.U //表示3号中断源等待
  }
  when(io.int_i_4 === 1.U && gate(4) === 1.U){
	 gate(4) := 0.U
	 pending(4) := 1.U //表示4号中断源等待
  }
  when(io.int_i_5 === 1.U && gate(5) === 1.U){
	 gate(5) := 0.U
	 pending(5) := 1.U //表示5号中断源等待
  }
  when(io.int_i_6 === 1.U && gate(6) === 1.U){
	 gate(6) := 0.U
	 pending(6) := 1.U //表示6号中断源等待
  }
  
  //根据每个中断源等待状态与使能情况向仲裁器输出(中断源编号+优先级)
  val pri1 = Cat(1.U(3.W),Mux(pending(1) === 1.U && enable(1) === 1.U,priority(1), 0.U(3.W)))
  val pri2 = Cat(2.U(3.W),Mux(pending(2) === 1.U && enable(2) === 1.U,priority(2), 0.U(3.W)))
  val pri3 = Cat(3.U(3.W),Mux(pending(3) === 1.U && enable(3) === 1.U,priority(3), 0.U(3.W)))
  val pri4 = Cat(4.U(3.W),Mux(pending(4) === 1.U && enable(4) === 1.U,priority(4), 0.U(3.W)))
  val pri5 = Cat(5.U(3.W),Mux(pending(5) === 1.U && enable(5) === 1.U,priority(5), 0.U(3.W)))
  val pri6 = Cat(6.U(3.W),Mux(pending(6) === 1.U && enable(6) === 1.U,priority(6), 0.U(3.W)))
  
  //中断优先级仲裁器(同优先级中断源编号小优先)，最终的仲裁结果由pri_max输出
  val pri_temp12 = MuxCase(pri1, Seq(
                     (pri1(2,0)  >  pri2(2,0)) -> pri1,
					 (pri1(2,0)  <  pri2(2,0)) -> pri2,
                     (pri1(2,0) === pri2(2,0)) -> pri1))
  val pri_temp34 = MuxCase(pri3, Seq(
                     (pri3(2,0)  >  pri4(2,0)) -> pri3,
					 (pri3(2,0)  <  pri4(2,0)) -> pri4,
                     (pri3(2,0) === pri4(2,0)) -> pri3))
  val pri_temp56 = MuxCase(pri5, Seq(
                     (pri5(2,0)  >  pri6(2,0)) -> pri5,
					 (pri5(2,0)  <  pri6(2,0)) -> pri6,
                     (pri5(2,0) === pri6(2,0)) -> pri5))
  val pri_temp   = MuxCase(pri_temp12, Seq(
                     (pri_temp12(2,0)  >  pri_temp34(2,0)) -> pri_temp12,
                     (pri_temp12(2,0)  <  pri_temp34(2,0)) -> pri_temp34,
                     (pri_temp12(2,0) === pri_temp34(2,0)) -> pri_temp12))
  val pri_max    = MuxCase(pri_temp, Seq(
                     (pri_temp(2,0)  >  pri_temp56(2,0)) -> pri_temp,
                     (pri_temp(2,0)  <  pri_temp56(2,0)) -> pri_temp56,
                     (pri_temp(2,0) === pri_temp56(2,0)) -> pri_temp))
				   
  //将仲裁结果输出寄存器  
  Max_pri := pri_max(2,0)
  Max_id  := pri_max(5,3)
  
  //向hart输出中断仲裁结果
  io.excint    := Mux(Max_pri > threshold(Max_id), 1.U, 0.U)
  //io.excint_id := Mux(Max_pri > threshold(Max_id), Max_id, 0.U)
  
  //如果决定响应此中断，则使用软件向plic发起中断响应读操作 
  //作为响应反馈，PLIC 返回该中断源的中断ID同时，硬件自动将其对应IP寄存器清0
  when(io.re === 1.U && io.addr === PLIC_CLAIM_COMPLETE){
	io.rdata := Max_id
	pending(Max_id) := 0.U  //清空对应的pengding等待位
  }.otherwise{
	io.rdata := 0.U
  }
  //中断处理完成后，软件写寄存器，解除门控
  when(io.we === 1.U && io.addr === PLIC_CLAIM_COMPLETE){
	gate(io.wdata) := 1.U
  }
}


