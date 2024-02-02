//axi_interface  类sram-axi转换桥

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class axi_interface extends Module {
  val io = IO(new Bundle {
   //icache与转接桥 inst sram-like接口通讯
    val inst_req      = Input (UInt(1.W))   //cpu2bridge  cpu发出的读指令信号
	val inst_we       = Input (UInt(1.W))   //cpu2bridge  取指访存写使能(长置0)
	val inst_wstrb    = Input (UInt(8.W))
	val inst_addr     = Input (UInt(64.W))  //cpu2bridge  取指访存请求的地址
	val inst_wdata    = Input (UInt(64.W))  //cpu2bridge  取值访存请求的写数据
	val inst_rdata    = Output(UInt(64.W))  //bridge2cpu  取指访存返回的数据
	//val inst_addr_ok  = Output(UInt(1.W))   //bridge2cpu  允许传入新的读指令地址
	val inst_beat_ok  = Output(UInt(1.W))   //bridge2cpu  突发传输单次访存完成
	val inst_data_ok  = Output(UInt(1.W))   //bridge2cpu  突发传输所有访存完成
	val inst_uncached = Input (UInt(1.W))   //cpu2bridge  访问不可缓存区信号
	//val inst_size     = Input (UInt(2.W))   //cpu2bridge  取指访存请求传输的字节数， 0: 1byte； 1: 2bytes； 2: 4bytes; 3:8bytes
   
   //dcache与转接桥 data sram-like接口通讯   
	val data_req      = Input (UInt(1.W))   //cpu2bridge  cpu发出的访存请求信号
	val data_we       = Input (UInt(1.W))   //cpu2bridge  访存请求写使能
	val data_wstrb    = Input (UInt(8.W))   //cpu2bridge  访存请求写字节选择
	val data_addr     = Input (UInt(64.W))  //cpu2bridge  访存请求的地址
	val data_wdata    = Input (UInt(64.W))  //cpu2bridge  访存请求的写数据
	val data_rdata    = Output(UInt(64.W))  //bridge2cpu  访存返回的数据
	val data_beat_ok  = Output(UInt(1.W))   //bridge2cpu  突发传输单次访存完成
	val data_data_ok  = Output(UInt(1.W))   //bridge2cpu  突发传输所有访存完成
	val data_uncached = Input (UInt(1.W))   //cpu2bridge  访问不可缓存区信号
	//val data_raddr_ok = Output(UInt(1.W))   //bridge2cpu  允许传入新的读数据地址
	//val data_waddr_ok = Output(UInt(1.W))   //bridge2cpu  允许传入新的写数据地址
	//val data_size     = Input (UInt(2.W))   //cpu2bridge  访存请求传输的字节数， 0: 1byte； 1: 2bytes； 2: 4bytes; 3:8bytes

	
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
     val rlast   = Input (UInt(1.W))   //bridge2axi 读最后一个数据指示信号。表示突发传输中的最后一个数据。为了妥协外设，rlast目前暂停使用
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
  })
    
    val data_rreq = (io.data_req === 1.U) && (io.data_we === 0.U)
    val data_wreq = (io.data_req === 1.U) && (io.data_we === 1.U)
    val inst_rreq = (io.inst_req === 1.U) && (io.inst_we === 0.U) && (data_rreq === 0.U)

    val ar_hs  = io.arready === 1.U && io.arvalid === 1.U
    val r_hs   = io.rready  === 1.U && io.rvalid  === 1.U
    val aw_hs  = io.awready === 1.U && io.awvalid === 1.U
    val w_hs   = io.wready  === 1.U && io.wvalid  === 1.U
    val b_hs   = io.bready  === 1.U && io.bvalid  === 1.U
	
	val read_buffer_addr       = RegInit(0.U(64.W))
    val read_buffer_dataORinst = RegInit(0.U(1.W))   //记录当前总线读事务为数据(1)or指令(0)
    val read_buffer_size       = RegInit(0.U(2.W))
	val read_buffer_burst      = RegInit(0.U(2.W))
	val read_buffer_len        = RegInit(0.U(8.W))
	
	val write_buffer_addr      = RegInit(0.U(64.W))
    val write_buffer_data      = RegInit(0.U(64.W))
    val write_buffer_size      = RegInit(0.U(2.W))
    val write_buffer_wstrb     = RegInit(0.U(8.W))

    //状态机信号设置
	val read_STATE_FREE  :: read_STATE_REQ  :: read_STATE_READ   :: Nil = Enum(3)  
	val write_STATE_FREE :: write_STATE_REQ :: write_STATE_WRITE :: Nil = Enum(3)	
	val read_state  = RegInit(read_STATE_FREE) 
	val write_state = RegInit(write_STATE_FREE)

    val allow_new_read  = (read_state  === read_STATE_FREE ) || (read_state  === read_STATE_READ  && r_hs === 1.U && io.rlast === 1.U)
    val allow_new_write = (write_state === write_STATE_FREE) || (write_state === write_STATE_WRITE && io.bvalid === 1.U)
    
	//写读相同地址冲突
    val read_write_conflict = (read_state =/= read_STATE_FREE) && (io.data_addr === read_buffer_addr) && (io.data_we === 1.U)

	//读状态机转移逻辑
	switch(read_state){ 
      //存在读指令/读数据请求，转入请求态，等待地址握手
	    is(read_STATE_FREE) { read_state := Mux((inst_rreq === 1.U/*io.inst_req === 1.U*/ || data_rreq === 1.U), read_STATE_REQ, read_STATE_FREE)} 
      //地址握手成功后转入读数据态
	    is(read_STATE_REQ)  { read_state := Mux(io.arready === 1.U, read_STATE_READ, read_STATE_REQ)} 
      //最后一个数据传输完成后转回free态
	    is(read_STATE_READ) { read_state := Mux(io.rlast === 1.U, read_STATE_FREE, read_STATE_READ)} 
    }
    //写状态机转移逻辑
	switch(write_state){ 
      //存在写数据请求且无写读冲突，转入请求态，等待地址握手
	    is(write_STATE_FREE) { write_state := Mux((data_wreq === 1.U && read_write_conflict === 0.U), write_STATE_REQ, write_STATE_FREE) }   
	  //地址握手成功后转入写数据态   
        is(write_STATE_REQ)  { write_state := Mux(io.awready === 1.U, write_STATE_WRITE, write_STATE_REQ)} 
      //写响应返回后转回free态
	    is(write_STATE_WRITE){ write_state := Mux(io.bvalid === 1.U, write_STATE_FREE, write_STATE_WRITE)} 
    }
    //更新read_buffer    
    when(allow_new_read === 1.U){
        read_buffer_addr       := Mux(data_rreq === 1.U,io.data_addr,io.inst_addr)
        read_buffer_dataORinst := Mux(data_rreq === 1.U,1.U,0.U)  //记录是否为读数据 1读数据 0读指令
        read_buffer_size       := 3.U
		read_buffer_burst      := MuxCase(0.U,Seq(                //访问可缓存区 开启burst
	                         	(data_rreq === 1.U && io.data_uncached === 0.U) -> 1.U,
								(inst_rreq === 1.U && io.inst_uncached === 0.U) -> 1.U))
		read_buffer_len        := MuxCase(0.U,Seq(                //访问可缓存区 burst长度2
	                         	(data_rreq === 1.U && io.data_uncached === 0.U) -> 1.U,
								(inst_rreq === 1.U && io.inst_uncached === 0.U) -> 1.U)) 
    }
    //更新write_buffer
    when(allow_new_write === 1.U){
        write_buffer_addr   := io.data_addr
        write_buffer_data   := io.data_wdata
        write_buffer_size   := 3.U
        write_buffer_wstrb  := io.data_wstrb
    }

    val data_beat_back = read_state === read_STATE_READ && r_hs === 1.U 
    val write_back = write_state === write_STATE_WRITE && b_hs === 1.U

    //io.inst_addr_ok := allow_new_read === 1.U && data_rreq === 0.U  //优先保证读数据
    //io.data_raddr_ok := allow_new_read === 1.U 
	//io.data_waddr_ok := allow_new_write === 1.U && read_write_conflict === 0.U	
	//io.data_raddr_ok := ((read_state === read_STATE_REQ) && (ar_hs === 1.U))||((write_state === write_STATE_REQ) && (aw_hs === 1.U))
	
    io.inst_rdata   := io.rdata
	io.inst_beat_ok := read_buffer_dataORinst === 0.U && data_beat_back === 1.U
	io.inst_data_ok := read_buffer_dataORinst === 0.U && data_beat_back === 1.U && io.rlast===1.U
    io.data_rdata   := io.rdata
	io.data_beat_ok := (read_buffer_dataORinst === 1.U && data_beat_back === 1.U) || write_back === 1.U 
    io.data_data_ok := (read_buffer_dataORinst === 1.U && data_beat_back === 1.U && io.rlast===1.U) || write_back === 1.U

    // 设置AXI相关信号
    // 读地址通道信号
    io.arid    := 0.U
    io.araddr  := read_buffer_addr
    io.arlen   := read_buffer_len
	io.arsize  := read_buffer_size
    io.arburst := read_buffer_burst
    io.arlock  := 0.U
    io.arcache := 0.U
    io.arprot  := 0.U
    io.arvalid := read_state === read_STATE_REQ
    // 读数据通道信号
    io.rready  := 1.U
    // 写地址通道信号
    io.awid    := 0.U
    io.awaddr  := write_buffer_addr
    io.awlen   := 0.U
	io.awsize  := write_buffer_size
    io.awburst := 0.U
    io.awlock  := 0.U
    io.awcache := 0.U
    io.awprot  := 0.U
    io.awvalid := write_state === write_STATE_REQ
    //写数据通道信号
    io.wid    := 0.U
    io.wdata  := write_buffer_data
    io.wstrb  := write_buffer_wstrb
    io.wlast  := 1.U
    io.wvalid := write_state === write_STATE_WRITE
    //写响应通道信号
    io.bready := 1.U
}