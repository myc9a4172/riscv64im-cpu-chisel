//ifid_reg  取指/译码寄存器模块

package myc01.core

import chisel3._
import chisel3.iotesters._
import define.myc01_core_define._

class ifid_reg extends Module {
  val io = IO(new Bundle {
  //from if_stage
	val if_pc        = Input(UInt(INST_ADDR_WIDTH))    //取值阶段发射的指令PC值 <64>
	val if_BTB_false = Input(UInt(1.W))                //取值阶段冲刷信号 <1> 
	val if_BTB_hit   = Input(UInt(2.W))                //取值阶段BTB预测命中与跳转信号 <2>
	val if_inst      = Input(UInt(INST_WIDTH))         //取指阶段发射的指令 <32>
	
  //to id_stage
	val id_pc        = Output(UInt(INST_ADDR_WIDTH))   //送至译码阶段的PC值 <64>
	val id_inst      = Output(UInt(INST_WIDTH))        //送至译码阶段的指令 <32>
	val id_BTB_false = Output(UInt(1.W))               //送至译码阶段的BTB冲刷信号 <1> 
	val id_BTB_hit   = Output(UInt(2.W))               //送至译码阶段的BTB预测命中与跳转信号 <2>
	
  //from stall_ctrl
	val stall        = Input(UInt(5.W))                //来自stall_ctrl模块的流水线暂停信号 <4> 
	
  //from excp
	val flush        =  Input(UInt(1.W))               //来自excp模块的流水线冲刷信号 <1>
  })

  val pc_reg        = RegInit(0.U(INST_ADDR_WIDTH))
  val inst_reg      = RegInit(0.U(INST_WIDTH))
  val BTB_hit_reg   = RegInit(0.U(2.W)) 
  val BTB_false_reg = RegInit(0.U(1.W)) 

  when(io.flush === 1.U){
      pc_reg        := ZERO_WORD
	  BTB_hit_reg   := 0.U
	  BTB_false_reg := 0.U  
	  inst_reg      := 0.U
  }.elsewhen(io.stall(1) === 1.U && io.stall(2) === 0.U){  
      pc_reg        := ZERO_WORD
	  BTB_hit_reg   := 0.U
	  BTB_false_reg := 0.U
	  inst_reg      := 0.U
  }.elsewhen(io.stall(1) === 0.U){                   
      pc_reg        := io.if_pc  
      BTB_hit_reg   := io.if_BTB_hit  
      BTB_false_reg := io.if_BTB_false 
	  inst_reg      := io.if_inst
  }.otherwise{
      pc_reg        := pc_reg
	  BTB_hit_reg   := BTB_hit_reg
	  BTB_false_reg := BTB_false_reg
	  inst_reg      := inst_reg 
  }
  io.id_pc        := pc_reg   
  io.id_BTB_hit   := BTB_hit_reg 
  io.id_BTB_false := BTB_false_reg
  io.id_inst      := inst_reg
}





