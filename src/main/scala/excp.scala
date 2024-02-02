//excp  异常处理模块(含csr寄存器)

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import define.myc01_core_define._

class excp extends Module {
  val io = IO(new Bundle {
  //from wb_stage
      val we_i  = Input(UInt(1.W))        //写回模块写寄存器使能
	  val wa_i  = Input(UInt(CSR_ADDR_WIDTH))     //写回模块写寄存器地址
	  val wd_i  = Input(UInt(XLEN))     //写回模块写寄存器数据
  //form exe_stage
      val re_i  = Input(UInt(1.W))      //执行模块读csr寄存器使能
	  val ra_i  = Input(UInt(CSR_ADDR_WIDTH))     //执行模块读寄存器地址
      val rd_o  = Output(UInt(XLEN))    //执行模块读寄存器数据
  //from mem_stage
      val exccode_i  = Input(UInt(EXCCODE_WIDTH))  //发生异常的指令的最终异常类型编码
      val pc_i       = Input(UInt(INST_ADDR_WIDTH)) //发生异常的指令的pc值
	  val jump_addr_i = Input(UInt(INST_ADDR_WIDTH)) //当前指令如果为j指令的转移地址
  //to if_stage  
      val flush   = Output(UInt(1.W))    //清空流水线信号
	  val excaddr = Output(UInt(XLEN))   //异常处理程序入口地址
  //from clint
	  val mtime_int_i  = Input(UInt(1.W))  //机器模式计时器中断(from clint)
	  val msoft_int_i  = Input(UInt(1.W))  //机器模式软件中断(from clint)
      val mext_int_i   = Input(UInt(1.W))  //机器模式外部中断信号(from plic)
  })

/*CSR寄存器定义----------------------------------------------------------------*/	
  //定义CSR寄存器
  val mtvec    = RegInit("hf0".U(XLEN))     
  val mcause   = RegInit(0.U(XLEN))
  val mepc     = RegInit(0.U(XLEN))
  val mstatus  = RegInit(8.U(XLEN)) //默认打开全局中断
  val mscratch = RegInit(0.U(XLEN))
 
  // Machine Interrupt Registers (mip and mie) 拆分定义
  val MEIP = RegInit(0.U(1.W))  // external interrupt-pending bits
  val SEIP = false.B 
  val UEIP = false.B
  val MTIP = RegInit(0.U(1.W))  // timer interrupt-pending bits
  val STIP = false.B
  val UTIP = false.B
  val MSIP = RegInit(0.U(1.W))  // software interrupt-pending bits
  val SSIP = false.B
  val USIP = false.B
  val MEIE = RegInit(1.U(1.W))  // external interrupt-enable bits
  val SEIE = false.B
  val UEIE = false.B
  val MTIE = RegInit(1.U(1.W))  // timer interrupt-enable bits
  val STIE = false.B
  val UTIE = false.B
  val MSIE = RegInit(1.U(1.W))  // software interrupt-enable bits
  val SSIE = false.B
  val USIE = false.B
  val mie = Cat(0.U(52.W), MEIE, 0.U(1.W), SEIE, UEIE, MTIE, 0.U(1.W), STIE, UTIE, MSIE, 0.U(1.W), SSIE, USIE)
  val mip = Cat(0.U(52.W), MEIP, 0.U(1.W), SEIP, UEIP, MTIP, 0.U(1.W), STIP, UTIP, MSIP, 0.U(1.W), SSIP, USIP)

  when(io.msoft_int_i === 1.U && MSIP === 0.U){
		MSIP := 1.U
  }.elsewhen(io.msoft_int_i === 0.U && MSIP === 1.U){
		MSIP := 0.U
  }
  
  when(io.mtime_int_i === 1.U && MTIP === 0.U){
		MTIP := 1.U
  }.elsewhen(io.mtime_int_i === 0.U && MTIP === 1.U){
		MTIP := 0.U
  } 
  
  when(io.mext_int_i === 1.U && MEIP === 0.U){
		MEIP := 1.U
  }.elsewhen(io.mext_int_i === 0.U && MEIP === 1.U){
		MEIP := 0.U
  } 
  
  val global_int_en = Mux(mstatus(3) === 1.U, 1.U ,0.U)
  /*---------------------------------------------------------------------*/	
  
  /*CSR读写--------------------------------------------------------------*/		
  //执行模块读csr寄存器
  when(io.re_i === 1.U){
    io.rd_o := MuxCase(0.U, Seq(
		(io.ra_i === CSR_MTVEC)    -> mtvec,
		(io.ra_i === CSR_MCAUSE)   -> mcause ,
		(io.ra_i === CSR_MEPC)     -> mepc   ,
		(io.ra_i === CSR_MSTATUS)  -> mstatus,
		(io.ra_i === CSR_MSCRATCH) -> mscratch,
		(io.ra_i === CSR_MIE)      -> mie,
		(io.ra_i === CSR_MIP)      -> mip))
  }.otherwise{
	io.rd_o := 0.U
  }
  
  //写回阶段写CSR寄存器
  when(io.we_i === 1.U){               
			switch(io.wa_i(11,0)){
				is(CSR_MTVEC   ) {mtvec    := io.wd_i}
				is(CSR_MCAUSE  ) {mcause   := io.wd_i}
				is(CSR_MEPC    ) {mepc     := io.wd_i}
				is(CSR_MSTATUS ) {mstatus  := io.wd_i}
				is(CSR_MSCRATCH) {mscratch := io.wd_i}
				is(CSR_MIE) {MTIE := io.wd_i(7)
                             MSIE := io.wd_i(3)
                             MEIE := io.wd_i(11)}
				is(CSR_MIP) {MTIP := io.wd_i(7)
                             MSIP := io.wd_i(3)
                             MEIP := io.wd_i(11)}
			}
   }	
  /*-----------------------------------------------------------------------*/	
  
  //判断当前要处理的异常/中断类型码,优先处理异常  
  //处理中断时传入的指令地址不能是0(传入0表示发生清空流水线，此时写入mepc寄存器的地址不正确 转移指令传入的pc也被清零，现在产生了一个bug jal/jalr单条指令循环时无法响应中断)
  //所有中断响应会延迟一个周期因为要先写MIP寄存器
  val exccode = MuxCase(EXC_NONE, Seq(
				 (io.exccode_i =/= EXC_NONE) -> io.exccode_i,
				 (global_int_en === 1.U && MSIE === 1.U && MSIP === 1.U && io.pc_i =/= 0.U) -> EXC_MSINT,
				 (global_int_en === 1.U && MTIE === 1.U && MTIP === 1.U && io.pc_i =/= 0.U) -> EXC_MTIMEINT,
				 (global_int_en === 1.U && MEIE === 1.U && MEIP === 1.U && io.pc_i =/= 0.U) -> EXC_MEXTINT))
  
  //根据异常信号生成清空流水线信号
  io.flush := Mux(exccode =/= EXC_NONE, 1.U ,0.U) //发生异常，发出清空流水线信号

  //异常处理与CSR寄存器更新
  when(exccode === EXC_NONE){         //无异常发生
		io.excaddr := 0.U
		
  }.elsewhen(exccode === EXC_MRET) {  //MRET指令异常，更新mstatus的MIP与MPIE位
		//从mepc定义的地址开始执行(包含定向前推)
		io.excaddr := Mux(io.we_i === 1.U && io.wa_i(11,0) === CSR_MEPC, io.wd_i, mepc)    
		//mstatus mpp位机器模式应当永远为11
		//打开全局中断，MIE的值被更新为当前MPIE的值,MPIE的更新为1
		mstatus := Cat(0.U(51.W),3.U(2.W),0.U(3.W),1.U(1.W),0.U(3.W),mstatus(7),0.U(3.W))  
		
  }.elsewhen(exccode === EXC_MTIMEINT){  //计时器中断
		io.excaddr := MuxCase(0.U, Seq(      //发出异常程序入口地址
							(mtvec(1,0) === 0.U) -> Cat(mtvec(63,2),0.U(2.W)),
							(mtvec(1,0) === 1.U) -> Cat(mtvec(63,2),0.U(2.W)) //还需要配置mode1模式
					  ))
		mcause := Cat(1.U(1.W),7.U(63.W))  //如果出现中断，最高位应当为1
		//mepc   := io.pc_i + 4.U            //如果出现中断 应当为pc+4   如果当前指令为j指令 写入跳转地址
	 	mepc   := Mux(io.jump_addr_i =/= 0.U,io.jump_addr_i, io.pc_i + 4.U)
		//关闭全局中断(MIE置0)，MPIE更新为异常发生前的MIE
		mstatus := Cat(0.U(51.W),3.U(2.W),0.U(3.W),mstatus(3),0.U(3.W),0.U(1.W),0.U(3.W)) 
		
  }.elsewhen(exccode === EXC_MSINT){   //软件中断
		io.excaddr := MuxCase(0.U, Seq(      //发出异常程序入口地址
							(mtvec(1,0) === 0.U) -> Cat(mtvec(63,2),0.U(2.W)),
							(mtvec(1,0) === 1.U) -> Cat(mtvec(63,2),0.U(2.W)) //还需要配置mode1模式
					  ))
		mcause := Cat(1.U(1.W),3.U(63.W))  //如果出现中断，最高位应当为1
		//mepc   := io.pc_i + 4.U             //如果出现中断 应当为pc+4
		mepc   := Mux(io.jump_addr_i =/= 0.U,io.jump_addr_i, io.pc_i + 4.U)
		//关闭全局中断(MIE置0)，MPIE更新为异常发生前的MIE
		mstatus := Cat(0.U(51.W),3.U(2.W),0.U(3.W),mstatus(3),0.U(3.W),0.U(1.W),0.U(3.W))  
		
  }.elsewhen(exccode === EXC_MEXTINT){  //外部中断
		io.excaddr := MuxCase(0.U, Seq(      //发出异常程序入口地址
							(mtvec(1,0) === 0.U) -> Cat(mtvec(63,2),0.U(2.W)),
							(mtvec(1,0) === 1.U) -> Cat(mtvec(63,2),0.U(2.W)) //还需要配置mode1模式
					  ))
		mcause := Cat(1.U(1.W),3.U(63.W))  //如果出现中断，最高位应当为1
		//mepc   := io.pc_i + 4.U             //如果出现中断 应当为pc+4
		mepc   := Mux(io.jump_addr_i =/= 0.U,io.jump_addr_i, io.pc_i + 4.U)
		//关闭全局中断(MIE置0)，MPIE更新为异常发生前的MIE
		mstatus := Cat(0.U(51.W),3.U(2.W),0.U(3.W),mstatus(3),0.U(3.W),0.U(1.W),0.U(3.W))  
					
  }.otherwise{                               //处理异常
		io.excaddr := MuxCase(0.U, Seq(      //发出异常程序入口地址
							(mtvec(1,0) === 0.U) -> Cat(mtvec(63,2),0.U(2.W)),
							(mtvec(1,0) === 1.U) -> Cat(mtvec(63,2),0.U(2.W)) //还需要配置mode1模式
					  ))
		mcause := Cat(0.U(60.W),io.exccode_i(3,0)) 
		mepc   := io.pc_i    
        //关闭全局中断(MIE置0)，MPIE更新为异常发生前的MIE		
		mstatus := Cat(0.U(51.W),3.U(2.W),0.U(3.W),mstatus(3),0.U(3.W),0.U(1.W),0.U(3.W))  
  }
}




