//exemem_reg  执行/访存寄存器模块

package myc01.core

import chisel3._
import chisel3.iotesters._
import define.myc01_core_define._

class exemem_reg extends Module {
  val io = IO(new Bundle {

	// from exe_stage
	val exe_pc       = Input(UInt(INST_ADDR_WIDTH))    //来自执行阶段的pc <64>                       
	val exe_aluop    = Input(UInt(ALUOP_WIDTH))        //来自执行阶段的内部操作码 <8>
	val exe_wa       = Input(UInt(REG_ADDR_WIDTH))     //来自执行阶段的目的存储器的地址 <5>
	val exe_wreg     = Input(UInt(1.W))                //来自执行阶段的寄存器写使能信号 <1>
	val exe_wd       = Input(UInt(XLEN))               //来自执行阶段的待写入目的寄存器的数据 <64>
	val exe_mreg     = Input(UInt(1.W))                //来自执行阶段的存储器到寄存器使能信号 <1>
	val exe_din      = Input(UInt(XLEN))               //来自执行阶段的待写入存储器中的数据 <64>
	val exe_csr_we   = Input(UInt(1.W))                //来自执行阶段的写csr寄存器使能
	val exe_csr_wa   = Input(UInt(CSR_ADDR_WIDTH))     //来自执行阶段的写csr寄存器地址
	val exe_csr_wd   = Input(UInt(XLEN))               //来自执行阶段的写csr寄存器数据
	val exe_exccode  = Input(UInt(EXCCODE_WIDTH))      //来自执行阶段的exccode
    val exe_jump_addr= Input(UInt(INST_ADDR_WIDTH))    //来自执行阶段的跳转目标地址
	
	// to wb_stage
	val mem_pc       = Output(UInt(INST_ADDR_WIDTH))   //送往访存阶段的pc <64> 
	val mem_aluop    = Output(UInt(ALUOP_WIDTH))       //送往访存阶段的内部操作码 <8>
	val mem_wa       = Output(UInt(REG_ADDR_WIDTH))    //送往访存阶段的目的存储器的地址 <5>
	val mem_wreg     = Output(UInt(1.W))               //送往访存阶段的寄存器写使能信号 <1>
	val mem_wd       = Output(UInt(XLEN))              //送往访存阶段的待写入目的寄存器的数据 <64>
	val mem_mreg     = Output(UInt(1.W))               //送往访存阶段的存储器到寄存器使能信号 <1>
	val mem_din      = Output(UInt(XLEN))              //送往访存阶段的待写入存储器中的数据 <64>
	val mem_csr_we   = Output(UInt(1.W))               //送往访存阶段的写csr寄存器使能
	val mem_csr_wa   = Output(UInt(CSR_ADDR_WIDTH))    //送往访存阶段的写csr寄存器地址
	val mem_csr_wd   = Output(UInt(XLEN))              //送往访存阶段的写csr寄存器数据
	val mem_exccode  = Output(UInt(EXCCODE_WIDTH))     //送往访存阶段的exccode
	val mem_jump_addr= Output(UInt(INST_ADDR_WIDTH))   //送往访存阶段的跳转目标地址
	                                                
	//from stall_ctrl                               
	val stall     = Input(UInt(5.W))       //来自stall_ctrl模块的流水线暂停信号 <5>
	
	//from flush
	val flush = Input(UInt(1.W))  

  })

	val pc_reg        = RegInit(0.U(INST_ADDR_WIDTH)) 
    val aluop_reg     = RegInit(0.U(ALUOP_WIDTH))   
	val wa_reg        = RegInit(0.U(REG_ADDR_WIDTH)) 
	val wreg_reg      = RegInit(0.U(1.W))
	val wd_reg        = RegInit(0.U(XLEN)) 
	val mreg_reg      = RegInit(0.U(1.W))
	val din_reg       = RegInit(0.U(XLEN))
	val csr_we_reg    = RegInit(0.U(1.W))
	val csr_wa_reg    = RegInit(0.U(CSR_ADDR_WIDTH)) 
	val csr_wd_reg    = RegInit(0.U(XLEN)) 
	val exccode_reg   = RegInit(EXC_NONE) 
	val jump_addr_reg = RegInit(0.U(INST_ADDR_WIDTH))
	
	when(io.flush === 1.U){
		pc_reg        := 0.U
		aluop_reg     := RV64I_SLL
		wa_reg        := 0.U
		wreg_reg      := 0.U
		wd_reg        := 0.U
		mreg_reg      := 0.U
		din_reg       := 0.U
		csr_we_reg    := 0.U
		csr_wa_reg    := 0.U
		csr_wd_reg    := 0.U
		exccode_reg   := EXC_NONE
		jump_addr_reg := 0.U
	}.elsewhen(io.stall(3) === 1.U && io.stall(4) === 0.U){
		pc_reg        := 0.U
		aluop_reg     := RV64I_SLL
		wa_reg        := 0.U
		wreg_reg      := 0.U
		wd_reg        := 0.U
		mreg_reg      := 0.U
		din_reg       := 0.U
		csr_we_reg    := 0.U
		csr_wa_reg    := 0.U
		csr_wd_reg    := 0.U
		exccode_reg   := EXC_NONE
		jump_addr_reg := 0.U
	}.elsewhen(io.stall(3) === 0.U){  
		pc_reg        := io.exe_pc
		aluop_reg     := io.exe_aluop                  	  
        wa_reg        := io.exe_wa                      
        wreg_reg      := io.exe_wreg                  
        wd_reg        := io.exe_wd                    
        mreg_reg      := io.exe_mreg                    
        din_reg       := io.exe_din 
		csr_we_reg    := io.exe_csr_we
		csr_wa_reg    := io.exe_csr_wa
		csr_wd_reg    := io.exe_csr_wd
		exccode_reg   := io.exe_exccode
		jump_addr_reg := io.exe_jump_addr
	}.otherwise{
		pc_reg        := pc_reg
	    aluop_reg     := aluop_reg
		wa_reg        := wa_reg   
		wreg_reg      := wreg_reg 
		wd_reg        := wd_reg   
		mreg_reg      := mreg_reg 
		din_reg       := din_reg  
		csr_we_reg    := csr_we_reg
		csr_wa_reg    := csr_wa_reg
		csr_wd_reg    := csr_wd_reg    
		exccode_reg   := exccode_reg
		jump_addr_reg := jump_addr_reg
	}
	
	io.mem_pc        := pc_reg
    io.mem_aluop     := aluop_reg               
    io.mem_wa        := wa_reg               
    io.mem_wreg      := wreg_reg               
    io.mem_wd        := wd_reg                
    io.mem_mreg      := mreg_reg                 
    io.mem_din       := din_reg  
	io.mem_csr_we    := csr_we_reg
	io.mem_csr_wa    := csr_wa_reg
	io.mem_csr_wd    := csr_wd_reg    
	io.mem_exccode   := exccode_reg
	io.mem_jump_addr := jump_addr_reg
	
}




