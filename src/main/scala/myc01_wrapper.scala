//myc01_wrapper.scala   myc01内核的顶层模块

package myc01.core

import chisel3._
import chisel3.iotesters._
import define.myc01_core_define._

class myc01_wrapper extends Module {
  val io = IO(new Bundle {
    
	//转接桥与axi总线接口通讯
    //ar 读地址通道
     val arid    = Output(UInt(4.W))   //bridge2axi 读地址ID信号
     val araddr  = Output(UInt(64.W))  //bridge2axi 读地址 
     val arlen   = Output(UInt(8.W))   //bridge2axi 突发长度
     val arsize  = Output(UInt(3.W))   //bridge2axi 突发数据包大小 用于确定突发传输中每个传输的大小
     val arburst = Output(UInt(2.W))   //bridge2axi 突发类型 表示在突发过程中，地址如何应用于每个传输
     val arlock  = Output(UInt(2.W))   //bridge2axi 锁类型
     val arcache = Output(UInt(4.W))   //bridge2axi 缓存类型
     val arprot  = Output(UInt(3.W))   //bridge2axi 保护类型
     val arvalid = Output(UInt(1.W))   //bridge2axi 读地址有效信号
     val arready = Input (UInt(1.W))   //axi2bridge 读地址准备好信号
	 
    //r  读数据通道   
     val rid     = Input (UInt(4.W))   //bridge2axi 读数据ID信号
     val rdata   = Input (UInt(64.W))  //bridge2axi 读数据
     val rresp   = Input (UInt(2.W))   //bridge2axi 读响应
     val rlast   = Input (UInt(1.W))   //bridge2axi 读最后一个数据指示信号。表示突发传输中的最后一个数据。
     val rvalid  = Input (UInt(1.W))   //bridge2axi 读数据有效
     val rready  = Output(UInt(1.W))   //axi2bridge 读数据准备好信号
			
    //aw 写地址通道        
     val awid    = Output(UInt(4.W))   //bridge2axi 写地址ID信号
     val awaddr  = Output(UInt(64.W))  //bridge2axi写地址
     val awlen   = Output(UInt(8.W))   //bridge2axi 突发长度
     val awsize  = Output(UInt(3.W))   //bridge2axi 突发数据包大小 用于确定突发传输中每个传输的大小
     val awburst = Output(UInt(2.W))   //bridge2axi 突发类型 表示在突发过程中，地址如何应用于每个传输
     val awlock  = Output(UInt(2.W))   //bridge2axi 锁类型
     val awcache = Output(UInt(4.W))   //bridge2axi 缓存类型
     val awprot  = Output(UInt(3.W))   //bridge2axi 保护类型
     val awvalid = Output(UInt(1.W))   //bridge2axi 写地址有效信号
     val awready = Input (UInt(1.W))   //axi2bridge 写地址准备好信号
	 
    //w  写数据通道        
     val wid     = Output(UInt(4.W))   //bridge2axi 写数据ID信号
     val wdata   = Output(UInt(64.W))  //bridge2axi 写数据
     val wstrb   = Output(UInt(8.W))   //bridge2axi 写字节选通信号
     val wlast   = Output(UInt(1.W))   //bridge2axi 写最后一个数据指示信号
     val wvalid  = Output(UInt(1.W))   //bridge2axi 写数据有效信号       
     val wready  = Input (UInt(1.W))   //axi2bridge 写数据准备好信号
	                    		
    //b  写响应通道         
     val bid     = Input (UInt(4.W))   //axi2bridge 写响应ID信号
     val bresp   = Input (UInt(2.W))   //axi2bridge 写响应
     val bvalid  = Input (UInt(1.W))   //axi2bridge 写响应有效信号 
     val bready  = Output(UInt(1.W))   //bridge2axi 写响应准备好信号
    
	//外部中断端口	 
	 val int_i_1 = Input(UInt(1.W))
	 val int_i_2 = Input(UInt(1.W))
	 val int_i_3 = Input(UInt(1.W))
	 val int_i_4 = Input(UInt(1.W))
	 val int_i_5 = Input(UInt(1.W))
	 val int_i_6 = Input(UInt(1.W))
	 
	//debug 
	//val pc = Output(UInt(64.W))
	 
  })
  
    val myc01_core = Module(new myc01_core())
    val axi_interface = Module(new axi_interface())
    val icache  = Module(new cache(32))
    val dcache  = Module(new cache(32))	
    
    //连接core与icache
	myc01_core.io.inst_req     <> icache.io.cpu_req     
	myc01_core.io.inst_addr    <> icache.io.cpu_addr    
	myc01_core.io.inst_we      <> icache.io.cpu_wr      
	myc01_core.io.inst_wstrb   <> icache.io.cpu_wstrb   
	myc01_core.io.inst_wdata   <> icache.io.cpu_wdata   
	myc01_core.io.inst_rdata   <> icache.io.cpu_rdata   
	myc01_core.io.inst_data_ok <> icache.io.operation_ok
	myc01_core.io.icache_invalid <> icache.io.cache_invalid
    //连接core与dcache         
	myc01_core.io.data_req     <> dcache.io.cpu_req     
	myc01_core.io.data_addr    <> dcache.io.cpu_addr    
	myc01_core.io.data_we      <> dcache.io.cpu_wr      
	myc01_core.io.data_wstrb   <> dcache.io.cpu_wstrb   
	myc01_core.io.data_wdata   <> dcache.io.cpu_wdata   
	myc01_core.io.data_rdata   <> dcache.io.cpu_rdata   
	myc01_core.io.data_data_ok <> dcache.io.operation_ok
    myc01_core.io.dcache_invalid <> dcache.io.cache_invalid
	
	//连接icache与interface
	icache.io.ram_req       <>  axi_interface.io.inst_req      
	icache.io.ram_wr        <>  axi_interface.io.inst_we       
	icache.io.ram_wstrb     <>  axi_interface.io.inst_wstrb    
	icache.io.ram_addr      <>  axi_interface.io.inst_addr     
	icache.io.ram_wdata     <>  axi_interface.io.inst_wdata    
	icache.io.ram_rdata     <>  axi_interface.io.inst_rdata    
	icache.io.ram_beat_ok   <>  axi_interface.io.inst_beat_ok 
	icache.io.ram_data_ok   <>  axi_interface.io.inst_data_ok   
	icache.io.uncached      <>  axi_interface.io.inst_uncached  
	//连接dcache与interface       
	dcache.io.ram_req       <>  axi_interface.io.data_req          
	dcache.io.ram_wr        <>  axi_interface.io.data_we       
	dcache.io.ram_wstrb     <>  axi_interface.io.data_wstrb    
	dcache.io.ram_addr      <>  axi_interface.io.data_addr     
	dcache.io.ram_wdata     <>  axi_interface.io.data_wdata    
	dcache.io.ram_rdata     <>  axi_interface.io.data_rdata    
	dcache.io.ram_beat_ok   <>  axi_interface.io.data_beat_ok 
	dcache.io.ram_data_ok   <>  axi_interface.io.data_data_ok   
	dcache.io.uncached   	<>  axi_interface.io.data_uncached  
			 
	//wrapper对外输入输出端口		
    axi_interface.io.arid     <> io.arid   
    axi_interface.io.araddr   <> io.araddr 
    axi_interface.io.arlen    <> io.arlen  
    axi_interface.io.arsize   <> io.arsize 
    axi_interface.io.arburst  <> io.arburst
    axi_interface.io.arlock   <> io.arlock 
    axi_interface.io.arcache  <> io.arcache
    axi_interface.io.arprot   <> io.arprot 
    axi_interface.io.arvalid  <> io.arvalid
    axi_interface.io.arready  <> io.arready

    axi_interface.io.rid      <> io.rid   
    axi_interface.io.rdata    <> io.rdata 
    axi_interface.io.rresp    <> io.rresp 
    axi_interface.io.rlast    <> io.rlast 
    axi_interface.io.rvalid   <> io.rvalid
    axi_interface.io.rready   <> io.rready

    axi_interface.io.awid     <> io.awid   
    axi_interface.io.awaddr   <> io.awaddr 
    axi_interface.io.awlen    <> io.awlen  
    axi_interface.io.awsize   <> io.awsize 
    axi_interface.io.awburst  <> io.awburst
    axi_interface.io.awlock   <> io.awlock 
    axi_interface.io.awcache  <> io.awcache
    axi_interface.io.awprot   <> io.awprot 
    axi_interface.io.awvalid  <> io.awvalid
    axi_interface.io.awready  <> io.awready

    axi_interface.io.wid      <> io.wid   
    axi_interface.io.wdata    <> io.wdata 
    axi_interface.io.wstrb    <> io.wstrb 
    axi_interface.io.wlast    <> io.wlast 
    axi_interface.io.wvalid   <> io.wvalid
    axi_interface.io.wready   <> io.wready

    axi_interface.io.bid      <> io.bid   
    axi_interface.io.bresp    <> io.bresp 
    axi_interface.io.bvalid   <> io.bvalid
    axi_interface.io.bready   <> io.bready
  
    io.int_i_1  <> myc01_core.io.int_i_1
    io.int_i_2  <> myc01_core.io.int_i_2
    io.int_i_3  <> myc01_core.io.int_i_3
    io.int_i_4  <> myc01_core.io.int_i_4
    io.int_i_5  <> myc01_core.io.int_i_5
    io.int_i_6  <> myc01_core.io.int_i_6
   
    //io.pc  <> myc01_core.io.pc
  
 }