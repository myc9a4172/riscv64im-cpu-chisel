//stall_ctrl  流水线暂停控制模块

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class stall_ctrl extends Module {
  val io = IO(new Bundle {
	val stallreq_id  = Input(UInt(1.W))    //译码模块流水线暂停请求信号
	val stallreq_exe = Input(UInt(1.W))    //执行模块流水线暂停请求信号
	val stallreq_mem = Input(UInt(1.W))    //总线访存流水线暂停请求信号
	val stall        = Output(UInt(5.W))   //流水线暂停信号
  }) 
  
  //根据传入的暂停请求信号产生流水线暂停信号stall
  //stall(0)=1 pc值不变 / stall(1)=1 取指阶段暂停 / stall(2)=1 译码阶段暂停 / stall(3)=1 执行阶段暂停 / stall(4)=1 访存阶段暂停
  io.stall := MuxCase( "b00000".U, Seq(
      (io.stallreq_mem === 1.U ) -> "b11111".U,
      (io.stallreq_id  === 1.U ) -> "b00111".U,
      (io.stallreq_exe === 1.U)  -> "b01111".U ))
}
