//cache  cache模块(icache/dcache公用module)

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class cache (deep: Int)  extends Module {
  val io = IO(new Bundle {
	//cache与流水线交互
	val cpu_req       = Input (UInt(1.W))     //CPU访问cache请求信号
	val cpu_addr      = Input (UInt(64.W))    //读写cache地址
	val cpu_wr        = Input (UInt(1.W))     //读写cache使能 1写/0读
	val cpu_wstrb     = Input (UInt(8.W))     //写cache字节使能
	val cpu_wdata     = Input (UInt(64.W))    //写cache数据
	val cpu_rdata     = Output(UInt(64.W))    //读cache数据
	val operation_ok  = Output(UInt(64.W))    //cache访问操作完成  有问题 应该是1位
    val cache_invalid = Input (UInt(1.W))     //清空cache（保持$i$d一致性）
	
    //cache与转接模块交互
	val ram_req     = Output(UInt(1.W)) 
	val ram_wr      = Output(UInt(1.W))
	val ram_wstrb   = Output(UInt(8.W))
	val ram_addr    = Output(UInt(64.W))
	val ram_wdata   = Output(UInt(64.W))
	val ram_rdata   = Input (UInt(64.W))
	val ram_beat_ok = Input (UInt(1.W))
	val ram_data_ok = Input (UInt(1.W))
	val uncached    = Output(UInt(1.W))       //数据地址是否处于不可缓存区域标志
  //val ram_addr_ok = Input (UInt(1.W))
  }) 
    
  //从访存地址中提取tag/index/offset 
    val addr_tag    = io.cpu_addr(63,4+log2Ceil(deep))
	val addr_index  = io.cpu_addr(3+log2Ceil(deep),4)
	val addr_offset = io.cpu_addr(3,0)
  
  //定义cache存储结构体 写直通+写不分配
	val V          = RegInit(VecInit(Seq.fill(deep)(0.U(1.W))))    //v
    val Tag        = RegInit(VecInit(Seq.fill(deep)(0.U((60-log2Ceil(deep)).W))))   //tag
    val Cache_line = RegInit(VecInit(Seq.fill(deep)(0.U(128.W))))  //cacheline
  
  //CPU送来的请求信号延迟一个周期作为cache驱动
  val req = RegInit(0.U(1.W))
  req := MuxCase(req, Seq(
         (io.operation_ok === 1.U)  -> 0.U,
         (io.cpu_req === 1.U && req === 0.U) -> 1.U))
		 
  //判断cache是否命中
  val hit = Mux((Tag(addr_index) === addr_tag && V(addr_index) === 1.U) && io.uncached === 0.U, 1.U ,0.U) 
  
  //根据命中情况读出数据送回至CPU
  io.cpu_rdata := MuxCase(0.U,Seq(
     (io.cpu_wr === 0.U && hit === 1.U && io.uncached === 0.U) -> 
	    Mux(addr_offset(3) === 1.U,Cache_line(addr_index)(63,0),Cache_line(addr_index)(127,64)),
	 (io.uncached === 1.U && io.ram_data_ok === 1.U) -> io.ram_rdata))
  
 
  //与类sram端口通讯 
  //读miss发出对cacheline的读请求，写(无论是否miss)发出对cpu指定地址写请求
  val read_miss = req === 1.U && io.cpu_wr === 0.U && hit === 0.U && io.uncached === 0.U

  io.ram_req := MuxCase(0.U,Seq(
                    (read_miss === 1.U && io.ram_data_ok === 0.U) -> 1.U,   //读未命中
					(io.uncached === 1.U && io.ram_data_ok === 0.U) -> 1.U, //访问不可缓存区
					(req === 1.U && io.cpu_wr === 1.U && io.ram_data_ok === 0.U) -> 1.U)) //写操作

  //写直通策略，uncache只涉及读
  io.uncached := Mux(req === 1.U && io.cpu_wr === 0.U && io.cpu_addr(63) === 1.U ,1.U ,0.U)
  io.ram_wr   := MuxCase(0.U,Seq(
                    ((req === 1.U && io.cpu_wr === 0.U && io.uncached === 0.U)||io.uncached === 1.U)-> 0.U,
					(req === 1.U && io.cpu_wr === 1.U) -> 1.U))  
  //uncache和写均直接传地址，读不命中送出Cache_line首地址
  io.ram_addr := MuxCase(0.U,Seq(
                    (read_miss === 1.U) -> Cat(io.cpu_addr(63,4),Fill(4,0.U(1.W))),
                    (io.uncached === 1.U) -> io.cpu_addr,               
					(req === 1.U && io.cpu_wr === 1.U) -> io.cpu_addr))		 
  io.operation_ok := MuxCase(0.U,Seq(
                    (io.cpu_wr === 0.U && hit === 1.U) -> 1.U,//读cache命中(直接命中(直接返回数据)/miss更新后命中)
					(io.uncached === 1.U && io.ram_data_ok === 1.U) -> 1.U,//读uncache返回数据
					(req === 1.U && io.cpu_wr === 1.U && io.ram_data_ok === 1.U) -> 1.U)) //写操作无论hit 等待ram返回ok
  
  io.ram_wstrb := Mux((req === 1.U && io.cpu_wr === 1.U),io.cpu_wstrb,0.U)
  io.ram_wdata := Mux((req === 1.U && io.cpu_wr === 1.U),io.cpu_wdata,0.U)
  
  //cache数据的更新
  val cnt = RegInit(0.U(2.W)) //突发传输计数器
  val cache_temp = Cache_line(addr_index)
  
  val addr_index_temp = RegInit(0.U(log2Ceil(deep).W))//在cache更新时应当保持index不变，不然分支预测会造成错误index写入
  addr_index_temp := Mux(read_miss === 1.U && io.ram_data_ok === 0.U,addr_index_temp,addr_index)
  
  //读miss替换cache_line
  when(io.cache_invalid === 1.U){
      V := VecInit(Seq.fill(deep)(0.U(1.W)))
  }.elsewhen(read_miss === 1.U && io.ram_beat_ok === 1.U){
      when(cnt === 1.U){ 
	    Cache_line(addr_index_temp):= Cat(Cache_line(addr_index_temp)(127,64),io.ram_rdata)
	    Tag(addr_index_temp) := addr_tag
	    V(addr_index_temp) := 1.U
	    cnt := 0.U
	  }.otherwise{
	   Cache_line(addr_index_temp):= Cat(io.ram_rdata,Cache_line(addr_index_temp)(63,0))
	    cnt := 1.U
	  }
  //写hit更新cache_line
  }.elsewhen(req === 1.U && io.cpu_wr === 1.U && hit === 1.U && addr_offset(3) === 1.U){
     Cache_line(addr_index) := MuxCase(0.U,Seq(
	   (io.cpu_wstrb === "b10000000".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"h00ffffff_ffffffff".U)|(io.cpu_wdata&"hff000000_00000000".U))),
	   (io.cpu_wstrb === "b01000000".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hff00ffff_ffffffff".U)|(io.cpu_wdata&"h00ff0000_00000000".U))),
	   (io.cpu_wstrb === "b00100000".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffff00ff_ffffffff".U)|(io.cpu_wdata&"h0000ff00_00000000".U))),
	   (io.cpu_wstrb === "b00010000".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffffff00_ffffffff".U)|(io.cpu_wdata&"h000000ff_00000000".U))),
	   (io.cpu_wstrb === "b00001000".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffffffff_00ffffff".U)|(io.cpu_wdata&"h00000000_ff000000".U))),
	   (io.cpu_wstrb === "b00000100".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffffffff_ff00ffff".U)|(io.cpu_wdata&"h00000000_00ff0000".U))),
	   (io.cpu_wstrb === "b00000010".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffffffff_ffff00ff".U)|(io.cpu_wdata&"h00000000_0000ff00".U))),
	   (io.cpu_wstrb === "b00000001".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffffffff_ffffff00".U)|(io.cpu_wdata&"h00000000_000000ff".U))),
	   (io.cpu_wstrb === "b11000000".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"h0000ffff_ffffffff".U)|(io.cpu_wdata&"hffff0000_00000000".U))),
	   (io.cpu_wstrb === "b00110000".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffff0000_ffffffff".U)|(io.cpu_wdata&"h0000ffff_00000000".U))),
	   (io.cpu_wstrb === "b00001100".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffffffff_0000ffff".U)|(io.cpu_wdata&"h00000000_ffff0000".U))),
	   (io.cpu_wstrb === "b00000011".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffffffff_ffff0000".U)|(io.cpu_wdata&"h00000000_0000ffff".U))),
	   (io.cpu_wstrb === "b11110000".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"h00000000_ffffffff".U)|(io.cpu_wdata&"hffffffff_00000000".U))),
	   (io.cpu_wstrb === "b00001111".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"hffffffff_00000000".U)|(io.cpu_wdata&"h00000000_ffffffff".U))),
	   (io.cpu_wstrb === "b11111111".U) -> Cat(cache_temp(127,64),((cache_temp(63,0)&"h00000000_00000000".U)|(io.cpu_wdata&"hffffffff_ffffffff".U)))))
  }.elsewhen(req === 1.U && io.cpu_wr === 1.U && hit === 1.U && addr_offset(3) === 0.U){
	Cache_line(addr_index)  := MuxCase(0.U,Seq(
	   (io.cpu_wstrb === "b10000000".U) -> Cat(((cache_temp(127,64)&"h00ffffff_ffffffff".U)|(io.cpu_wdata&"hff000000_00000000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b01000000".U) -> Cat(((cache_temp(127,64)&"hff00ffff_ffffffff".U)|(io.cpu_wdata&"h00ff0000_00000000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00100000".U) -> Cat(((cache_temp(127,64)&"hffff00ff_ffffffff".U)|(io.cpu_wdata&"h0000ff00_00000000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00010000".U) -> Cat(((cache_temp(127,64)&"hffffff00_ffffffff".U)|(io.cpu_wdata&"h000000ff_00000000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00001000".U) -> Cat(((cache_temp(127,64)&"hffffffff_00ffffff".U)|(io.cpu_wdata&"h00000000_ff000000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00000100".U) -> Cat(((cache_temp(127,64)&"hffffffff_ff00ffff".U)|(io.cpu_wdata&"h00000000_00ff0000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00000010".U) -> Cat(((cache_temp(127,64)&"hffffffff_ffff00ff".U)|(io.cpu_wdata&"h00000000_0000ff00".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00000001".U) -> Cat(((cache_temp(127,64)&"hffffffff_ffffff00".U)|(io.cpu_wdata&"h00000000_000000ff".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b11000000".U) -> Cat(((cache_temp(127,64)&"h0000ffff_ffffffff".U)|(io.cpu_wdata&"hffff0000_00000000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00110000".U) -> Cat(((cache_temp(127,64)&"hffff0000_ffffffff".U)|(io.cpu_wdata&"h0000ffff_00000000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00001100".U) -> Cat(((cache_temp(127,64)&"hffffffff_0000ffff".U)|(io.cpu_wdata&"h00000000_ffff0000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00000011".U) -> Cat(((cache_temp(127,64)&"hffffffff_ffff0000".U)|(io.cpu_wdata&"h00000000_0000ffff".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b11110000".U) -> Cat(((cache_temp(127,64)&"h00000000_ffffffff".U)|(io.cpu_wdata&"hffffffff_00000000".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b00001111".U) -> Cat(((cache_temp(127,64)&"hffffffff_00000000".U)|(io.cpu_wdata&"h00000000_ffffffff".U)),cache_temp(63,0)),
	   (io.cpu_wstrb === "b11111111".U) -> Cat(((cache_temp(127,64)&"h00000000_00000000".U)|(io.cpu_wdata&"hffffffff_ffffffff".U)),cache_temp(63,0))))
  } 
}