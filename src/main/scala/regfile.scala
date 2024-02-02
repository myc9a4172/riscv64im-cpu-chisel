//regfile  通用寄存器堆模块

package myc01.core

import chisel3._
import chisel3.iotesters._
import chisel3.util.experimental.loadMemoryFromFile
import define.myc01_core_define._

class regfile extends Module {
  val io = IO(new Bundle {
	val wa  = Input(UInt(REG_ADDR_WIDTH))      //通用处理器堆的写地址信号64
	val wd  = Input(UInt(XLEN))                //待写入通用处理器堆的数据64
	val we  = Input(UInt(1.W))                 //通用处理器堆的写使能信号
	
	val ra1 = Input(UInt(REG_ADDR_WIDTH))      //通用处理器堆的读端口1地址信号5
	val ra2 = Input(UInt(REG_ADDR_WIDTH))      //通用处理器堆的读端口2地址信号5
	val re1 = Input(UInt(1.W))                 //通用处理器堆的读端口1使能信号
	val re2 = Input(UInt(1.W))                 //通用处理器堆的读端口2使能信号
	
	val rd1 = Output(UInt(XLEN))               //通用处理器堆的读端口1读出的数据64
	val rd2 = Output(UInt(XLEN))               //通用处理器堆的读端口2读出的数据64
	
  })
  
  //定义32个64位寄存器
  //val regs = Mem(32, UInt(64.W)) 
  //loadMemoryFromFileInline(regs, "C:/Users/user/Desktop/myc01-core/src/main/resource/regs.txt")
  //loadMemoryFromFile(regs, "C:/Users/user/Desktop/myc01-core/src/main/resource/regs.txt")

  val regs = RegInit(VecInit(Seq.fill(REG_NUM)(0.U(XLEN)))) 

  //读端口1操作
  when(io.ra1 === REG_ZERO){                                                //0号寄存器输出为0
    io.rd1 := 0.U
  }.elsewhen((io.re1 === 1.U) && (io.ra1 === io.wa) && (io.we === 1.U)){    //同时读写同一个寄存器时直接输出，解决译码-写回数据相关
    io.rd1 := io.wd
  }. otherwise{
    io.rd1 := Mux((io.re1 === 1.U), regs(io.ra1), 0.U)
  }
 
  //读端口2操作
  when(io.ra2 === REG_ZERO){                                               //0号寄存器输出为0
    io.rd2 := 0.U
  }.elsewhen((io.re2 === 1.U) && (io.ra2 === io.wa) && (io.we === 1.U)){    //同时读写同一个寄存器时直接输出，解决译码-写回数据相关
    io.rd2 := io.wd
  }. otherwise{
    io.rd2 := Mux((io.re2 === 1.U), regs(io.ra2), 0.U)
  }
  
  //写端口操作
  when ((io.we === 1.U) && (io.wa =/= REG_ZERO)) {
    regs(io.wa) := io.wd
  }

}




