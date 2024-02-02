//idexe_reg  译码/执行寄存器模块

package myc01.core

import chisel3._
import chisel3.iotesters._
import define.myc01_core_define._

class idexe_reg extends Module {
  val io = IO(new Bundle {

	// from id_stage
	val id_pc        = Input(UInt(INST_ADDR_WIDTH))     //来自译码阶段的pc值 <64>
	val id_alutype   = Input(UInt(ALUTYPE_WIDTH))       //来自译码阶段的操作类型 <3>
	val id_aluop     = Input(UInt(ALUOP_WIDTH))         //来自译码阶段的内部操作码 <8> 
	val id_src1      = Input(UInt(XLEN))                //来自译码阶段的源操作数1 <64>
	val id_src2      = Input(UInt(XLEN))                //来自译码阶段的源操作数2 <64>
	val id_wa        = Input(UInt(REG_ADDR_WIDTH))      //来自译码阶段的目的寄存器地址 <5>
	val id_wreg      = Input(UInt(1.W))                 //来自译码阶段的目的寄存器写使能信号 <1>
	val id_mreg      = Input(UInt(1.W))                 //来自译码阶段的存储器到寄存器写使能信号 <1>
	val id_din       = Input(UInt(XLEN))                //来自译码阶段的待写入数据存储器中的数据 <64> 
	val id_csr_addr  = Input(UInt(CSR_ADDR_WIDTH))      //来自译码阶段的写csr寄存器地址 <12>
	val id_exccode   = Input(UInt(EXCCODE_WIDTH))       //来自译码阶段的异常类型码 <5>
	val id_jump_addr = Input(UInt(INST_ADDR_WIDTH))     //译码阶段计算出的转移指令跳转地址 <64>

	// to exe_stage
	val exe_pc        = Output(UInt(INST_ADDR_WIDTH))   //送至执行阶段的pc值 <64>
	val exe_alutype   = Output(UInt(ALUTYPE_WIDTH))     //送至执行阶段的操作类型 <3> 
	val exe_aluop     = Output(UInt(ALUOP_WIDTH))       //送至执行阶段的内部操作码 <8> 
	val exe_src1      = Output(UInt(XLEN))              //送至执行阶段的源操作数1 <64> 
	val exe_src2      = Output(UInt(XLEN))              //送至执行阶段的源操作数2 <64>
	val exe_wa        = Output(UInt(REG_ADDR_WIDTH))    //送至执行阶段的目的寄存器地址 <5>
	val exe_wreg      = Output(UInt(1.W))               //送至执行阶段的目的寄存器写使能信号 <1>
	val exe_mreg      = Output(UInt(1.W))               //送至执行阶段的存储器到寄存器写使能信号 <1>
	val exe_din       = Output(UInt(XLEN))              //送至执行阶段的待写入数据存储器中的数据 <64>
	val exe_csr_addr  = Output(UInt(CSR_ADDR_WIDTH))    //送至执行阶段的写csr寄存器地址 <12>
	val exe_exccode   = Output(UInt(EXCCODE_WIDTH))     //异常类型码 <5>
	val exe_jump_addr = Output(UInt(INST_ADDR_WIDTH))   //译码阶段计算出的转移指令跳转地址 <64>
	
	//from stall_ctrl
	val stall = Input(UInt(5.W))                 //来自ctrl模块的流水线暂停信号 <5>
	
	//from clint
	val flush = Input(UInt(1.W))
	
  })
    
	val pc_reg       = RegInit(0.U(INST_ADDR_WIDTH))
	val alutype_reg  = RegInit(0.U(ALUTYPE_WIDTH))  
	val aluop_reg    = RegInit(0.U(ALUOP_WIDTH)) 
	val src1_reg     = RegInit(0.U(XLEN))   
	val src2_reg     = RegInit(0.U(XLEN))
	val wa_reg       = RegInit(0.U(REG_ADDR_WIDTH))   
	val wreg_reg     = RegInit(0.U(1.W)) 
	val mreg_reg     = RegInit(0.U(1.W))  
	val din_reg      = RegInit(0.U(XLEN))  
	val csr_addr_reg = RegInit(0.U(CSR_ADDR_WIDTH))
	val exccode_reg  = RegInit(EXC_NONE)  
	val jump_addr_reg = RegInit(0.U(INST_ADDR_WIDTH))
	
	when(io.flush === 1.U){
		pc_reg        := 0.U
		alutype_reg   := 0.U
		aluop_reg	  := RV64I_SLL
		src1_reg 	  := 0.U
		src2_reg 	  := 0.U
		wa_reg   	  := 0.U
		wreg_reg 	  := 0.U
		mreg_reg 	  := 0.U 
		din_reg  	  := 0.U
		csr_addr_reg  := 0.U
		exccode_reg   := EXC_NONE
		jump_addr_reg := 0.U
	}.elsewhen(io.stall(2) === 1.U && io.stall(3) === 0.U){  
		pc_reg        := 0.U
		alutype_reg   := 0.U
		aluop_reg	  := RV64I_SLL
		src1_reg 	  := 0.U
		src2_reg 	  := 0.U
		wa_reg   	  := 0.U
		wreg_reg 	  := 0.U
		mreg_reg 	  := 0.U 
		din_reg  	  := 0.U
		csr_addr_reg  := 0.U
		exccode_reg   := EXC_NONE
		jump_addr_reg := 0.U
    }.elsewhen(io.stall(2) === 0.U){                   
		pc_reg        := io.id_pc    
        alutype_reg   := io.id_alutype                   
        aluop_reg     := io.id_aluop                   
        src1_reg      := io.id_src1                    
        src2_reg      := io.id_src2                     
        wa_reg        := io.id_wa                        
        wreg_reg      := io.id_wreg                       
        mreg_reg      := io.id_mreg                       
        din_reg       := io.id_din 
		csr_addr_reg  := io.id_csr_addr
		exccode_reg   := io.id_exccode
		jump_addr_reg := io.id_jump_addr
    }.otherwise{
		pc_reg := pc_reg
		alutype_reg   := alutype_reg 
		aluop_reg     := aluop_reg   
		src1_reg      := src1_reg    
		src2_reg      := src2_reg    
		wa_reg        := wa_reg      
		wreg_reg      := wreg_reg    
		mreg_reg      := mreg_reg    
		din_reg       := din_reg
        csr_addr_reg  := csr_addr_reg
		exccode_reg   := exccode_reg
		jump_addr_reg := jump_addr_reg
    }           

    io.exe_pc        := pc_reg  
    io.exe_alutype   := alutype_reg  
	io.exe_aluop     := aluop_reg 
    io.exe_src1      := src1_reg  
    io.exe_src2      := src2_reg  
	io.exe_wa        := wa_reg
	io.exe_wreg      := wreg_reg
	io.exe_mreg      := mreg_reg
	io.exe_din       := din_reg
	io.exe_csr_addr  := csr_addr_reg
	io.exe_exccode   := exccode_reg
	io.exe_jump_addr := jump_addr_reg
}
