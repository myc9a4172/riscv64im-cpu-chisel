//memwb_reg  访存/写回寄存器模块

package myc01.core

import chisel3._
import chisel3.iotesters._
import define.myc01_core_define._

class memwb_reg extends Module {
  val io = IO(new Bundle {

	// from mem_stage
	val mem_wa          = Input(UInt(REG_ADDR_WIDTH))  //来自访存阶段的目的寄存器的地址 <5>
	val mem_wreg        = Input(UInt(1.W))             //来自访存阶段的目的寄存器写使能信号 <1>
	val mem_dreg        = Input(UInt(XLEN))            //来自访存阶段的待写入目的寄存器数据	<64>
	val mem_mreg        = Input(UInt(1.W))             //来自访存阶段的指令的存储器到寄存器使能信号 <1>
	val mem_dre         = Input(UInt(8.W))             //来自访存阶段的数据存储器DM的读字节使能信号	<8>
	val mem_load_unsign = Input(UInt(1.W))             //来自访存阶段的加载指令无符号扩展信号 <1>
	val mem_csr_we      = Input(UInt(1.W))             //来自访存阶段的写csr寄存器使能
	val mem_csr_wa      = Input(UInt(CSR_ADDR_WIDTH))  //来自访存阶段的写csr寄存器地址
	val mem_csr_wd      = Input(UInt(XLEN))            //来自访存阶段的写csr寄存器数据
	val mem_dm          = Input(UInt(XLEN))            //来自访存阶段的存储器数据
	val mem_big_endian  = Input(UInt(1.W))             //来自访存阶段的大小端标志信号 
	//from clint                                       
	val flush = Input(UInt(1.W))
	
	//from stall_ctrl
	val stall     = Input(UInt(5.W))       //来自stall_ctrl模块的流水线暂停信号 <4>
	
	//to wb_stage
	val wb_wa          = Output(UInt(REG_ADDR_WIDTH))   //送至写回阶段的目的寄存器的地址 <5>
	val wb_wreg        = Output(UInt(1.W))              //送至写回阶段的目的寄存器写使能信号 <1>
	val wb_dreg        = Output(UInt(XLEN))             //送至写回阶段的待写入目的寄存器数据	<64>
	val wb_mreg        = Output(UInt(1.W))              //送至写回阶段的指令的存储器到寄存器使能信号<1>
	val wb_dre         = Output(UInt(8.W))              //送至写回阶段的数据存储器DM的读字节使能信号	<8>
	val wb_load_unsign = Output(UInt(1.W))              //至写回阶段的加载指令无符号扩展信号 <1>
	val wb_csr_we      = Output(UInt(1.W))              //送至写回阶段的写csr寄存器使能
	val wb_csr_wa      = Output(UInt(CSR_ADDR_WIDTH))   //送至写回阶段的写csr寄存器地址
    val wb_csr_wd      = Output(UInt(XLEN))             //送至写回阶段的写csr寄存器数据
	val wb_dm          = Output(UInt(XLEN))             //送至写回阶段的存储器数据
	val wb_big_endian  = Output(UInt(1.W))              //
	
  })
	val wa_reg         = RegInit(0.U(REG_ADDR_WIDTH))   
	val wreg_reg       = RegInit(0.U(1.W)) 
	val dreg_reg       = RegInit(0.U(XLEN)) 
	val mreg_reg       = RegInit(0.U(1.W))  
    val dre_reg        = RegInit(0.U(8.W)) 
    val unsign_reg     = RegInit(0.U(1.W))  
	val csr_we_reg     = RegInit(0.U(1.W))
	val csr_wa_reg     = RegInit(0.U(CSR_ADDR_WIDTH)) 
	val csr_wd_reg     = RegInit(0.U(XLEN)) 
	val data_reg       = RegInit(0.U(XLEN))
    val big_endian_reg = RegInit(0.U(1.W))
	
	when(io.flush === 1.U){
		wa_reg         := 0.U
		wreg_reg       := 0.U
		dreg_reg       := 0.U
		mreg_reg       := 0.U
		dre_reg        := 0.U
		unsign_reg     := 0.U
		csr_we_reg     := 0.U
		csr_wa_reg     := 0.U
		csr_wd_reg     := 0.U
		data_reg       := 0.U
		big_endian_reg := 0.U
	}.elsewhen(io.stall(4) === 0.U){
		wa_reg         := io.mem_wa  
		wreg_reg       := io.mem_wreg
		dreg_reg       := io.mem_dreg 
		mreg_reg       := io.mem_mreg  
		dre_reg        := io.mem_dre
		unsign_reg     := io.mem_load_unsign
		csr_we_reg     := io.mem_csr_we
		csr_wa_reg     := io.mem_csr_wa
		csr_wd_reg     := io.mem_csr_wd
		data_reg       := io.mem_dm
		big_endian_reg := io.mem_big_endian
	}.otherwise{
		wa_reg         := wa_reg    
		wreg_reg       := wreg_reg  
		dreg_reg       := dreg_reg  
		mreg_reg       := mreg_reg  
		dre_reg        := dre_reg   
		unsign_reg     := unsign_reg
		csr_we_reg     := csr_we_reg
		csr_wa_reg     := csr_wa_reg
		csr_wd_reg     := csr_wd_reg
		data_reg       := data_reg 
		big_endian_reg := big_endian_reg
	}
	
    io.wb_wa          := wa_reg             
    io.wb_wreg        := wreg_reg 
    io.wb_dreg        := dreg_reg     
    io.wb_mreg        := mreg_reg              
    io.wb_dre         := dre_reg                 
    io.wb_load_unsign := unsign_reg
	io.wb_csr_we      := csr_we_reg
	io.wb_csr_wa      := csr_wa_reg
	io.wb_csr_wd      := csr_wd_reg  
	io.wb_dm          := data_reg 
	io.wb_big_endian  := big_endian_reg
}


