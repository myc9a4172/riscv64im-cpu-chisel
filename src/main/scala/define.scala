//define 宏定义文件

package define

import chisel3._

 object myc01_core_define {
  //val ALU_Width = 8.U.getWidth
  //val ALU_ADD = 2.U(ALU_Width.W)   
  
  /*------------------- 全局参数 --------------------*/
    val ALUOP_WIDTH   = 8.W   //译码指令的类型宽度
	val ALUTYPE_WIDTH = 3.W   //译码指令的内部操作码宽度 
  
  /*------------------- 通用寄存器参数 ------------------*/
    val XLEN = 64.W               //通用寄存器数据宽度
    val REG_ADDR_WIDTH = 5.W      // 通用寄存器地址宽度
    val REG_NUM = 32              //通用寄存器数量
    val REG_ZERO = "b00000".U     //零号寄存器地址 

  /*------------------- 指令字参数 -------------------*/
    val INST_ADDR_WIDTH = 64.W   //指令的地址宽度
    val INST_WIDTH      = 32.W   //指令的数据宽度

  // 操作类型alutype
	val NOP   = "b000".U
	val ARITH = "b001".U
	val LOGIC = "b010".U
	val SHIFT = "b100".U
	val JUMP  = "b101".U
	val CSR   = "b110".U

  //NOP指令的指令码
    val INST_NOP  = "h00000013".U
    val ZERO_WORD = "h0000000000000000".U
  
  // 内部操作码aluop
  /*------------- RV64I --------------*/
    //R指令 
	val RV64I_ADD    = "h01".U
	val RV64I_SUB    = "h02".U
	val RV64I_SLL    = "h03".U
	val RV64I_SLT    = "h04".U
	val RV64I_SLTU   = "h05".U
	val RV64I_XOR    = "h06".U
	val RV64I_SRL    = "h07".U
	val RV64I_SRA    = "h08".U
	val RV64I_OR     = "h09".U
	val RV64I_AND    = "h0a".U
				    
	//I指令	        
	val RV64I_ADDI   = "h0b".U
	val RV64I_SLTI   = "h0c".U
	val RV64I_SLTIU  = "h0d".U
	val RV64I_XORI   = "h0e".U
	val RV64I_ORI    = "h0f".U
	val RV64I_ANDI   = "h10".U	
	val RV64I_SLLI   = "h11".U
	val RV64I_SRLI   = "h12".U
	val RV64I_SRAI   = "h13".U
	val RV64I_LB     = "h14".U
	val RV64I_LH     = "h15".U
	val RV64I_LW     = "h16".U
	val RV64I_LBU    = "h17".U
	val RV64I_LHU    = "h18".U
					 	  
	//S指令            
	val RV64I_SB     = "h19".U
	val RV64I_SH     = "h1a".U
	val RV64I_SW     = "h1b".U
				    
	//U指令         
	val RV64I_LUI    = "h1c".U
	val RV64I_AUIPC  = "h1d".U
				    
	//J指令         
	val RV64I_JAL    = "h1e".U 
					   
	//B指令          
	val RV64I_BEQ    = "h1f".U
	val RV64I_BNE    = "h20".U
	val RV64I_BLT    = "h21".U
	val RV64I_BGE    = "h22".U
	val RV64I_BLTU   = "h23".U
	val RV64I_BGEU   = "h24".U	
	val RV64I_JALR   = "h25".U
	
	/*------------ RV64M ---------------*/
	val RV64M_MUL    = "h26".U
	val RV64M_MULH   = "h27".U
	val RV64M_MULHSU = "h28".U
	val RV64M_MULHU  = "h29".U
	val RV64M_DIV    = "h2a".U
	val RV64M_DIVU   = "h2b".U
	val RV64M_REM    = "h2c".U
	val RV64M_REMU   = "h2d".U
	
	/*-----------特权指令----------------*/
	val RV64I_CSRRW  = "h2e".U
	val RV64I_CSRRS  = "h2f".U
	val RV64I_CSRRC  = "h30".U
	val RV64I_CSRRWI = "h31".U
	val RV64I_CSRRSI = "h32".U
	val RV64I_CSRRCI = "h33".U
	
	val RV64I_ECALL  = "h34".U
	val RV64I_EBREAK = "h35".U
	val RV64I_MRET   = "h36".U
	
	/*------------ RV64I --------------*/
	val RV64I_LWU    = "h37".U
 	val RV64I_LD     = "h38".U
	val RV64I_SD     = "h39".U
	val RV64I_ADDIW  = "h3a".U
	val RV64I_SLLIW  = "h3b".U
	val RV64I_SRLIW  = "h3c".U
	val RV64I_SRAIW  = "h3d".U
	val RV64I_ADDW   = "h3e".U
	val RV64I_SUBW   = "h3f".U
	val RV64I_SLLW   = "h40".U
	val RV64I_SRLW   = "h41".U
	val RV64I_SRAW   = "h42".U
	
	/*------------- RV64M ---------------*/
	val RV64M_MULW   = "h43".U
	val RV64M_DIVW   = "h44".U
	val RV64M_DIVUW  = "h45".U
	val RV64M_REMW   = "h46".U
	val RV64M_REMUW  = "h47".U
	
	/*------------- fence.i ---------------*/
	val RV64I_FENCEI = "h48".U
	
	/*------------------- CSR寄存器 -------------------*/
	val CSR_ADDR_WIDTH = 12.W
	//特权架构规定的CSR寄存器地址
	val CSR_MTVEC    = "h305".U 
	val CSR_MCAUSE   = "h342".U 
	val CSR_MEPC     = "h341".U 
	val CSR_MTVAL    = "h343".U 
	val CSR_MSTATUS  = "h300".U 
	val CSR_MSCRATCH = "h340".U 
	val CSR_MIE      = "h304".U
    val CSR_MIP      = "h344".U

	/*------------------- 中断与异常 -------------------*/
	val EXCCODE_WIDTH =5.W
	//异常编码  
	val EXC_NONE     = "b11111".U   //无异常             
    val EXC_MRET     = "b11110".U   //MRET指令引起的异常 mert
	val EXC_II       = "b00010".U   //非法指令           illegal instruction
	val EXC_BP       = "b00011".U   //断点               breakpoint
	val EXC_LAM      = "b00100".U   //加载指令地址未对齐 load address misaligned
	val EXC_SAM      = "b00110".U   //访存指令地址未对齐 store address misaligned
	val EXC_MECALL   = "b01011".U   //机器模式系统调用   Enviromnent call from M-mode
	val EXC_MSINT    = "b10011".U   //机器模式软件中断   machine software interrupt
	val EXC_MTIMEINT = "b10111".U   //机器模式计时器中断 machien timer interrupt
	val EXC_MEXTINT  = "b11011".U   //机器模式外部中断   machine external interrupt
	
	//clint模块寄存器映射地址
	val MSIP_ADDR     = "h0000000002000000".U //软件中断寄存器映射地址
	val MTIMECMP_ADDR = "h0000000002004000".U //计时器中断比较寄存器映射地址
	val MTIME_ADDR    = "h000000000200bff8".U //计时器寄存器映射地址
	
	//plic模块寄存器映射地址
	val PLIC_CLAIM_COMPLETE = "h000000000c200004".U
	
	/*------------------- AXI接口 -------------------*/
	val GPIO_ADDR = "h8000000010012".U
	val UART_ADDR = "h8000000010013".U
	
  }