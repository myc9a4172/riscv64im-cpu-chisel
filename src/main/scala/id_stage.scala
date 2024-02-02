//id_stage  译码模块

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import define.myc01_core_define._

class id_stage extends Module {
  val io = IO(new Bundle {
  //from ifid_reg
	val id_pc_i       = Input(UInt(INST_ADDR_WIDTH))  //取指阶段传入的PC值 <64> 
	val BTB_false_i   = Input(UInt(1.W))              //取指阶段传入的BTB_false冲刷信号 <1>
   
  //from inst_rom
	val id_inst_i     = Input(UInt(INST_WIDTH))      //取指阶段发射的指令   <32> 
  
  //regfile    
  	val rreg1         = Output(UInt(1.W))            //通用寄存器堆读端口1读使能信号 <1>
	val ra1           = Output(UInt(REG_ADDR_WIDTH)) //通用寄存器堆读端口1读地址信号 <5>
	val rreg2         = Output(UInt(1.W))            //通用寄存器堆读端口2读使能信号 <1>
	val ra2           = Output(UInt(REG_ADDR_WIDTH)) //通用寄存器堆读端口2读地址信号 <5>
	val rd1           = Input(UInt(XLEN))            //从通用寄存器堆读端口1读出的数据 <64>
	val rd2           = Input(UInt(XLEN))            //从通用寄存器堆读端口2读出的数据 <64> 
	
  //to idexe_reg
	val id_pc_o       = Output(UInt(INST_ADDR_WIDTH)) //送往执行阶段的PC值 <64>
	val id_alutype_o  = Output(UInt(ALUTYPE_WIDTH))   //送往执行阶段的指令的类型 <3>
	val id_aluop_o    = Output(UInt(ALUOP_WIDTH))     //送往执行阶段的指令的内部操作码 <8> 
	val id_wa_o       = Output(UInt(REG_ADDR_WIDTH))  //送往执行阶段的指令待写入目的寄存器的地址 <5>
	val id_wreg_o     = Output(UInt(1.W))             //送往执行阶段的指令的通用寄存器堆使能信号 <1>
	val id_mreg_o     = Output(UInt(1.W))             //送往执行阶段的指令的存储器到寄存器使能的信号 <1>
	val id_din_o      = Output(UInt(XLEN))            //送往执行阶段的指令待写入数据存储器的数据 <64>
	val id_src1_o     = Output(UInt(XLEN))            //送往执行阶段的指令的源操作数1 <64>
	val id_src2_o     = Output(UInt(XLEN))            //送往执行阶段的指令的源操作数2 <64>

  /*通用寄存器定向前推信号--------------------------------------*/
	//从执行阶段获得的寄存器写回信号
	val exe2id_wreg  = Input(UInt(1.W))  
	val exe2id_wa    = Input(UInt(REG_ADDR_WIDTH)) 
	val exe2id_wd    = Input(UInt(XLEN)) 
    //从访存阶段获得的寄存器写回信号
    val mem2id_wreg  = Input(UInt(1.W))  
	val mem2id_wa    = Input(UInt(REG_ADDR_WIDTH))  
	val mem2id_wd    = Input(UInt(XLEN))  
	//从执行和访存阶段获得的存储器到寄存器使能信号(表明对应阶段执行加载指令)
	val exe2id_mreg = Input(UInt(1.W))
	val mem2id_mreg = Input(UInt(1.W))
  /*--------------------------------------------------------------*/	
  
  //回传取指阶段的转移指令信号
	val jump_addr = Output(UInt(INST_ADDR_WIDTH))   //传给取值阶段的跳转目标地址 <64>
    val jump_flag = Output(UInt(1.W))               //传给取值阶段的跳转指令信号 <1>
    val jump_inst = Output(UInt(1.W))               //传给取值阶段的指令是跳转指令 <1>
    
  //译码阶段发出的请求暂停信号
	val stallreq_id = Output(UInt(1.W))
	
  //取指阶段输入的当前指令BTB_hit情况
	val BTB_hit_i = Input(UInt(2.W))      
	val BTB_hit_o = Output(UInt(2.W))
	
  //CSR寄存器信号
	val csr_addr_o   = Output(UInt(CSR_ADDR_WIDTH))  //CSR寄存器读写地址 <12>
	val id_exccode_o = Output(UInt(EXCCODE_WIDTH))   //译码阶段异常类型代码输出 <5>
	
  //from clint
	val flush = Input(UInt(1.W))
  })
  
  //直接传递
    io.id_pc_o   := Mux(io.BTB_false_i === 1.U, 0.U, io.id_pc_i) //如果分支预测错误则指令地址清零 
	io.BTB_hit_o := Mux(io.id_inst_i =/= 0.U, io.BTB_hit_i, "b10".U)

  //组织指令字 如果收到冲刷信号则直接插入NOP指令冲刷译码模块
    val id_inst = Mux(io.BTB_false_i === 1.U|io.flush === 1.U,INST_NOP,io.id_inst_i)

  //取出32位指令的关键编码段
	val opcode = id_inst(6,0) 
	val rd     = id_inst(11,7)
    val func3  = id_inst(14,12)
    val rs1    = id_inst(19,15)
	val rs2    = id_inst(24,20)
	val func7  = id_inst(31,25)
    val imm_I  = id_inst(31,20)
	val shamt  = id_inst(25,20)
	val imm_S  = Cat(id_inst(31,25),id_inst(11,7))
	val imm_U  = id_inst(31,12)
	val imm_J  = Cat(id_inst(31),id_inst(19,12),id_inst(20),id_inst(30,21),0.U)
	val imm_B  = Cat(id_inst(31),id_inst(7),id_inst(30,25),id_inst(11,8),0.U)
	val csr    = id_inst(31,20)
	val zimm   = id_inst(19,15)
	
  //第一级译码逻辑：确定当前需要译码的指令
  //RV64I 
	//R指令
    val inst_add   = (opcode === "b0110011".U) && (func3 === "b000".U) && (func7 === "b0000000".U)
    val inst_sub   = (opcode === "b0110011".U) && (func3 === "b000".U) && (func7 === "b0100000".U)
  	val inst_sll   = (opcode === "b0110011".U) && (func3 === "b001".U) && (func7 === "b0000000".U)
	val inst_slt   = (opcode === "b0110011".U) && (func3 === "b010".U) && (func7 === "b0000000".U)
	val inst_sltu  = (opcode === "b0110011".U) && (func3 === "b011".U) && (func7 === "b0000000".U)
	val inst_xor   = (opcode === "b0110011".U) && (func3 === "b100".U) && (func7 === "b0000000".U)
	val inst_srl   = (opcode === "b0110011".U) && (func3 === "b101".U) && (func7 === "b0000000".U)
	val inst_sra   = (opcode === "b0110011".U) && (func3 === "b101".U) && (func7 === "b0100000".U)
	val inst_or    = (opcode === "b0110011".U) && (func3 === "b110".U) && (func7 === "b0000000".U)
	val inst_and   = (opcode === "b0110011".U) && (func3 === "b111".U) && (func7 === "b0000000".U)
    
	//I指令	
    val inst_addi  = (opcode === "b0010011".U) && (func3 === "b000".U)
	val inst_slti  = (opcode === "b0010011".U) && (func3 === "b010".U)
	val inst_sltiu = (opcode === "b0010011".U) && (func3 === "b011".U)
	val inst_xori  = (opcode === "b0010011".U) && (func3 === "b100".U)
	val inst_ori   = (opcode === "b0010011".U) && (func3 === "b110".U)
	val inst_andi  = (opcode === "b0010011".U) && (func3 === "b111".U)	
	val inst_slli  = (opcode === "b0010011".U) && (func3 === "b001".U) && (func7(6,1) === "b000000".U) 
	val inst_srli  = (opcode === "b0010011".U) && (func3 === "b101".U) && (func7(6,1) === "b000000".U) 
	val inst_srai  = (opcode === "b0010011".U) && (func3 === "b101".U) && (func7(6,1) === "b010000".U) 	
	val inst_lb    = (opcode === "b0000011".U) && (func3 === "b000".U)
	val inst_lh    = (opcode === "b0000011".U) && (func3 === "b001".U)
	val inst_lw    = (opcode === "b0000011".U) && (func3 === "b010".U)
	val inst_lbu   = (opcode === "b0000011".U) && (func3 === "b100".U)
	val inst_lhu   = (opcode === "b0000011".U) && (func3 === "b101".U)
	val inst_jalr  = (opcode === "b1100111".U) && (func3 === "b000".U)
	
	//S指令
	val inst_sb    = (opcode === "b0100011".U) && (func3 === "b000".U)
	val inst_sh    = (opcode === "b0100011".U) && (func3 === "b001".U)
	val inst_sw    = (opcode === "b0100011".U) && (func3 === "b010".U)
	
	//U指令
	val inst_lui   = (opcode === "b0110111".U) 
	val inst_auipc = (opcode === "b0010111".U) 
	
	//J指令
	val inst_jal   = (opcode === "b1101111".U) 
	
	//B指令
    val inst_beq   = (opcode === "b1100011".U) && (func3 === "b000".U)
    val inst_bne   = (opcode === "b1100011".U) && (func3 === "b001".U)
    val inst_blt   = (opcode === "b1100011".U) && (func3 === "b100".U)
    val inst_bge   = (opcode === "b1100011".U) && (func3 === "b101".U)
    val inst_bltu  = (opcode === "b1100011".U) && (func3 === "b110".U)
    val inst_bgeu  = (opcode === "b1100011".U) && (func3 === "b111".U)
	
	//CSR
	val inst_csrrw  = (opcode === "b1110011".U) && (func3 === "b001".U)
	val inst_csrrs  = (opcode === "b1110011".U) && (func3 === "b010".U)
	val inst_csrrc  = (opcode === "b1110011".U) && (func3 === "b011".U)
	val inst_csrrwi = (opcode === "b1110011".U) && (func3 === "b101".U)
	val inst_csrrsi = (opcode === "b1110011".U) && (func3 === "b110".U)
	val inst_csrrci = (opcode === "b1110011".U) && (func3 === "b111".U)
	
	//系统指令
	val inst_ecall  = (opcode === "b1110011".U) && (func3 === "b000".U) && (csr === "b000000000000".U)
	val inst_ebreak = (opcode === "b1110011".U) && (func3 === "b000".U) && (csr === "b000000000001".U)
	val inst_mret   = (opcode === "b1110011".U) && (func3 === "b000".U) && (csr === "b001100000010".U)
	
	//fence指令
	val inst_fencei = (opcode === "b0001111".U) && (func3 === "b001".U) && (func7 === "b0000000".U)
	
  //RV64M 
    //乘法指令
	val inst_mul    = (opcode === "b0110011".U) && (func3 === "b000".U) && (func7 === "b0000001".U)
	val inst_mulh   = (opcode === "b0110011".U) && (func3 === "b001".U) && (func7 === "b0000001".U)
	val inst_mulhsu = (opcode === "b0110011".U) && (func3 === "b010".U) && (func7 === "b0000001".U)
	val inst_mulhu  = (opcode === "b0110011".U) && (func3 === "b011".U) && (func7 === "b0000001".U)
	
	//除法指令
	val inst_div   = (opcode === "b0110011".U) && (func3 === "b100".U) && (func7 === "b0000001".U)
	val inst_divu  = (opcode === "b0110011".U) && (func3 === "b101".U) && (func7 === "b0000001".U)
	val inst_rem   = (opcode === "b0110011".U) && (func3 === "b110".U) && (func7 === "b0000001".U)
	val inst_remu  = (opcode === "b0110011".U) && (func3 === "b111".U) && (func7 === "b0000001".U)
  
  //RV64扩展
    val inst_lwu   = (opcode === "b0000011".U) && (func3 === "b110".U)
	val inst_ld    = (opcode === "b0000011".U) && (func3 === "b011".U)
	val inst_sd    = (opcode === "b0100011".U) && (func3 === "b011".U)
	
	val inst_addiw = (opcode === "b0011011".U) && (func3 === "b000".U) 
	val inst_slliw = (opcode === "b0011011".U) && (func3 === "b001".U) && (func7 === "b0000000".U) 
	val inst_srliw = (opcode === "b0011011".U) && (func3 === "b101".U) && (func7 === "b0000000".U) 
	val inst_sraiw = (opcode === "b0011011".U) && (func3 === "b101".U) && (func7 === "b0100000".U) 	
	val inst_addw  = (opcode === "b0111011".U) && (func3 === "b000".U) && (func7 === "b0000000".U)
	val inst_subw  = (opcode === "b0111011".U) && (func3 === "b000".U) && (func7 === "b0100000".U)
	val inst_sllw  = (opcode === "b0111011".U) && (func3 === "b001".U) && (func7 === "b0000000".U)
	val inst_srlw  = (opcode === "b0111011".U) && (func3 === "b101".U) && (func7 === "b0000000".U)
	val inst_sraw  = (opcode === "b0111011".U) && (func3 === "b101".U) && (func7 === "b0100000".U)
	
	val inst_mulw  = (opcode === "b0111011".U) && (func3 === "b000".U) && (func7 === "b0000001".U)
	val inst_divw  = (opcode === "b0111011".U) && (func3 === "b100".U) && (func7 === "b0000001".U)
	val inst_divuw = (opcode === "b0111011".U) && (func3 === "b101".U) && (func7 === "b0000001".U)
	val inst_remw  = (opcode === "b0111011".U) && (func3 === "b110".U) && (func7 === "b0000001".U)
	val inst_remuw = (opcode === "b0111011".U) && (func3 === "b111".U) && (func7 === "b0000001".U)

  
  //第二级译码逻辑：生成具体控制信号 
	//ALU操作类型alutype
	/*NOP   b000;
	  ARITH b001;  算数
	  LOGIC b010;  逻辑
	  SHIFT b100;  移位
	  JUMP  b101;  跳转jal/jalr
	  CSR   b110;
	*/
	val id_alutype_temp = Wire(Vec(3,UInt(1.W)))
	
	id_alutype_temp(2) :=  inst_sll   | inst_srl   | inst_sra |
						   inst_slli  | inst_srli  | inst_srai|
						   inst_jal   | inst_jalr  |
						   inst_csrrw | inst_csrrs | inst_csrrc | inst_csrrwi | inst_csrrsi | inst_csrrci |
						   inst_sllw  | inst_srlw  | inst_sraw  | inst_slliw  | inst_srliw  | inst_sraiw
						   
	id_alutype_temp(1) :=  inst_and   | inst_or    | inst_xor   |
	                       inst_andi  | inst_ori   | inst_xori  |
						   inst_csrrw | inst_csrrs | inst_csrrc | inst_csrrwi | inst_csrrsi | inst_csrrci
						   
	id_alutype_temp(0) :=  inst_add   | inst_sub   | inst_slt   | inst_sltu |
	                       inst_addi  | inst_slti  | inst_sltiu |
						   inst_lb    | inst_lh    | inst_lw    | inst_lbu  | inst_lhu | inst_lwu | inst_ld |			   				   
	                       inst_sb    | inst_sh    | inst_sw    | inst_sd   |
                           inst_lui	  | inst_auipc |            
                           inst_jal	  | inst_jalr  |
						   inst_mul   | inst_mulh  | inst_mulhsu | inst_mulhu | inst_mulw |
					       inst_div   | inst_divu  | inst_rem    | inst_remu  |
						   inst_divw  | inst_divuw | inst_remw   | inst_remuw | inst_addiw | inst_addw  | inst_subw
		   
	io.id_alutype_o := id_alutype_temp.asUInt()
	
	//非法指令判断(传入的指令不为0，且非目前实现的指令)
	val illegal_instruction = (id_inst =/= 0.U) && (io.id_aluop_o === 0.U) && 
	                          (io.jump_inst === 0.U) && ((inst_ecall|inst_ebreak|inst_mret) === 0.U)  

    // ALU内部操作码aluop	
	io.id_aluop_o := MuxCase("b0000000".U,Seq(
      (inst_add    === 1.U) -> RV64I_ADD   ,
      (inst_sub    === 1.U) -> RV64I_SUB   ,
	  (inst_sll    === 1.U) -> RV64I_SLL   ,
	  (inst_slt    === 1.U) -> RV64I_SLT   ,
	  (inst_sltu   === 1.U) -> RV64I_SLTU  ,
	  (inst_xor    === 1.U) -> RV64I_XOR   ,
	  (inst_srl    === 1.U) -> RV64I_SRL   ,
	  (inst_sra    === 1.U) -> RV64I_SRA   ,
	  (inst_or     === 1.U) -> RV64I_OR    ,
	  (inst_and    === 1.U) -> RV64I_AND   ,
	  (inst_addi   === 1.U) -> RV64I_ADDI  ,
      (inst_slti   === 1.U) -> RV64I_SLTI  ,
	  (inst_sltiu  === 1.U) -> RV64I_SLTIU ,
	  (inst_xori   === 1.U) -> RV64I_XORI  ,
	  (inst_ori    === 1.U) -> RV64I_ORI   ,
	  (inst_andi   === 1.U) -> RV64I_ANDI  ,  
	  (inst_slli   === 1.U) -> RV64I_SLLI  ,
	  (inst_srli   === 1.U) -> RV64I_SRLI  ,
	  (inst_srai   === 1.U) -> RV64I_SRAI  ,
	  (inst_lb     === 1.U) -> RV64I_LB    ,
	  (inst_lh     === 1.U) -> RV64I_LH    ,
	  (inst_lw     === 1.U) -> RV64I_LW    ,
	  (inst_lbu    === 1.U) -> RV64I_LBU   ,
	  (inst_lhu    === 1.U) -> RV64I_LHU   ,
	  (inst_sb     === 1.U) -> RV64I_SB    ,
	  (inst_sh     === 1.U) -> RV64I_SH    ,
	  (inst_sw     === 1.U) -> RV64I_SW    ,
	  (inst_lui    === 1.U) -> RV64I_LUI   ,
	  (inst_auipc  === 1.U) -> RV64I_AUIPC ,
	  (inst_jal    === 1.U) -> RV64I_JAL   ,
	  (inst_jalr   === 1.U) -> RV64I_JALR  ,
	  (inst_beq    === 1.U) -> RV64I_BEQ   ,
	  (inst_bne    === 1.U) -> RV64I_BNE   ,
	  (inst_blt    === 1.U) -> RV64I_BLT   ,
	  (inst_bge    === 1.U) -> RV64I_BGE   ,
	  (inst_bltu   === 1.U) -> RV64I_BLTU  ,
	  (inst_bgeu   === 1.U) -> RV64I_BGEU  ,
	  (inst_mul    === 1.U) -> RV64M_MUL   ,
	  (inst_mulh   === 1.U) -> RV64M_MULH  ,
	  (inst_mulhsu === 1.U) -> RV64M_MULHSU,
	  (inst_mulhu  === 1.U) -> RV64M_MULHU ,
	  (inst_div    === 1.U) -> RV64M_DIV   ,
	  (inst_divu   === 1.U) -> RV64M_DIVU  ,
	  (inst_rem    === 1.U) -> RV64M_REM   ,
	  (inst_remu   === 1.U) -> RV64M_REMU  ,
	  (inst_csrrw  === 1.U) -> RV64I_CSRRW ,
	  (inst_csrrs  === 1.U) -> RV64I_CSRRS ,
	  (inst_csrrc  === 1.U) -> RV64I_CSRRC ,
	  (inst_csrrwi === 1.U) -> RV64I_CSRRWI,
	  (inst_csrrsi === 1.U) -> RV64I_CSRRSI,
	  (inst_csrrci === 1.U) -> RV64I_CSRRCI,
	  (inst_lwu    === 1.U) -> RV64I_LWU   ,
	  (inst_ld     === 1.U) -> RV64I_LD    ,
	  (inst_sd     === 1.U) -> RV64I_SD    ,
      (inst_addiw  === 1.U) -> RV64I_ADDIW ,
	  (inst_addw   === 1.U) -> RV64I_ADDW  ,
	  (inst_subw   === 1.U) -> RV64I_SUBW  ,
	  (inst_sllw   === 1.U) -> RV64I_SLLW  ,
	  (inst_srlw   === 1.U) -> RV64I_SRLW  ,
	  (inst_sraw   === 1.U) -> RV64I_SRAW  ,
      (inst_slliw  === 1.U) -> RV64I_SLLIW ,
	  (inst_srliw  === 1.U) -> RV64I_SRLIW ,
	  (inst_sraiw  === 1.U) -> RV64I_SRAIW ,
	  (inst_mulw   === 1.U) -> RV64M_MULW  ,
	  (inst_divw   === 1.U) -> RV64M_DIVW  ,
	  (inst_divuw  === 1.U) -> RV64M_DIVUW ,
	  (inst_remw   === 1.U) -> RV64M_REMW  ,
	  (inst_remuw  === 1.U) -> RV64M_REMUW 
    ))
	
	/*立即数与扩展模块---------------------------------------------------------------------*/			
	// I指令立即数使能信号
	val imm_Itype  =  inst_addi | inst_slti | inst_sltiu | inst_andi | inst_ori  | inst_xori  |
				      inst_lb   | inst_lh   | inst_lw    | inst_lbu  | inst_lhu |  inst_lwu | inst_ld |	
                      inst_jalr | inst_addiw					  
	             					        
    // I指令位移量立即数使能信号				   
	val imm_shamt  =  inst_slli | inst_srli | inst_srai | inst_slliw | inst_srliw | inst_sraiw 	
	
	// S指令立即数使能信号
	val imm_Stype  =  inst_sb   | inst_sh   | inst_sw  | inst_sd
	
	// U指令立即数使能信号
	val imm_Utype  =  inst_lui	| inst_auipc
	
	// J指令立即数使能信号
	val imm_Jtype  =  inst_jal
	
	// B指令立即数使能信号
	val imm_Btype  =  inst_beq | inst_bne | inst_blt | inst_bge | inst_bltu | inst_bgeu
	
	// 扩展指令操作所需的立即数(有符号扩展为64位) 
	val imm_ext = {
	    val sign64 = WireInit(0.S(64.W))
		sign64 := MuxCase ( 0.S , Seq(              //MuxCase中只能支持UInt/SInt一种类型，需要统一为SInt
		          (imm_Itype === 1.U) -> imm_I.asSInt(),
				  (imm_Stype === 1.U) -> imm_S.asSInt(),
				  (imm_shamt === 1.U) -> Cat(0.U(58.W), shamt).asSInt(),
                  (imm_Utype === 1.U) -> imm_U.asSInt(),
				  (imm_Jtype === 1.U) -> imm_J.asSInt(),
				  (imm_Btype === 1.U) -> imm_B.asSInt()
        ))				  
		sign64.asUInt()	  
	}
	/*--------------------------------------------------------------------------------------*/
	// 写通用寄存器使能信号 
    io.id_wreg_o  :=  (inst_add    | inst_sub    | inst_slt    | inst_sltu |
	                   inst_and    | inst_or     | inst_xor    | 
					   inst_sll    | inst_srl    | inst_sra    | 
					   inst_addi   | inst_slti   | inst_sltiu  |
					   inst_andi   | inst_ori    | inst_xori   |
                       inst_slli   | inst_srli   | inst_srai   |
					   inst_lb     | inst_lh     | inst_lw     | inst_lbu   | inst_lhu | inst_lwu | inst_ld |
					   inst_lui	   | inst_auipc  |
					   inst_jal    | inst_jalr   |
					   inst_mul    | inst_mulh   | inst_mulhsu | inst_mulhu | inst_mulw| 
					   inst_div    | inst_divu   | inst_rem    | inst_remu  |
					   inst_divw   | inst_divuw  | inst_remw   | inst_remuw |
					   inst_csrrw  | inst_csrrs  | inst_csrrc  | 
					   inst_csrrwi | inst_csrrsi | inst_csrrci |
					   inst_addiw | inst_addw | inst_subw | inst_sllw | inst_srlw |inst_sraw | inst_slliw | inst_srliw | inst_sraiw
					   ) && (io.id_wa_o =/= REG_ZERO) //如果写0号寄存器并且使能了会导致后面涉及到x0指令定向前推出问题
	
    // 加载指令存储器到寄存器使能信号(用于写回阶段)
    io.id_mreg_o := inst_lb  | inst_lh  | inst_lw  | inst_lbu  | inst_lhu | inst_lwu | inst_ld
	
	// 读通用寄存器堆端口1使能信号
    io.rreg1  :=  inst_add   | inst_sub   | inst_slt    | inst_sltu |
	              inst_and   | inst_or    | inst_xor    | 
				  inst_sll   | inst_srl   | inst_sra    | 
				  inst_addi  | inst_slti  | inst_sltiu  | 
				  inst_andi  | inst_ori   | inst_xori   | 
                  inst_slli  | inst_srli  | inst_srai   |
                  inst_lb    | inst_lh    | inst_lw     | inst_lbu  | inst_lhu  | inst_lwu | inst_ld |			   				   
	              inst_sb    | inst_sh    | inst_sw     | inst_sd   |
                  inst_beq   | inst_bne   | inst_blt    | inst_bge  | inst_bltu | inst_bgeu |
                  inst_jalr  |            
                  inst_mul   | inst_mulh  | inst_mulhsu | inst_mulhu | inst_mulw |
                  inst_div   | inst_divu  | inst_rem    | inst_remu  |
				  inst_divw  | inst_divuw | inst_remw   | inst_remuw |
                  inst_csrrw | inst_csrrs | inst_csrrc  | 
                  inst_addiw | inst_addw  | inst_subw   | inst_sllw | inst_srlw |inst_sraw | inst_slliw | inst_srliw | inst_sraiw
			  
				   
    // 读通用寄存器堆读端口2使能信号
    io.rreg2  :=  inst_add  | inst_sub  | inst_slt  | inst_sltu |
	              inst_and  | inst_or   | inst_xor  |
	              inst_sll  | inst_srl  | inst_sra  |
				  inst_sb   | inst_sh   | inst_sw   | inst_sd |
				  inst_beq  | inst_bne  | inst_blt  | inst_bge  | inst_bltu | inst_bgeu |
				  inst_mul  | inst_mulh | inst_mulhsu | inst_mulhu | inst_mulw |
				  inst_div  | inst_divu | inst_rem    | inst_remu |
				  inst_divw | inst_divuw | inst_remw | inst_remuw |
				  inst_addw | inst_subw | inst_sllw | inst_srlw |inst_sraw
	
    /*定向前推-------------------------------------------------------------------------------------------*/	
	//定向前推的源操作数选择信号
	val fwrd_reg1 = MuxCase( "b00".U, Seq(
	            (io.exe2id_wreg === 1.U && io.exe2id_wa === io.ra1 && io.rreg1 === 1.U) -> "b01".U, 
				(io.mem2id_wreg === 1.U && io.mem2id_wa === io.ra1 && io.rreg1 === 1.U) -> "b10".U,
				(io.rreg1 === 1.U) -> "b11".U
	))
	
	val fwrd_reg2 = MuxCase( "b00".U, Seq(
	            (io.exe2id_wreg === 1.U && io.exe2id_wa === io.ra2 && io.rreg2 === 1.U) -> "b01".U,
				(io.mem2id_wreg === 1.U && io.mem2id_wa === io.ra2 && io.rreg2 === 1.U) -> "b10".U,
				(io.rreg2 === 1.U) -> "b11".U
	))
	/*---------------------------------------------------------------------------------------------------*/
    // 读通用寄存器堆端口1的地址为rs1字段，读端口2的地址为rs2字段
	io.ra1 := rs1
	io.ra2 := rs2
	
	// 获得待写入目的寄存器的地址
	io.id_wa_o := rd
	
	// 获得访存阶段要存入数据存储器的数据(来自通用寄存器堆读数据端口2)
	io.id_din_o := MuxCase( 0.U , Seq(
	            (fwrd_reg2 === "b01".U ) -> io.exe2id_wd,
				(fwrd_reg2 === "b10".U ) -> io.mem2id_wd,		 
			    (fwrd_reg2 === "b11".U ) -> io.rd2
	))
	
	// 获得源操作数
	io.id_src1_o := MuxCase( 0.U , Seq(
	            (inst_csrrwi | inst_csrrsi | inst_csrrci === 1.U) -> Cat(0.U(27.W),zimm),
                (fwrd_reg1 === "b01".U) -> io.exe2id_wd,
				(fwrd_reg1 === "b10".U) -> io.mem2id_wd,			 
		        (fwrd_reg1 === "b11".U) -> io.rd1
	))
    
	io.id_src2_o := MuxCase( 0.U , Seq(
	            (imm_Itype === 1.U || imm_shamt === 1.U || imm_Stype === 1.U || imm_Utype === 1.U ) -> imm_ext ,
	            (fwrd_reg2 === "b01".U ) -> io.exe2id_wd,
				(fwrd_reg2 === "b10".U ) -> io.mem2id_wd,	
                (fwrd_reg2 === "b11".U ) -> io.rd2   				
			  //立即数判断应在定向前推判断前，否则S指令src2数据定向前推会出现错误。      
	))
	
	//读写csr寄存器地址
	val csr_init = inst_csrrw | inst_csrrs | inst_csrrc | inst_csrrwi | inst_csrrsi | inst_csrrci
	io.csr_addr_o := Mux(csr_init === 1.U, csr, 0.U)
	
	/*转移指令--------------------------------------------------------------------------------------*/	 
    io.jump_inst := inst_jal | inst_jalr | inst_beq  | inst_bne  | inst_blt  | inst_bge  | inst_bltu | inst_bgeu
	//要转移的地址 pc或寄存器值+符号扩展立即数
	io.jump_addr := Mux(inst_jalr === 1.U, (io.id_src1_o + imm_ext)&"hfffffffffffffffe".U, io.id_pc_i + imm_ext)   //需要优化&"hfffffffffffffffe".U逻辑
	//传回if阶段的跳转指令信号 1跳转 0不跳转 转移地址是pc+4的视为不跳转
	io.jump_flag := MuxCase(0.U, Seq(
	    (inst_jal  === 1.U) -> 1.U,
		(inst_jalr === 1.U) -> 1.U,
		(inst_beq  === 1.U) -> Mux((io.id_src1_o === io.id_src2_o),1.U,0.U),
	    (inst_bne  === 1.U) -> Mux((io.id_src1_o =/= io.id_src2_o),1.U,0.U),
	    (inst_blt  === 1.U) -> Mux((io.id_src1_o.asSInt() <  io.id_src2_o.asSInt()),1.U,0.U),
	    (inst_bltu === 1.U) -> Mux((io.id_src1_o.asUInt() <  io.id_src2_o.asUInt()),1.U,0.U),
	    (inst_bge  === 1.U) -> Mux((io.id_src1_o.asSInt() >= io.id_src2_o.asSInt()),1.U,0.U),
	    (inst_bgeu === 1.U) -> Mux((io.id_src1_o.asUInt() >= io.id_src2_o.asUInt()),1.U,0.U)
	))&(io.jump_addr =/= io.id_pc_i + 4.U)
    
	/*加载指令相关时请求暂停------------------------------------------------------------------------*/
	io.stallreq_id := MuxCase(0.U, Seq(
	     ((((io.exe2id_wreg === 1.U) && (io.exe2id_wa === io.ra1) && (io.rreg1 === 1.U))||
		   ((io.exe2id_wreg === 1.U) && (io.exe2id_wa === io.ra2) && (io.rreg2 === 1.U))) 
		   && (io.exe2id_mreg === 1.U)) -> 1.U,
		 ((((io.mem2id_wreg === 1.U) && (io.mem2id_wa === io.ra1) && (io.rreg1 === 1.U))||
		   ((io.mem2id_wreg === 1.U) && (io.mem2id_wa === io.ra2) && (io.rreg2 === 1.U))) 
		   && (io.mem2id_mreg === 1. U)) -> 1.U
	))
	
	io.id_exccode_o := MuxCase(EXC_NONE, Seq(
						(illegal_instruction === 1.U) -> EXC_II,
						(inst_ecall  === 1.U) -> EXC_MECALL,
						(inst_ebreak === 1.U) -> EXC_BP    ,
						(inst_mret   === 1.U) -> EXC_MRET
					   ))	
		
}




