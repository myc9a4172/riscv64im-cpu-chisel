//wb_stage 写回模块

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import define.myc01_core_define._

class wb_stage extends Module {
  val io = IO(new Bundle {

	//from mem_stage	 
	val wb_wa_i        = Input(UInt(REG_ADDR_WIDTH))     //来自访存阶段的指令的目的寄存器地址 <5>
	val wb_wreg_i      = Input(UInt(1.W))                //来自访存阶段的指令的目的寄存器写使能信号 <1>
	val wb_dreg_i      = Input(UInt(XLEN))               //来自访存阶段的指令的待写入目的寄存器的数据 <64>
	val wb_mreg_i      = Input(UInt(1.W))                //来自访存阶段的指令的存储器到寄存器使能信号 <1>
	val wb_dre_i       = Input(UInt(8.W))                //来自访存阶段的指令的读字节使能信号 <8>
	val wb_load_unsign = Input(UInt(1.W))                //来自访存阶段的加载指令无符号扩展信号 <1>
	val csr_we_i       = Input(UInt(1.W))                //来自访存阶段的写csr寄存器使能
	val csr_wa_i       = Input(UInt(CSR_ADDR_WIDTH))     //来自访存阶段的写csr寄存器地址
	val csr_wd_i       = Input(UInt(XLEN))               //来自访存阶段的写csr寄存器数据
    val wb_big_endian  = Input(UInt(1.W))                //来自访存阶段的大小端标志信号
	val dm             = Input(UInt(XLEN))               //来自访存阶段的读出的存储器数据

	//to regfile
	val wb_wa_o   = Output(UInt(REG_ADDR_WIDTH))         //写回目的寄存器的目的寄存器地址 <5>
	val wb_wreg_o = Output(UInt(1.W))                    //写回目的寄存器的目的寄存器写使能信号 <1>
	val wb_wd_o   = Output(UInt(XLEN))                   //写回目的寄存器的数据  <64>
												         
	//to csr_reg                                         
	val csr_we_o = Output(UInt(1.W))                     //写回csr寄存器的写csr寄存器使能
	val csr_wa_o = Output(UInt(CSR_ADDR_WIDTH))          //写回csr寄存器的写csr寄存器地址
	val csr_wd_o = Output(UInt(XLEN))                    //写回csr寄存器的写csr寄存器数据
	
  })
  
	//传给csr寄存器的信号
	io.csr_we_o := io.csr_we_i
	io.csr_wa_o := io.csr_wa_i
    io.csr_wd_o := io.csr_wd_i

    //传递至通用寄存器堆的信号
	io.wb_wa_o    := io.wb_wa_i
	io.wb_wreg_o  := io.wb_wreg_i

	//根据读字节使能信号，从数据存储器中选择对应的字节    
	val data = WireInit(0.U(XLEN))
	when(io.wb_load_unsign === 1.U){    
		//lbu、lhu和lwu指令要求无符号扩展
		val data_unsignext = WireInit(0.U(XLEN))
		data_unsignext := MuxCase(0.U ,Seq(
		    (io.wb_dre_i =/= 0.U && io.wb_big_endian === 1.U) -> io.dm(7,0).asUInt(),
		    //lbu
		    (io.wb_dre_i === "b10000000".U) -> io.dm(63,56).asUInt(),
			(io.wb_dre_i === "b01000000".U) -> io.dm(55,48).asUInt(),
			(io.wb_dre_i === "b00100000".U) -> io.dm(47,40).asUInt(),
			(io.wb_dre_i === "b00010000".U) -> io.dm(39,32).asUInt(),
			(io.wb_dre_i === "b00001000".U) -> io.dm(31,24).asUInt(),
			(io.wb_dre_i === "b00000100".U) -> io.dm(23,16).asUInt(),
			(io.wb_dre_i === "b00000010".U) -> io.dm(15, 8).asUInt(),
			(io.wb_dre_i === "b00000001".U) -> io.dm( 7, 0).asUInt(),
			//lhu
			(io.wb_dre_i === "b11000000".U) -> Cat(io.dm(55,48),io.dm(63,56)).asUInt(),
			(io.wb_dre_i === "b00110000".U) -> Cat(io.dm(39,32),io.dm(47,40)).asUInt(),
			(io.wb_dre_i === "b00001100".U) -> Cat(io.dm(23,16),io.dm(31,24)).asUInt(),
			(io.wb_dre_i === "b00000011".U) -> Cat(io.dm(7,0),io.dm(15,8)).asUInt(),
			//lwu
			(io.wb_dre_i === "b11110000".U) -> Cat(io.dm(39,32),io.dm(47,40),io.dm(55,48),io.dm(63,56)).asUInt(),
			(io.wb_dre_i === "b00001111".U) -> Cat(io.dm(7,0),io.dm(15,8),io.dm(23,16),io.dm(31,24)).asUInt()))	
				
		data := data_unsignext.asUInt()
	}.otherwise{                         
		//lb,lh,lw,ld指令要求有符号扩展
		val data_signext = WireInit(0.S(XLEN))
		data_signext := MuxCase(0.S ,Seq(     
            (io.wb_dre_i =/= 0.U && io.wb_big_endian === 1.U) -> io.dm(7,0).asSInt(),		
            //lb
			(io.wb_dre_i === "b10000000".U) -> io.dm(63,56).asSInt(),
			(io.wb_dre_i === "b01000000".U) -> io.dm(55,48).asSInt(),
			(io.wb_dre_i === "b00100000".U) -> io.dm(47,40).asSInt(),
			(io.wb_dre_i === "b00010000".U) -> io.dm(39,32).asSInt(),
			(io.wb_dre_i === "b00001000".U) -> io.dm(31,24).asSInt(),
			(io.wb_dre_i === "b00000100".U) -> io.dm(23,16).asSInt(),
			(io.wb_dre_i === "b00000010".U) -> io.dm(15, 8).asSInt(),
			(io.wb_dre_i === "b00000001".U) -> io.dm( 7, 0).asSInt(),
			//lh
			(io.wb_dre_i === "b11000000".U) -> Cat(io.dm(55,48),io.dm(63,56)).asSInt(),
			(io.wb_dre_i === "b00110000".U) -> Cat(io.dm(39,32),io.dm(47,40)).asSInt(),
			(io.wb_dre_i === "b00001100".U) -> Cat(io.dm(23,16),io.dm(31,24)).asSInt(),
			(io.wb_dre_i === "b00000011".U) -> Cat(io.dm(7,0),io.dm(15,8)).asSInt(),
			//lw
			(io.wb_dre_i === "b11110000".U) -> Cat(io.dm(39,32),io.dm(47,40),io.dm(55,48),io.dm(63,56)).asSInt(),
			(io.wb_dre_i === "b00001111".U) -> Cat(io.dm(7,0),io.dm(15,8),io.dm(23,16),io.dm(31,24)).asSInt(),
			//ld
			(io.wb_dre_i === "b11111111".U) -> Cat(io.dm(7,0),io.dm(15,8),io.dm(23,16),io.dm(31,24),
			                                       io.dm(39,32),io.dm(47,40),io.dm(55,48),io.dm(63,56)).asSInt()))
			
		data := data_signext.asUInt()		
	}
	
	io.wb_wd_o := Mux((io.wb_mreg_i === 1.U), data.asUInt(), io.wb_dreg_i)
	
}

