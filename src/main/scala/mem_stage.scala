//mem_stage  访存模块

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import define.myc01_core_define._

class mem_stage extends Module {
  val io = IO(new Bundle {

	// from exe_stage
	val mem_pc_i      = Input(UInt(INST_ADDR_WIDTH))    //来自执行阶段的指令的pc(送给excp) <64>
	val mem_aluop_i   = Input(UInt(ALUOP_WIDTH))        //来自执行阶段的内部操作码 <8>
	val mem_wa_i      = Input(UInt(REG_ADDR_WIDTH))     //来自执行阶段的目的存储器的地址 <5>
	val mem_wreg_i    = Input(UInt(1.W))                //来自执行阶段的寄存器写使能信号 <1>
	val mem_wd_i      = Input(UInt(XLEN))               //来自执行阶段的待写入目的寄存器的数据 <64>
	val mem_mreg_i    = Input(UInt(1.W))                //来自执行阶段的存储器到寄存器使能信号 <1>
	val mem_din_i     = Input(UInt(XLEN))               //来自执行阶段的待写入存储器中的数据  <64>
	val csr_we_i      = Input(UInt(1.W))                //来自执行阶段的写csr寄存器使能
	val csr_wa_i      = Input(UInt(CSR_ADDR_WIDTH))     //来自执行阶段的写csr寄存器地址
	val csr_wd_i      = Input(UInt(XLEN))               //来自执行阶段的写csr寄存器数据
	val mem_exccode_i = Input(UInt(EXCCODE_WIDTH))      //来自执行阶段的内部操作码
	val jump_addr_i   = Input(UInt(INST_ADDR_WIDTH))    //来自执行阶段的跳转目标地址
	
	// to wb_stage
	val mem_wa_o       = Output(UInt(REG_ADDR_WIDTH))   //送往写回阶段的指令的目的寄存器地址 <5>
	val mem_wreg_o     = Output(UInt(1.W))              //送往写回阶段的指令的目的寄存器写使能信号 <1>
	val mem_dreg_o     = Output(UInt(XLEN))             //送往写回阶段的指令的待写入目的寄存器的数据 <64>
	val mem_mreg_o     = Output(UInt(1.W))              //送往写回阶段的指令的存储器到寄存器使能信号 <1>
	val dre            = Output(UInt(8.W))              //送往写回阶段的读字节使能信号 <8>
	val load_unsign    = Output(UInt(1.W))              //送往写回阶段的加载指令无符号扩展信号 <1>
	val csr_we_o       = Output(UInt(1.W))              //送往写回阶段的写csr寄存器使能
	val csr_wa_o       = Output(UInt(CSR_ADDR_WIDTH))   //送往写回阶段的写csr寄存器地址
    val csr_wd_o       = Output(UInt(XLEN))             //送往写回阶段的写csr寄存器数据
    val mem_dm         = Output(UInt(XLEN))             //送往写回阶段的存储器数据
    val mem_big_endian = Output(UInt(1.W))              //送往写回阶段的大小端标志信号
	
	//dcache类sram交互端口
	val data_req       = Output(UInt(1.W))              //dcache访存请求信号 <1>  
	val daddr          = Output(UInt(64.W))             //dcache访存请求地址 <64> 
	val data_we        = Output(UInt(1.W))              //dcache访存写使能信号 <1> 
	val dwstrb         = Output(UInt(8.W))              //dcache访存写字节使能信号
	val din            = Output(UInt(XLEN))             //dcache访存写数据 <64>
	val data_rdata     = Input (UInt(XLEN))             //dcache返回的数据 <64>
	val data_data_ok   = Input (UInt(1.W))              //dcache事务完成信号 <1>
	
	// 送至excp模块的信号
	val exccode_o   = Output(UInt(EXCCODE_WIDTH))
	val pc_o        = Output(UInt(INST_ADDR_WIDTH))
	val jump_addr_o = Output(UInt(INST_ADDR_WIDTH))
	
	// 送至stall_ctrl模块的信号
	val stallreq_mem = Output(UInt(1.W)) //****
	
	//plic
	val data_plic = Input(UInt(XLEN))
	val dce       = Output(UInt(1.W))          //访存使能信号 
  })
 
    val btype_inst = io.mem_aluop_i === RV64I_BEQ  || io.mem_aluop_i === RV64I_BNE  ||
                     io.mem_aluop_i === RV64I_BLT  || io.mem_aluop_i === RV64I_BGE  ||
                     io.mem_aluop_i === RV64I_BLTU || io.mem_aluop_i === RV64I_BGEU 
	val jtype_inst = io.mem_aluop_i === RV64I_JAL  || io.mem_aluop_i === RV64I_JALR 
	
	//dcache类sram端口交互
	//如果访问clint或plic走处理器内总线
	io.data_req := io.dce === 1.U && 
	               io.daddr =/= MSIP_ADDR && io.daddr =/= MTIMECMP_ADDR && io.daddr =/= MTIME_ADDR 	&&
                   io.daddr =/= PLIC_CLAIM_COMPLETE				   
	val ready_go = io.data_req === 1.U && io.data_data_ok === 1.U  //提交允许信号
	io.stallreq_mem := io.data_req === 1.U && ready_go === 0.U     //数据访存流水线暂停
    io.mem_dm := MuxCase(0.U ,Seq(
	             (ready_go === 1.U) -> io.data_rdata,
				 (io.dce === 1.U && io.daddr === PLIC_CLAIM_COMPLETE) -> io.data_plic))
	//Mux(ready_go === 1.U, io.data_rdata, 0.U) //允许提交时输出sram端口输入的数据
    io.data_we := io.dwstrb =/= 0.U   
	

	//如果当前指令不需要访存则将信息直接输出
    io.mem_wa_o    := io.mem_wa_i
	io.mem_wreg_o  := io.mem_wreg_i
	io.mem_dreg_o  := io.mem_wd_i
	io.mem_mreg_o  := io.mem_mreg_i
	io.csr_we_o    := io.csr_we_i	
	io.csr_wa_o    := io.csr_wa_i
	io.csr_wd_o    := io.csr_wd_i
	io.pc_o        := Mux(btype_inst === 1.U || io.dce === 1.U, 0.U ,io.mem_pc_i)   //b指令和访存指令时不处理中断
	io.jump_addr_o  := Mux(jtype_inst === 1.U ,io.jump_addr_i,0.U)
	
	//确定当前访存指令的类型	
	val inst_lb  = io.mem_aluop_i === RV64I_LB  
	val inst_lh  = io.mem_aluop_i === RV64I_LH  
	val inst_lw  = io.mem_aluop_i === RV64I_LW  
	val inst_lbu = io.mem_aluop_i === RV64I_LBU 
	val inst_lhu = io.mem_aluop_i === RV64I_LHU 
	val inst_lwu = io.mem_aluop_i === RV64I_LWU
	val inst_ld  = io.mem_aluop_i === RV64I_LD 
	val inst_sb  = io.mem_aluop_i === RV64I_SB  
	val inst_sh  = io.mem_aluop_i === RV64I_SH  
	val inst_sw  = io.mem_aluop_i === RV64I_SW  
	val inst_sd  = io.mem_aluop_i === RV64I_SD
	
	//访存、加载指令对齐判断
	val address_misaligned = MuxCase(0.U , Seq(
								  ((inst_lh|inst_lhu === 1.U) && io.mem_wd_i(0) =/= 0.U)       -> EXC_LAM,
								  ((inst_lw|inst_lwu === 1.U) && io.mem_wd_i(1,0) =/= "b00".U) -> EXC_LAM,
								  (inst_ld === 1.U && io.mem_wd_i(2,0) =/= "b000".U)           -> EXC_LAM,
								  (inst_sh === 1.U && io.mem_wd_i(0) =/= 0.U)                  -> EXC_SAM,
								  (inst_sw === 1.U && io.mem_wd_i(1,0) =/= "b00".U)            -> EXC_SAM,
								  (inst_sd === 1.U && io.mem_wa_i(2,0) =/= "b000".U)           -> EXC_SAM))
								  
	//获得数据存储器的访存地址(即上一步ALU的运算输出)
    io.daddr := Mux(address_misaligned === 0.U, io.mem_wd_i, 0.U)	
	
	//获得数据存储器使能信号 出现加载、访存地址对齐错误禁止使能
	io.dce := (inst_lb  | inst_lh   | inst_lw   | 
	           inst_lbu | inst_lhu  | inst_lwu  | inst_ld |
	           inst_sb  | inst_sh   | inst_sw   | inst_sd) && (address_misaligned === 0.U) 
			  
				
    val gpio_addr_en  = io.dce === 1.U && io.daddr(63,12) === GPIO_ADDR
    val uart_addr_en  = io.dce === 1.U && io.daddr(63,12) === UART_ADDR		
    val plic_addr_en  = io.dce === 1.U && io.daddr ===	PLIC_CLAIM_COMPLETE
	io.mem_big_endian := gpio_addr_en === 1.U || uart_addr_en === 1.U || plic_addr_en === 1.U
	
	//获得数据存储器DM的读字节使能信号
	val dre_temp = Wire(Vec(8,UInt(1.W)))
	dre_temp(7) := ((inst_lb | inst_lbu) & (io.daddr(2,0) === "b000".U)) | ((inst_lh | inst_lhu) & (io.daddr(2,0) === "b000".U)) |
				   ((inst_lw | inst_lwu) & (io.daddr(2,0) === "b000".U)) | inst_ld				
    dre_temp(6) := ((inst_lb | inst_lbu) & (io.daddr(2,0) === "b001".U)) | ((inst_lh | inst_lhu) & (io.daddr(2,0) === "b000".U)) |
	               ((inst_lw | inst_lwu) & (io.daddr(2,0) === "b000".U)) | inst_ld					
 	dre_temp(5) := ((inst_lb | inst_lbu) & (io.daddr(2,0) === "b010".U)) | ((inst_lh | inst_lhu) & (io.daddr(2,0) === "b010".U)) |
	               ((inst_lw | inst_lwu) & (io.daddr(2,0) === "b000".U)) | inst_ld				
	dre_temp(4) := ((inst_lb | inst_lbu) & (io.daddr(2,0) === "b011".U)) | ((inst_lh | inst_lhu) & (io.daddr(2,0) === "b010".U)) |
	               ((inst_lw | inst_lwu) & (io.daddr(2,0) === "b000".U)) | inst_ld			
	dre_temp(3) := ((inst_lb | inst_lbu) & (io.daddr(2,0) === "b100".U)) | ((inst_lh | inst_lhu) & (io.daddr(2,0) === "b100".U)) |
				   ((inst_lw | inst_lwu) & (io.daddr(2,0) === "b100".U)) | inst_ld
    dre_temp(2) := ((inst_lb | inst_lbu) & (io.daddr(2,0) === "b101".U)) | ((inst_lh | inst_lhu) & (io.daddr(2,0) === "b100".U)) |
	               ((inst_lw | inst_lwu) & (io.daddr(2,0) === "b100".U)) | inst_ld
 	dre_temp(1) := ((inst_lb | inst_lbu) & (io.daddr(2,0) === "b110".U)) | ((inst_lh | inst_lhu) & (io.daddr(2,0) === "b110".U)) |
	               ((inst_lw | inst_lwu) & (io.daddr(2,0) === "b100".U)) | inst_ld	
	dre_temp(0) := ((inst_lb | inst_lbu) & (io.daddr(2,0) === "b111".U)) | ((inst_lh | inst_lhu) & (io.daddr(2,0) === "b110".U)) |
	               ((inst_lw | inst_lwu) & (io.daddr(2,0) === "b100".U)) | inst_ld			
	io.dre := dre_temp.asUInt
	
	//获得加载指令无符号扩展信号(lbu,lhu)
	io.load_unsign := inst_lbu | inst_lhu | inst_lwu
	
	//获得数据存储器写字节使能信号
	val dwstrb_temp = Wire(Vec(8,UInt(1.W)))
	dwstrb_temp(7) := (inst_sb & (io.daddr(2,0) === "b000".U)) | (inst_sh & (io.daddr(2,0) === "b000".U)) |
				   (inst_sw & (io.daddr(2,0) === "b000".U)) | inst_sd	
    dwstrb_temp(6) := (inst_sb & (io.daddr(2,0) === "b001".U)) | (inst_sh & (io.daddr(2,0) === "b000".U)) |
	               (inst_sw & (io.daddr(2,0) === "b000".U)) | inst_sd				
 	dwstrb_temp(5) := (inst_sb & (io.daddr(2,0) === "b010".U)) | (inst_sh & (io.daddr(2,0) === "b010".U)) |
	               (inst_sw & (io.daddr(2,0) === "b000".U)) | inst_sd				
	dwstrb_temp(4) := (inst_sb & (io.daddr(2,0) === "b011".U)) | (inst_sh & (io.daddr(2,0) === "b010".U)) |
	               (inst_sw & (io.daddr(2,0) === "b000".U)) | inst_sd			
	dwstrb_temp(3) := (inst_sb & (io.daddr(2,0) === "b100".U)) | (inst_sh & (io.daddr(2,0) === "b100".U)) |
				   (inst_sw & (io.daddr(2,0) === "b100".U)) | inst_sd			
    dwstrb_temp(2) := (inst_sb & (io.daddr(2,0) === "b101".U)) | (inst_sh & (io.daddr(2,0) === "b100".U)) |
	               (inst_sw & (io.daddr(2,0) === "b100".U)) | inst_sd			
 	dwstrb_temp(1) := (inst_sb & (io.daddr(2,0) === "b110".U)) | (inst_sh & (io.daddr(2,0) === "b110".U)) |
	               (inst_sw & (io.daddr(2,0) === "b100".U)) | inst_sd			
	dwstrb_temp(0) := (inst_sb & (io.daddr(2,0) === "b111".U)) | (inst_sh & (io.daddr(2,0) === "b110".U)) |
	               (inst_sw & (io.daddr(2,0) === "b100".U)) | inst_sd				
	io.dwstrb := Mux(address_misaligned === 0.U, dwstrb_temp.asUInt, 0.U)
	
	//获得写入数据存储器的数据	 
	val din_sb = Cat(io.mem_din_i(7,0), io.mem_din_i(7,0), io.mem_din_i(7,0), io.mem_din_i(7,0),
	                 io.mem_din_i(7,0), io.mem_din_i(7,0), io.mem_din_i(7,0), io.mem_din_i(7,0))			 
	val din_sh = Mux(gpio_addr_en === 1.U || uart_addr_en === 1.U || plic_addr_en === 1.U,
	                   Cat(io.mem_din_i(15,0), io.mem_din_i(15,0), io.mem_din_i(15,0), io.mem_din_i(15,0)),
	                   Cat(io.mem_din_i(7,0), io.mem_din_i(15,8), io.mem_din_i(7,0), io.mem_din_i(15,8),
					       io.mem_din_i(7,0), io.mem_din_i(15,8), io.mem_din_i(7,0),io.mem_din_i(15,8)))			 
	val din_sw = Mux(gpio_addr_en === 1.U || uart_addr_en === 1.U || plic_addr_en === 1.U,
	                   Cat(io.mem_din_i(31,0) ,io.mem_din_i(31,0)),
					   Cat(io.mem_din_i(7,0) ,io.mem_din_i(15,8),io.mem_din_i(23,16),io.mem_din_i(31,24),
					       io.mem_din_i(7,0) ,io.mem_din_i(15,8),io.mem_din_i(23,16),io.mem_din_i(31,24)))						   
	val din_sd = Mux(gpio_addr_en === 1.U || uart_addr_en === 1.U || plic_addr_en === 1.U,
	                   io.mem_din_i,
					   Cat(io.mem_din_i(7,0) ,io.mem_din_i(15,8),io.mem_din_i(23,16),io.mem_din_i(31,24),
					       io.mem_din_i(39,32) ,io.mem_din_i(47,40),io.mem_din_i(55,48),io.mem_din_i(63,56)))		   
	
	io.din := MuxCase(0.U , Seq(
		(io.dwstrb === "b10000000".U) -> din_sb,
		(io.dwstrb === "b01000000".U) -> din_sb,
		(io.dwstrb === "b00100000".U) -> din_sb,
		(io.dwstrb === "b00010000".U) -> din_sb,
		(io.dwstrb === "b00001000".U) -> din_sb,
		(io.dwstrb === "b00000100".U) -> din_sb,
		(io.dwstrb === "b00000010".U) -> din_sb,
		(io.dwstrb === "b00000001".U) -> din_sb,
		(io.dwstrb === "b11000000".U) -> din_sh,
		(io.dwstrb === "b00110000".U) -> din_sh,
		(io.dwstrb === "b00001100".U) -> din_sh,
		(io.dwstrb === "b00000011".U) -> din_sh,
	    (io.dwstrb === "b11110000".U) -> din_sw,
		(io.dwstrb === "b00001111".U) -> din_sw,
		(io.dwstrb === "b11111111".U) -> din_sd))
	
	//异常输出
	io.exccode_o := MuxCase(io.mem_exccode_i ,Seq(
							(address_misaligned === EXC_LAM) ->EXC_LAM,
							(address_misaligned === EXC_SAM) ->EXC_SAM))							
}

