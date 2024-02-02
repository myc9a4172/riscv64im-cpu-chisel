//clint  局部中断控制器(软件、计时器中断)

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import define.myc01_core_define._

class clint extends Module {
  val io = IO(new Bundle {
    val we      = Input(UInt(1.W))
	val addr   = Input(UInt(64.W))
	val wd      = Input(UInt(XLEN))
	
	/*
	val re      = Input(UInt(1.W))
	val raddr   = Input(UInt(64.W))
	val rd      = Input(UInt(64.W))
	*/
	
	val software_int  = Output(UInt(1.W))   //软件中断
	val timer_int     = Output(UInt(1.W))   //计时器中断
	
  }) 
  
  //根据小端模式重新组织存储内容
  val data = Cat(io.wd(7,0),io.wd(15,8),io.wd(23,16),io.wd(31,24),io.wd(39,32),io.wd(47,40),io.wd(55,48),io.wd(63,56))
  
  val mtime    = RegInit(0.U(64.W))        
  val mtimecmp = RegInit("hffffffffffffffff".U(64.W))
  val msip     = RegInit(0.U(1.W))
  
  //写寄存器
  mtime    := Mux(io.we === 1.U && io.addr === MTIME_ADDR, data ,mtime + 1.U) 
  mtimecmp := Mux(io.we === 1.U && io.addr === MTIMECMP_ADDR, data ,mtimecmp)
  msip     := Mux(io.we === 1.U && io.addr === MSIP_ADDR, data ,msip)
  
  
  //当mtime>mtimecmp时计时器中断拉高
  io.timer_int := Mux(mtime > mtimecmp ,1.U ,0.U)
  
  //当msip寄存器被置1时产生软件中断
  io.software_int := Mux(msip =/= 0.U ,1.U ,0.U)
  
}
