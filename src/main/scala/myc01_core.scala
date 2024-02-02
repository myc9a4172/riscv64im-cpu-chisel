//myc01_core.scala   myc01内核的顶层模块

package myc01.core

import chisel3._
import chisel3.iotesters._
import define.myc01_core_define._

class myc01_core extends Module {
  val io = IO(new Bundle {

	//icache类sram端口
	val inst_req      = Output(UInt(1.W))   //cpu2bridge  cpu发出的读指令信号
	//val inst_size     = Output(UInt(2.W))   //cpu2bridge  取指访存请求传输的字节数， 0: 1byte； 1: 2bytes； 2: 4bytes; 3:8bytes
	val inst_addr     = Output(UInt(64.W))  //cpu2bridge  取指访存请求的地址
	val inst_rdata    = Input (UInt(64.W))  //bridge2cpu  取指访存返回的数据
	//val inst_addr_ok  = Input (UInt(1.W))   //bridge2cpu  允许传入新的读指令地址
	val inst_data_ok  = Input (UInt(1.W))   //bridge2cpu  数据传输 OK，读：数据返回；写：数据写入完成。
	val inst_we       = Output(UInt(1.W))
	val inst_wstrb    = Output(UInt(8.W))
	val inst_wdata    = Output(UInt(64.W))
	val icache_invalid= Output(UInt(1.W))
	
	//dcache类sram端口
	val data_req      = Output(UInt(1.W))   //cpu2bridge  cpu发出的访存请求信号
	val data_we       = Output(UInt(1.W))   //cpu2bridge  访存请求写使能
	val data_wstrb    = Output(UInt(8.W))   //cpu2bridge  访存请求写字节选择
    //val data_size     = Output(UInt(2.W))   //cpu2bridge  访存请求传输的字节数， 0: 1byte； 1: 2bytes； 2: 4bytes; 3:8bytes
	val data_addr     = Output(UInt(64.W))  //cpu2bridge  访存请求的地址
	val data_wdata    = Output(UInt(64.W))  //cpu2bridge  访存请求的写数据
	val data_rdata    = Input (UInt(64.W))  //bridge2cpu  访存返回的数据
	val data_data_ok  = Input (UInt(1.W))   //bridge2cpu  数据传输 OK，读：数据返回；写：数据写入完成。
	val dcache_invalid= Output(UInt(1.W))
	
	//外部中断端口
	val int_i_1 = Input(UInt(1.W))
	val int_i_2 = Input(UInt(1.W))
	val int_i_3 = Input(UInt(1.W))
	val int_i_4 = Input(UInt(1.W))
	val int_i_5 = Input(UInt(1.W))
	val int_i_6 = Input(UInt(1.W))
	
	//val debug
	val pc = Output(UInt(64.W))
  })

   //实例化模块
	val if_stage   = Module(new if_stage())
	val ifid_reg   = Module(new ifid_reg())
	val id_stage   = Module(new id_stage())
	val idexe_reg  = Module(new idexe_reg())
	val exe_stage  = Module(new exe_stage())
	val exemem_reg = Module(new exemem_reg())
	val mem_stage  = Module(new mem_stage())
	val memwb_reg  = Module(new memwb_reg())
	val wb_stage   = Module(new wb_stage())
	val regfile    = Module(new regfile())
	val stall_ctrl = Module(new stall_ctrl())
	val excp       = Module(new excp())
    val clint      = Module(new clint())
	val plic       = Module(new plic())
	
   //连接ifid_reg模块与if_stage模块
	ifid_reg.io.if_pc        <> if_stage.io.pc 
	ifid_reg.io.if_BTB_hit   <> if_stage.io.BTB_hit_o
	ifid_reg.io.if_BTB_false <> if_stage.io.BTB_false_o
	ifid_reg.io.if_inst      <> if_stage.io.inst_o
	
   //连接id_stage模块与ifid_reg模块
    id_stage.io.id_pc_i     <> ifid_reg.io.id_pc
	id_stage.io.id_inst_i   <> ifid_reg.io.id_inst
	id_stage.io.BTB_false_i <> ifid_reg.io.id_BTB_false
    id_stage.io.BTB_hit_i   <> ifid_reg.io.id_BTB_hit

   //连接id_stage模块与exe_stage模块和mem_stage模块(定向前推)	
    id_stage.io.exe2id_wreg  <> exe_stage.io.exe_wreg_o     
	id_stage.io.exe2id_wa    <> exe_stage.io.exe_wa_o 
	id_stage.io.exe2id_wd    <> exe_stage.io.exe_wd_o  	
	id_stage.io.mem2id_wreg  <> mem_stage.io.mem_wreg_o
	id_stage.io.mem2id_wa    <> mem_stage.io.mem_wa_o 
	id_stage.io.mem2id_wd    <> mem_stage.io.mem_dreg_o 

   //连接id_stage模块与if_stage模块(分支指令)
    if_stage.io.id_pc       <> id_stage.io.id_pc_o
	if_stage.io.id_BTB_hit  <> id_stage.io.BTB_hit_o
    if_stage.io.jump_addr   <>  id_stage.io.jump_addr
	if_stage.io.jump_flag   <>  id_stage.io.jump_flag
	if_stage.io.jump_inst   <>  id_stage.io.jump_inst

   //连接idexe_reg模块与id_stage模块
    idexe_reg.io.id_pc          <> id_stage.io.id_pc_o
    idexe_reg.io.id_alutype     <> id_stage.io.id_alutype_o
    idexe_reg.io.id_aluop       <> id_stage.io.id_aluop_o  
    idexe_reg.io.id_src1        <> id_stage.io.id_src1_o
    idexe_reg.io.id_src2        <> id_stage.io.id_src2_o
    idexe_reg.io.id_wa          <> id_stage.io.id_wa_o   
    idexe_reg.io.id_wreg        <> id_stage.io.id_wreg_o 
	idexe_reg.io.id_mreg        <> id_stage.io.id_mreg_o
	idexe_reg.io.id_din         <> id_stage.io.id_din_o 
	idexe_reg.io.id_jump_addr   <> id_stage.io.jump_addr
	idexe_reg.io.id_csr_addr    <> id_stage.io.csr_addr_o  
	idexe_reg.io.id_exccode     <> id_stage.io.id_exccode_o
	
   //连接通用寄存器堆与id_stage模块
	regfile.io.ra1  <> id_stage.io.ra1 
	regfile.io.ra2  <> id_stage.io.ra2          
	regfile.io.re1  <> id_stage.io.rreg1
	regfile.io.re2  <> id_stage.io.rreg2   
	id_stage.io.rd1 <> regfile.io.rd1
	id_stage.io.rd2 <> regfile.io.rd2
   
   //连接exe_stage模块与idexe_reg模块
    exe_stage.io.exe_pc_i        <> idexe_reg.io.exe_pc
    exe_stage.io.exe_alutype_i   <> idexe_reg.io.exe_alutype
    exe_stage.io.exe_aluop_i     <> idexe_reg.io.exe_aluop  
    exe_stage.io.exe_src1_i      <> idexe_reg.io.exe_src1   
    exe_stage.io.exe_src2_i      <> idexe_reg.io.exe_src2   
    exe_stage.io.exe_wa_i        <> idexe_reg.io.exe_wa     
    exe_stage.io.exe_wreg_i      <> idexe_reg.io.exe_wreg   
	exe_stage.io.exe_mreg_i      <> idexe_reg.io.exe_mreg
	exe_stage.io.exe_din_i       <> idexe_reg.io.exe_din 
	exe_stage.io.csr_addr_i      <> idexe_reg.io.exe_csr_addr
	exe_stage.io.exe_exccode_i   <> idexe_reg.io.exe_exccode 
	exe_stage.io.exe_jump_addr_i <> idexe_reg.io.exe_jump_addr
	
	//连接exe_stage模块与excp模块
	excp.io.re_i  <> exe_stage.io.csr_re_o
	excp.io.ra_i  <> exe_stage.io.csr_ra_o
	excp.io.rd_o  <> exe_stage.io.csr_rd_i 
	
	//连接exe_stage模块与mem_stage和wb_stage模块(csr寄存器定向前推)
	exe_stage.io.mem2exe_csr_we <> mem_stage.io.csr_we_o
	exe_stage.io.mem2exe_csr_wa <> mem_stage.io.csr_wa_o
	exe_stage.io.mem2exe_csr_wd <> mem_stage.io.csr_wd_o
	exe_stage.io.wb2exe_csr_we  <> wb_stage.io.csr_we_o
	exe_stage.io.wb2exe_csr_wa  <> wb_stage.io.csr_wa_o
	exe_stage.io.wb2exe_csr_wd  <> wb_stage.io.csr_wd_o
	
	//连接exemem_reg模块与exe_stage模块
	exemem_reg.io.exe_pc       <> exe_stage.io.exe_pc_o
    exemem_reg.io.exe_aluop    <> exe_stage.io.exe_aluop_o 
	exemem_reg.io.exe_wa       <> exe_stage.io.exe_wa_o    
    exemem_reg.io.exe_wreg     <> exe_stage.io.exe_wreg_o  
    exemem_reg.io.exe_wd       <> exe_stage.io.exe_wd_o 
    exemem_reg.io.exe_mreg     <> exe_stage.io.exe_mreg_o
	exemem_reg.io.exe_din      <> exe_stage.io.exe_din_o 
	exemem_reg.io.exe_csr_wa   <> exe_stage.io.csr_wa_o     
	exemem_reg.io.exe_csr_wd   <> exe_stage.io.csr_wd_o     
	exemem_reg.io.exe_csr_we   <> exe_stage.io.csr_we_o     
	exemem_reg.io.exe_exccode  <> exe_stage.io.exe_exccode_o
	exemem_reg.io.exe_jump_addr<> exe_stage.io.exe_jump_addr_o
	
	//连接mem_stage模块与exemem_reg模块
	mem_stage.io.mem_pc_i      <> exemem_reg.io.mem_pc
	mem_stage.io.mem_aluop_i   <> exemem_reg.io.mem_aluop 
	mem_stage.io.mem_wa_i      <> exemem_reg.io.mem_wa    
	mem_stage.io.mem_wreg_i    <> exemem_reg.io.mem_wreg  
	mem_stage.io.mem_wd_i      <> exemem_reg.io.mem_wd    
	mem_stage.io.mem_mreg_i    <> exemem_reg.io.mem_mreg 
	mem_stage.io.mem_din_i     <> exemem_reg.io.mem_din  
	mem_stage.io.csr_we_i      <> exemem_reg.io.mem_csr_we 
	mem_stage.io.csr_wa_i      <> exemem_reg.io.mem_csr_wa 
	mem_stage.io.csr_wd_i      <> exemem_reg.io.mem_csr_wd 
	mem_stage.io.mem_exccode_i <> exemem_reg.io.mem_exccode
	mem_stage.io.jump_addr_i   <> exemem_reg.io.mem_jump_addr
    
	//连接memwb_reg模块与mem_stage模块
    memwb_reg.io.mem_wa          <> mem_stage.io.mem_wa_o  
	memwb_reg.io.mem_wreg        <> mem_stage.io.mem_wreg_o
	memwb_reg.io.mem_dreg        <> mem_stage.io.mem_dreg_o
	memwb_reg.io.mem_mreg        <> mem_stage.io.mem_mreg_o 
	memwb_reg.io.mem_dre         <> mem_stage.io.dre        
	memwb_reg.io.mem_load_unsign <> mem_stage.io.load_unsign
	memwb_reg.io.mem_csr_we      <> mem_stage.io.csr_we_o
	memwb_reg.io.mem_csr_wa      <> mem_stage.io.csr_wa_o
	memwb_reg.io.mem_csr_wd      <> mem_stage.io.csr_wd_o
	memwb_reg.io.mem_dm          <> mem_stage.io.mem_dm
	memwb_reg.io.mem_big_endian  <> mem_stage.io.mem_big_endian
	
	//连接wb_stage模块与memwb_stage模块
	wb_stage.io.wb_wa_i        <> memwb_reg.io.wb_wa  
	wb_stage.io.wb_wreg_i      <> memwb_reg.io.wb_wreg
    wb_stage.io.wb_dreg_i      <> memwb_reg.io.wb_dreg
	wb_stage.io.wb_mreg_i      <> memwb_reg.io.wb_mreg
	wb_stage.io.wb_dre_i       <> memwb_reg.io.wb_dre 
	wb_stage.io.wb_load_unsign <> memwb_reg.io.wb_load_unsign
	wb_stage.io.csr_we_i       <> memwb_reg.io.wb_csr_we
	wb_stage.io.csr_wa_i       <> memwb_reg.io.wb_csr_wa
	wb_stage.io.csr_wd_i       <> memwb_reg.io.wb_csr_wd
	wb_stage.io.dm             <> memwb_reg.io.wb_dm
	wb_stage.io.wb_big_endian  <> memwb_reg.io.wb_big_endian
	
	//连接通用寄存器堆与wb_stage模块
	regfile.io.wa <> wb_stage.io.wb_wa_o   
	regfile.io.wd <> wb_stage.io.wb_wd_o  
	regfile.io.we <> wb_stage.io.wb_wreg_o 
	
	//连接wb_stage模块与excp模块
	excp.io.we_i  <> wb_stage.io.csr_we_o
	excp.io.wa_i  <> wb_stage.io.csr_wa_o
	excp.io.wd_i  <> wb_stage.io.csr_wd_o

	//连接流水线暂停所需连线
	stall_ctrl.io.stallreq_id  <> id_stage.io.stallreq_id
	stall_ctrl.io.stallreq_exe <> exe_stage.io.stallreq_exe
	stall_ctrl.io.stallreq_mem <> mem_stage.io.stallreq_mem
	id_stage.io.exe2id_mreg    <> exe_stage.io.exe_mreg_o
	id_stage.io.mem2id_mreg    <> mem_stage.io.mem_mreg_o
	if_stage.io.stall          <> stall_ctrl.io.stall
	ifid_reg.io.stall          <> stall_ctrl.io.stall
	idexe_reg.io.stall         <> stall_ctrl.io.stall
	exemem_reg.io.stall        <> stall_ctrl.io.stall
	memwb_reg.io.stall         <> stall_ctrl.io.stall
	
	//连接excp模块与其他模块
	excp.io.exccode_i   <> mem_stage.io.exccode_o
	excp.io.pc_i        <> mem_stage.io.pc_o     
	excp.io.jump_addr_i <> mem_stage.io.jump_addr_o
	excp.io.excaddr     <> if_stage.io.excaddr
	excp.io.flush       <> if_stage.io.flush
	excp.io.flush 	    <> ifid_reg.io.flush
	excp.io.flush 	    <> id_stage.io.flush
	excp.io.flush 	    <> idexe_reg.io.flush
	excp.io.flush 	    <> exemem_reg.io.flush
	excp.io.flush 	    <> memwb_reg.io.flush
	excp.io.mtime_int_i <> clint.io.timer_int 
	excp.io.msoft_int_i <> clint.io.software_int
	excp.io.mext_int_i  <> plic.io.excint

	//连接clint
	clint.io.addr  <> mem_stage.io.daddr
	clint.io.we    <> mem_stage.io.data_we  
	clint.io.wd    <> mem_stage.io.din 
	
	//连接plic模块
	plic.io.re    <> mem_stage.io.dce 
	plic.io.rdata <> mem_stage.io.data_plic
	plic.io.addr  <> mem_stage.io.daddr
	plic.io.we    <> mem_stage.io.data_we
	plic.io.wdata <> mem_stage.io.din 
	
	/*-------------------------------------连接对外端口----------------------------------------------*/
	
	//icache类sram端口
	io.inst_req       <> if_stage.io.inst_req    
	io.inst_addr      <> if_stage.io.iaddr       
	io.inst_rdata     <> if_stage.io.inst_rdata  
	io.inst_data_ok   <> if_stage.io.inst_data_ok
	io.inst_we        := 0.U
	io.inst_wstrb     := 0.U
	io.inst_wdata     := 0.U
	io.icache_invalid <> if_stage.io.icache_invalid
	
	//dcache类sram端口
	io.data_req       <> mem_stage.io.data_req 
	io.data_we        <> mem_stage.io.data_we
	io.data_wstrb     <> mem_stage.io.dwstrb
	io.data_addr      <> mem_stage.io.daddr 
	io.data_wdata     <> mem_stage.io.din
	io.data_rdata     <> mem_stage.io.data_rdata
	io.data_data_ok   <> mem_stage.io.data_data_ok
	io.dcache_invalid := 0.U
	
	//外部中断端口
	io.int_i_1 <> plic.io.int_i_1
	io.int_i_2 <> plic.io.int_i_2
	io.int_i_3 <> plic.io.int_i_3
	io.int_i_4 <> plic.io.int_i_4
	io.int_i_5 <> plic.io.int_i_5
	io.int_i_6 <> plic.io.int_i_6
	
	//debug
	io.pc <> if_stage.io.pc
  }