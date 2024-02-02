//exe_stage  执行模块

package myc01.core

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import define.myc01_core_define._

class exe_stage extends Module {
  val io = IO(new Bundle {
	//from id_stage
	val exe_pc_i        =  Input(UInt(INST_ADDR_WIDTH)) //译码阶段传入的pc <64>
	val exe_alutype_i   =  Input(UInt(ALUTYPE_WIDTH))   //译码阶段传入的操作类型  <3>
	val exe_aluop_i     =  Input(UInt(ALUOP_WIDTH))     //译码阶段传入的内部操作码 <8>
	val exe_src1_i      =  Input(UInt(XLEN))            //译码阶段传入的源操作数1 <64>
	val exe_src2_i      =  Input(UInt(XLEN))            //译码阶段传入的源操作数2 <64>
	val exe_wa_i        =  Input(UInt(REG_ADDR_WIDTH))  //译码阶段传入的目的寄存器地址 <5>
	val exe_wreg_i      =  Input(UInt(1.W))             //译码阶段传入的通用寄存器堆使能信号 <1>
	val exe_mreg_i      =  Input(UInt(1.W))             //译码阶段传入的存储器到寄存器使能的信号 <1>
	val exe_din_i       =  Input(UInt(XLEN))            //译码阶段传入待写入数据存储器的数据 <64>
	val csr_addr_i      =  Input(UInt(CSR_ADDR_WIDTH))  //译码阶段传入的csr寄存器读写地址 <12>
	val csr_rd_i        =  Input(UInt(XLEN))            //csr寄存器读出的数据 <64>
	val exe_exccode_i   =  Input(UInt(EXCCODE_WIDTH))   //译码阶段传入的exccode <5>
	val exe_jump_addr_i =  Input(UInt(INST_ADDR_WIDTH)) //译码阶段传入的跳转指令跳转地址 <64>
	
    //送至访存阶段的信息
	val exe_pc_o        =  Output(UInt(INST_ADDR_WIDTH)) //送往访存阶段的PC <64>
	val exe_aluop_o     =  Output(UInt(ALUOP_WIDTH))     //送往访存阶段的内部操作码 <8>
	val exe_wa_o        =  Output(UInt(REG_ADDR_WIDTH))  //送往访存阶段的目的存储器的地址 <5>
	val exe_wreg_o      =  Output(UInt(1.W))             //送往访存阶段的寄存器写使能信号 <1>
	val exe_wd_o        =  Output(UInt(XLEN))            //送往访存阶段的待写入目的寄存器的数据 <64>
	val exe_mreg_o      =  Output(UInt(1.W))             //送往访存阶段的存储器到寄存器使能信号 <1>
	val exe_din_o       =  Output(UInt(XLEN))            //送往访存阶段的待写入存储器中的数据 <64>
	val csr_wa_o        =  Output(UInt(CSR_ADDR_WIDTH))  //送往访存阶段的csr寄存器写地址 <12>
	val csr_wd_o        =  Output(UInt(XLEN))            //送往访存阶段的待写入csr寄存器的数据 <64> 
	val csr_we_o        =  Output(UInt(1.W))             //送往访存阶段的csr寄存器写使能 <1>
	val exe_exccode_o   =  Output(UInt(EXCCODE_WIDTH))   //送往访存阶段的exccode
	val exe_jump_addr_o =  Output(UInt(INST_ADDR_WIDTH)) //送往访存阶段的跳转指令跳转地址 <64>
	
	//to stall_ctrl
	val stallreq_exe  = Output(UInt(1.W))  //多周期除法指令向ctrl发出流水线暂停请求
	
	//to excp
	val csr_ra_o      =  Output(UInt(CSR_ADDR_WIDTH)) //csr寄存器读地址
	val csr_re_o      =  Output(UInt(1.W))  //csr寄存器读使能
	
	//csr寄存器定向前推信号
	val mem2exe_csr_we = Input(UInt(1.W))
	val mem2exe_csr_wa = Input(UInt(CSR_ADDR_WIDTH))
	val mem2exe_csr_wd = Input(UInt(XLEN))
	val wb2exe_csr_we  = Input(UInt(1.W))
	val wb2exe_csr_wa  = Input(UInt(CSR_ADDR_WIDTH))
	val wb2exe_csr_wd  = Input(UInt(XLEN))
  })

  //直接传送到下一阶段
  //io.exe_pc_o      := Mux(jump_inst === 1.U,0.U,io.exe_pc_i)  //遇到B指令应当截住pc传播，避免在B指令时处理中断(否则mepc不对) J指令在mem_stage处理
  io.exe_pc_o        := io.exe_pc_i  
  io.exe_aluop_o     := io.exe_aluop_i
  io.exe_mreg_o      := io.exe_mreg_i 
  io.exe_din_o       := io.exe_din_i
  io.exe_wa_o        := io.exe_wa_i
  io.exe_wreg_o      := io.exe_wreg_i
  io.exe_exccode_o   := io.exe_exccode_i
  io.exe_jump_addr_o := io.exe_jump_addr_i
  
  //RV64I指令的运算
  //R-type
  val andAns   = io.exe_src1_i & io.exe_src2_i
  val orAns    = io.exe_src1_i | io.exe_src2_i 
  val xorAns   = io.exe_src1_i ^ io.exe_src2_i
  val addAns   = io.exe_src1_i + io.exe_src2_i
  val subAns   = io.exe_src1_i - io.exe_src2_i
  val sltAns   = Mux((io.exe_src1_i.asSInt() < io.exe_src2_i.asSInt()),  1.U(XLEN), 0.U(XLEN))
  val sltuAns  = Mux((io.exe_src1_i.asUInt() < io.exe_src2_i.asUInt()),  1.U(XLEN), 0.U(XLEN)) 
  val sllAns   = (io.exe_src1_i << io.exe_src2_i(5,0))(63,0)              
  val srlAns   = (io.exe_src1_i.asUInt() >> io.exe_src2_i(5,0)).asUInt()  
  val sraAns   = (io.exe_src1_i.asSInt() >> io.exe_src2_i(5,0)).asUInt()  
  
  //I-type
  val addiAns  = io.exe_src1_i + io.exe_src2_i
  val sltiAns  = Mux((io.exe_src1_i.asSInt() < io.exe_src2_i.asSInt()),  1.U(XLEN), 0.U(XLEN)) 
  val sltiuAns = Mux((io.exe_src1_i.asUInt() < io.exe_src2_i.asUInt()),  1.U(XLEN), 0.U(XLEN))
  val xoriAns  = io.exe_src1_i ^ io.exe_src2_i
  val oriAns   = io.exe_src1_i | io.exe_src2_i
  val andiAns  = io.exe_src1_i & io.exe_src2_i 
  val slliAns  = (io.exe_src1_i << io.exe_src2_i(5,0))(63,0)             
  val srliAns  = (io.exe_src1_i.asUInt() >> io.exe_src2_i(5,0)).asUInt()          
  val sraiAns  = (io.exe_src1_i.asSInt() >> io.exe_src2_i(5,0)).asUInt() 
  val lbAns    = io.exe_src1_i + io.exe_src2_i
  val lhAns    = io.exe_src1_i + io.exe_src2_i
  val lwAns    = io.exe_src1_i + io.exe_src2_i
  val lbuAns   = io.exe_src1_i + io.exe_src2_i
  val lhuAns   = io.exe_src1_i + io.exe_src2_i
  val lwuAns   = io.exe_src1_i + io.exe_src2_i
  val ldAns    = io.exe_src1_i + io.exe_src2_i
  val jalrAns  = io.exe_pc_i   + 4.U

  //S-type  
  val sbAns    = io.exe_src1_i + io.exe_src2_i
  val shAns    = io.exe_src1_i + io.exe_src2_i
  val swAns    = io.exe_src1_i + io.exe_src2_i
  val sdAns    = io.exe_src1_i + io.exe_src2_i
  
  //U-type
  val luiAns   = (io.exe_src2_i << 12.U)(63,0)
  val auipcAns = ((io.exe_src2_i << 12.U) + io.exe_pc_i)(63,0)
  
  //J-type 
  val jalAns   = io.exe_pc_i + 4.U
  
  //RV64M指令的运算
  
  //符号扩展函数
  def unsign_sext (n: UInt) = {
    val sign64 = WireInit(0.S(XLEN)) 
        sign64 := n.asSInt
	sign64.asUInt()
  }
  def sign_sext (n: SInt) = {
    val sign64 = WireInit(0.S(XLEN)) 
        sign64 := n.asSInt
	sign64.asUInt()
  }
  
  val addiwAns = unsign_sext((io.exe_src1_i + io.exe_src2_i)(31,0))
  val addwAns  = unsign_sext((io.exe_src1_i + io.exe_src2_i)(31,0))
  val subwAns  = unsign_sext((io.exe_src1_i - io.exe_src2_i)(31,0))	 
  val sllwAns  = unsign_sext((io.exe_src1_i(31,0) << io.exe_src2_i(4,0))(31,0))
  val slliwAns = unsign_sext((io.exe_src1_i(31,0) << io.exe_src2_i(4,0))(31,0))	  
  val srlwAns  = unsign_sext((io.exe_src1_i(31,0).asUInt() >> io.exe_src2_i(4,0)))
  val srliwAns = unsign_sext((io.exe_src1_i(31,0).asUInt() >> io.exe_src2_i(4,0)))	  
  val srawAns  = sign_sext((io.exe_src1_i(31,0).asSInt() >> io.exe_src2_i(4,0)))			  
  val sraiwAns = sign_sext((io.exe_src1_i(31,0).asSInt() >> io.exe_src2_i(4,0)))
  
  /*
  //乘法指令
  val mulAns    = (io.exe_src1_i.asSInt() * io.exe_src2_i.asSInt())(63,0)
  val mulhAns   = (io.exe_src1_i.asSInt() * io.exe_src2_i.asSInt())(127,64)
  val mulhsuAns = (io.exe_src1_i.asSInt() * io.exe_src2_i.asUInt())(127,64)
  val mulhuAns  = (io.exe_src1_i.asUInt() * io.exe_src2_i.asUInt())(127,64)
  val mulwAns   = unsign_sext((io.exe_src1_i * io.exe_src2_i)(31,0))               
  */	
  
 /*乘法模块----------------------------------------------------------------------------------*/			
	//指令译码
  val mul_inst = (io.exe_aluop_i === RV64M_MUL)    | (io.exe_aluop_i === RV64M_MULH)  |
                 (io.exe_aluop_i === RV64M_MULHSU) | (io.exe_aluop_i === RV64M_MULHU) |
				 (io.exe_aluop_i === RV64M_MULW) 
  //有符号被乘数			 
  val signed_mulop1 = (io.exe_aluop_i === RV64M_MUL)    | (io.exe_aluop_i === RV64M_MULH)  | 
                      (io.exe_aluop_i === RV64M_MULHSU) | (io.exe_aluop_i === RV64M_MULW) 
  //有符号乘数					
  val signed_mulop2 = (io.exe_aluop_i === RV64M_MUL)    | (io.exe_aluop_i === RV64M_MULH)  |
                      (io.exe_aluop_i === RV64M_MULW)  

  val mulres   = RegInit(0.U(128.W))   //乘法结果保存寄存器
  val mul_done = RegInit(0.U(1.W))     //乘法完成状态寄存器
  //io.stallreq_exe := Mux((mul_inst === 1.U && mul_done === 0.U),1.U,0.U) //判断为乘法指令且乘法未完成则发送流水线暂停信号           

  val mul_op1 = io.exe_src1_i //被乘数     
  val mul_op2 = io.exe_src2_i //乘数  
  
 //乘法开始信号
  val mul_start = Mux((mul_inst === 1.U && mul_done === 0.U),1.U,0.U)    
  
  //乘法相关寄存器
  val mul_cnt         = RegInit(0.U(4.W))      //乘法计数器 cnt=8乘法结束
  val multemp     = RegInit(0.U(128.W))    //乘法结果中间寄存器
  val mul_temp_op1    = RegInit(0.U(64.W))     //保存被乘数有无符号转换结果
  val mul_temp_op2    = RegInit(0.U(64.W))     //保存乘数有无符号转换结果
			      
  val mul_temp1   = RegInit(0.U(32.W))     //a*b(15,0) 16*16位乘法结果
  val mul_temp2   = RegInit(0.U(32.W))     //a*b(31,16) 16*16位乘法结果
  val mul_temp3   = RegInit(0.U(32.W))     //a*b(47,32) 16*16位乘法结果
  val mul_temp4   = RegInit(0.U(32.W))     //a*b(63,48) 16*16位乘法结果
  val temp_sum1   = WireInit(0.U(48.W))    //移位加法中间结果1
  val temp_sum2   = WireInit(0.U(48.W))    //移位加法中间结果2
  val temp_result = WireInit(0.U(80.W))    //16*64位乘法结果
  
  //设置乘法状态机
  val mul_idle :: mul_by_zero :: mul_on :: mul_end :: Nil = Enum(4)
  val mul_state = RegInit(mul_idle) 
  
  //乘法状态机转移逻辑
  switch(mul_state){ 
    //mul_idle状态
     is(mul_idle){
		when(mul_start === 1.U){                            //开始乘法运算
		  when(mul_op1 === 0.U || mul_op2 === 0.U){         //乘数或被乘数为0
		     mul_state := mul_by_zero                             
		  }.otherwise{                                      //乘数或被乘数不为0
		     mul_state := mul_on
			 multemp := 0.U
			 mul_cnt := 0.U
			 //乘数与被乘数是否取补码
			 mul_temp_op1 := Mux(signed_mulop1 === 1.U && mul_op1(63) === 1.U,~mul_op1 + 1.U,mul_op1)
			 mul_temp_op2 := Mux(signed_mulop2 === 1.U && mul_op2(63) === 1.U,~mul_op2 + 1.U,mul_op2)
		  }
		}.otherwise{                                          //不开始除法运算
			mul_done := 0.U
			mulres := 0.U
		}
     }
	 
	//mul_by_zero状态
	 is(mul_by_zero){
		 multemp := 0.U
		 mul_state  := mul_end
     }
	 
	//mul_on状态
	 is(mul_on){    
         when(mul_cnt =/= "b1000".U){                            //乘法未结束 
		 
		 //16*64位乘法器输入（2拍出结果）
		  val a = MuxCase(0.U,Seq( //根据cnt值依次输入temp_op1的16位  
		              (mul_cnt === 0.U || mul_cnt === 1.U) -> mul_temp_op1(15,0),
			          (mul_cnt === 2.U || mul_cnt === 3.U) -> mul_temp_op1(31,16),
			          (mul_cnt === 4.U || mul_cnt === 5.U) -> mul_temp_op1(47,32),
			          (mul_cnt === 6.U || mul_cnt === 7.U) -> mul_temp_op1(63,48)))
		  val b = mul_temp_op2
		   
		  //16*64位乘法器（2拍出结果）
		  mul_temp1 := a*b(15,0)   //并行16*16乘法送入寄存器
          mul_temp2 := a*b(31,16)  //并行16*16乘法送入寄存器
          mul_temp3 := a*b(47,32)  //并行16*16乘法送入寄存器
          mul_temp4 := a*b(63,48)  //并行16*16乘法送入寄存器
          temp_sum1 := Cat(0.U(16.W),mul_temp1) + Cat(mul_temp2,0.U(16.W))   //移位累加
          temp_sum2 := Cat(0.U(16.W),mul_temp3) + Cat(mul_temp4,0.U(16.W))   //移位累加
          temp_result := Cat(0.U(32.W),temp_sum1) + Cat(temp_sum2,0.U(32.W))   //移位累加后得到16*64中间结果
		 
		 //4轮16*64结果移位累加
		  multemp := MuxCase(multemp,Seq(
		             (mul_cnt === 1.U) -> temp_result,
					 (mul_cnt === 3.U) -> (multemp + Cat(temp_result,0.U(16.W))),
					 (mul_cnt === 5.U) -> (multemp + Cat(temp_result,0.U(32.W))),
					 (mul_cnt === 7.U) -> (multemp + Cat(temp_result,0.U(48.W)))))
		  mul_cnt := mul_cnt + 1.U	//计数器自增
	  
		 }.otherwise{                                        //乘法结束		
            when(signed_mulop1 === 0.U && signed_mulop2 === 0.U){                       
			   multemp := multemp
			}.elsewhen(signed_mulop1 === 1.U && signed_mulop2 === 0.U){
			   multemp := Mux(mul_op1(63) === 1.U,~multemp + 1.U,multemp)
			}.otherwise{           
			   multemp := Mux(mul_op1(63)^mul_op2(63) === 1.U,~multemp + 1.U,multemp)
			}
			mul_state := mul_end
			mul_cnt := 0.U
		 }
     }
	 
	//mul_end状态
	 is(mul_end){
		 mulres := multemp
		 mul_done := 1.U
		 when(mul_start === 0.U){
			mul_state := mul_idle
			mul_done := 0.U
			mulres := 0.U
		 }
     }
  }
  
  //乘法指令结果
   val mulAns    = mulres(63,0)
   val mulhAns   = mulres(127,64) 
   val mulhsuAns = mulres(127,64) 
   val mulhuAns  = mulres(127,64) 
   val mulwAns   = unsign_sext(mulres(31,0))
   
 /*----------------------------------------------------------------------------------------*/					
				
 /*除法模块(2位试商法)-------------------------------------------------------*/
  //除法指令译码
  //64位除法指令
  val div_inst_64 = (io.exe_aluop_i === RV64M_DIV) |(io.exe_aluop_i === RV64M_DIVU) |
                    (io.exe_aluop_i === RV64M_REM) |(io.exe_aluop_i === RV64M_REMU)
  //32位除法指令			
  val div_inst_32 = (io.exe_aluop_i === RV64M_DIVW)|(io.exe_aluop_i === RV64M_DIVUW)|
                    (io.exe_aluop_i === RV64M_REMW)|(io.exe_aluop_i === RV64M_REMUW)
  //有符号除法指令
  val signed_div = (io.exe_aluop_i === RV64M_DIV) |(io.exe_aluop_i === RV64M_REM) |
                   (io.exe_aluop_i === RV64M_DIVW)|(io.exe_aluop_i === RV64M_REMW)
  
  val divres = RegInit(0.U(128.W))     //除法结果保存寄存器
  val div_done = RegInit(0.U(1.W))     //除法完成状态寄存器
  io.stallreq_exe := Mux(((div_inst_64 === 1.U || div_inst_32 === 1.U) && div_done === 0.U)||(mul_inst === 1.U && mul_done === 0.U),1.U,0.U) //判断为除法指令且除法未完成则发送流水线暂停信号

  //除法指令组合寄存器 用于记录64/32||有无符号组合 便于后面重复除法优化
  val div_group_reg = RegInit(0.U(3.W))    
      div_group_reg :=  MuxCase(div_group_reg, Seq(
	                   (div_inst_64 === 1.U && signed_div === 1.U) -> "b001".U,  //64位有符号除法组合
					   (div_inst_64 === 1.U && signed_div === 0.U) -> "b010".U,  //64位无符号除法组合
					   (div_inst_32 === 1.U && signed_div === 1.U) -> "b011".U,  //32位有符号除法组合
					   (div_inst_32 === 1.U && signed_div === 0.U) -> "b100".U))   //32位无符号除法组合
	                  
  val div_group =  MuxCase("b111".U, Seq(
	                   (div_inst_64 === 1.U && signed_div === 1.U) -> "b001".U,  //64位有符号除法组合
					   (div_inst_64 === 1.U && signed_div === 0.U) -> "b010".U,  //64位无符号除法组合
					   (div_inst_32 === 1.U && signed_div === 1.U) -> "b011".U,  //32位有符号除法组合
					   (div_inst_32 === 1.U && signed_div === 0.U) -> "b100".U)) //32位无符号除法组合             

  //被除数
  val div_op1 = MuxCase(0.U, Seq(    
                (div_inst_64 === 1.U) -> io.exe_src1_i,
				(div_inst_32 === 1.U) -> Cat(0.U(32.W), io.exe_src1_i(31,0))))
  //除数      
  val div_op2 = MuxCase(0.U, Seq(     
				(div_inst_64 === 1.U) -> io.exe_src2_i,
				(div_inst_32 === 1.U) -> Cat(0.U(32.W), io.exe_src2_i(31,0))))
 
 //除法开始信号
  val div_start = Mux(((div_inst_64 === 1.U || div_inst_32 === 1.U) && div_done === 0.U),1.U,0.U)    
  
  //针对重复除法指令的优化 被除数和除数与上一次相同则直接输出结果
  val div_haddone = MuxCase(0.U, Seq(
                    ((div_group === div_group_reg) && (div_op1 === io.exe_src1_i) && (div_op2 === io.exe_src2_i)) -> 1.U,
					((div_group === div_group_reg) && (div_op1 === io.exe_src1_i) && (div_op2 === io.exe_src2_i)) -> 1.U,
					((div_group === div_group_reg) && (div_op1 === Cat(0.U(32.W), io.exe_src1_i(31,0))) && (div_op2 === Cat(0.U(32.W), io.exe_src2_i(31,0)))) -> 1.U,
					((div_group === div_group_reg) && (div_op1 === Cat(0.U(32.W), io.exe_src1_i(31,0))) && (div_op2 === Cat(0.U(32.W), io.exe_src2_i(31,0)))) -> 1.U))
  
  //试商法相关寄存器
  val cnt      = RegInit(0.U(7.W))      //记录试商法进行的位数,cnt+=2,cnt=64试商法结束
  val dividend = RegInit(0.U(130.W))    //低64位保存被除数及中间结果，高64位为每次迭代的被减数，
  val divisor  = RegInit(0.U(66.W))     //除数寄存器
  val temp_op1 = RegInit(0.U(64.W))     //保存被除数有无符号转换结果
  val temp_op2 = RegInit(0.U(64.W))     //保存除数有无符号转换结果
  val dividend_low = WireInit(0.U)      //保存商有无符号转换结果
  val dividend_high = WireInit(0.U)     //保存余数有无符号转换结果
  
  //除数扩大1,2,3倍
  val divisor_mul1 = temp_op2
  val divisor_mul2 = divisor_mul1 << 1 
  val divisor_mul3 = divisor_mul2 + divisor 
  
  //试商
  val div_temp1 = Mux(div_inst_64 === 1.U ,  //部分余数与除数的 1 倍相减；扩大位数保证不溢出
                      Cat(0.U(3.W),dividend(127,64)) - Cat(0.U(1.W),divisor), 
				      Cat(0.U(3.W),dividend(63,32))  - Cat(0.U(1.W),divisor))
  val div_temp2 = Mux(div_inst_64 === 1.U ,  //部分余数与除数的 2 倍相减；
                      Cat(0.U(3.W),dividend(127,64)) - Cat(0.U(1.W),divisor_mul2), 
                      Cat(0.U(3.W),dividend(63,32))  - Cat(0.U(1.W),divisor_mul2))						  
  val div_temp3 = Mux(div_inst_64 === 1.U ,  //部分余数与除数的 3 倍相减；
                      Cat(0.U(3.W),dividend(127,64)) - Cat(0.U(1.W),divisor_mul3), 
					  Cat(0.U(3.W),dividend(63,32))  - Cat(0.U(1.W),divisor_mul3))
  
  val div_temp  = MuxCase(div_temp1,Seq(                                      //减法结果
                   (div_inst_64 === 1.U && div_temp3(66) === 0.U) -> div_temp3,
				   (div_inst_64 === 1.U && div_temp2(66) === 0.U) -> div_temp2,
				   (div_inst_32 === 1.U && div_temp3(34) === 0.U) -> div_temp3,
				   (div_inst_32 === 1.U && div_temp2(34) === 0.U) -> div_temp2))
				  
  val div_cnt = MuxCase("b01".U,Seq(                                          //商
                   (div_inst_64 === 1.U && div_temp3(66) === 0.U) -> "b11".U,
				   (div_inst_64 === 1.U && div_temp2(66) === 0.U) -> "b10".U,
				   (div_inst_32 === 1.U && div_temp3(34) === 0.U) -> "b11".U,
				   (div_inst_32 === 1.U && div_temp2(34) === 0.U) -> "b10".U))
				  
  //设置除法状态机
  val div_idle :: div_by_zero :: div_on :: div_end :: Nil = Enum(4)
  val state = RegInit(div_idle) 
  
  //除法状态机转移逻辑
  switch(state){ 
    //div_idle状态
     is(div_idle){
		when(div_start === 1.U){                              //开始除法运算
		  when(div_haddone === 1.U){
		     state := div_end
		  }.elsewhen(div_op2 === 0.U){                              //除数为0
		     state := div_by_zero                             
		  }.elsewhen(div_inst_64 === 1.U){                    //除数不为0 且为64位除法
		     state := div_on
			 cnt := 0.U
			 when(signed_div === 1.U && div_op1(63) === 1.U){  //有符号运算被除数求补码 
			   temp_op1 := ~div_op1 + 1.U
			   dividend := Cat(0.U(66.W),~div_op1 + 1.U)
		 	 }.otherwise{
			   temp_op1 := div_op1
			   dividend := Cat(0.U(66.W),div_op1)
			 }
			 when(signed_div === 1.U && div_op2(63) === 1.U){  //有符号运算除数求补码
			   temp_op2 := ~div_op2 + 1.U
			   divisor  := ~div_op2 + 1.U
		 	 }.otherwise{
			   temp_op2 := div_op2
		 	   divisor  := div_op2
			 }
		 }.otherwise{                                        //除数不为0 且为32位除法
		     state := div_on
			 cnt := 0.U
			 when(signed_div === 1.U && div_op1(31) === 1.U){  //有符号运算被除数求补码 
			   temp_op1 := Cat(0.U(32.W),~div_op1(31,0) + 1.U)
			   dividend := Cat(0.U(34.W),~div_op1(31,0) + 1.U)
		 	 }.otherwise{
			   temp_op1 := Cat(0.U(32.W),div_op1(31,0))
			   dividend := Cat(0.U(34.W),div_op1)
			 }
			 when(signed_div === 1.U && div_op2(31) === 1.U){  //有符号运算除数求补码
			   temp_op2 := Cat(0.U(32.W), ~div_op2(31,0) + 1.U)
			   divisor  := Cat(0.U(32.W), ~div_op2(31,0) + 1.U)
		 	 }.otherwise{
			   temp_op2 := Cat(0.U(32.W), div_op2(31,0))
		 	   divisor  := Cat(0.U(32.W), div_op2(31,0))
			 }
		 }
		}.otherwise{                                          //不开始除法运算
			div_done := 0.U
			divres := Cat(ZERO_WORD, ZERO_WORD)
		}
     }
	 
	//div_by_zero状态
	 is(div_by_zero){
		//除0输出特殊数值
         dividend := Mux(signed_div === 1.U, 
						 Cat(div_op1, 0.U(2.W), "hffffffffffffffff".U), 
						 Cat(div_op1, 0.U(2.W), "hffffffffffffffff".U))
		 state := div_end
     }
	 
	//div_on状态
	 is(div_on){
	    when(div_inst_64 === 1.U){                            //64位除法
          when(cnt =/= "b1000010".U){                         //试商法未结束 
		    when(div_temp(66) === 1.U){                       //(minuend-n)<0 被减数借位，将00写入商
			    dividend := Cat(dividend(127,0), 0.U(2.W))
			}.otherwise{                                      //(minuend-n)>0 更新被减数与除数，将div_cnt写入商
				dividend := Cat(div_temp(63,0), dividend(63,0), div_cnt)  
			}  
			cnt := cnt +2.U
		  }.otherwise{                                         //试商法结束			
			when(signed_div === 0.U){                       
			    dividend := dividend
			}.otherwise{           
			    when(div_op1(63) ^ div_op2(63) === 1.U){      //有符号除法div_op异号对商求补码
					dividend_low := ~dividend(63,0) + 1.U
				}.otherwise{
					dividend_low := dividend(63,0)
				}
				when(div_op1(63) ^ dividend(129) === 1.U){     //有符号除法对余数求补码(余数与被除数应同号)
					dividend_high := ~dividend(129,66) + 1.U
				}.otherwise{
					dividend_high := dividend(129,66)
				}
				dividend := Cat(dividend_high, 0.U(2.W), dividend_low)
			}
			state := div_end
			cnt := 0.U
		  }
	    }.elsewhen(div_inst_32 === 1.U){                      //32位除法
		  when(cnt =/= "b100010".U){                          //试商法未结束 
		    when(div_temp(34) === 1.U){                       //(minuend-n)<0 被减数借位，将00写入商
			    dividend := Cat(dividend(127,0), 0.U(2.W))
			}.otherwise{                                      //(minuend-n)>0 更新被减数与除数，将div_cnt写入商
				dividend := Cat(0.U(64.W), div_temp(31,0), dividend(31,0), div_cnt)  
			}  
			cnt := cnt +2.U
		  }.otherwise{                                         //试商法结束			
			when(signed_div === 0.U){                       
			    dividend := Cat(0.U(32.W),dividend(65,34),0.U(2.W),0.U(32.W),dividend(31,0))
			}.otherwise{           
			    when(div_op1(31) ^ div_op2(31) === 1.U){      //有符号除法div_op异号对商求补码
					dividend_low := Cat(0.U(32.W), ~dividend(31,0) + 1.U)
				}.otherwise{
					dividend_low := Cat(0.U(32.W), dividend(31,0))
				}
				when(div_op1(31) ^ dividend(65) === 1.U){     //有符号除法对余数求补码(余数与被除数应同号)
					dividend_high := Cat(0.U(32.W), ~dividend(65,34) + 1.U)
				}.otherwise{
					dividend_high := Cat(0.U(32.W), dividend(65,34))
				}
				dividend := Cat(dividend_high, 0.U(2.W), dividend_low)
			}
			state := div_end
			cnt := 0.U
		  }
		}	
     }
	 
	//div_end状态
	 is(div_end){
		 divres := Cat(dividend(129,66), dividend(63,0))
		 div_done := 1.U
		 when(div_start === 0.U){
			state := div_idle
			div_done := 0.U
			divres := Cat(ZERO_WORD, ZERO_WORD)
		 }
     }
  }
  //除法指令结果
   val divAns   = divres(63,0)    //div 
   val divuAns  = divres(63,0)    //divu
   val remAns   = divres(127,64)  //rem 
   val remuAns  = divres(127,64)  //remu
   
   val divwAns   = {val sign64 = WireInit(0.S(64.W))    //divw 
                    sign64 := divres(31,0).asSInt
				    sign64.asUInt()}    
   val divuwAns  = {val sign64 = WireInit(0.S(64.W))    //divuw 
                    sign64 := divres(31,0).asSInt
				    sign64.asUInt()}   
   val remwAns   = {val sign64 = WireInit(0.S(64.W))    //remw
                    sign64 := divres(95,64).asSInt
				    sign64.asUInt()}   
   val remuwAns  = {val sign64 = WireInit(0.S(64.W))    //remuw
                    sign64 := divres(95,64).asSInt
				    sign64.asUInt()}

  /*----------------------------------------------------------------------------------------*/
  //CSR寄存器定向前推
  val csr_data = MuxCase(io.csr_rd_i, Seq(
					(io.mem2exe_csr_we === 1.U && io.mem2exe_csr_wa === io.csr_ra_o && io.csr_re_o === 1.U) -> io.mem2exe_csr_wd,
					(io.wb2exe_csr_we === 1.U  && io.wb2exe_csr_wa === io.csr_ra_o  && io.csr_re_o === 1.U) -> io.wb2exe_csr_wd
				  ))
  
  /*----------------------------------------------------------------------------------------*/
  // 根据内部操作码aluop进行逻辑运算
  val logicres = MuxCase(0.U,Seq(
       (io.exe_aluop_i === RV64I_AND ) -> andAns ,  //and
	   (io.exe_aluop_i === RV64I_OR  ) -> orAns  ,  //or
	   (io.exe_aluop_i === RV64I_XOR ) -> xorAns ,  //xor
	   (io.exe_aluop_i === RV64I_ANDI) -> andiAns,  //andi
	   (io.exe_aluop_i === RV64I_ORI ) -> oriAns ,  //ori
	   (io.exe_aluop_i === RV64I_XORI) -> xoriAns)) //xori
  
  // 根据内部操作码aluop进行移位运算
  val shiftres = MuxCase(0.U,Seq(
       (io.exe_aluop_i === RV64I_SLL  ) -> sllAns  , //sll
	   (io.exe_aluop_i === RV64I_SRL  ) -> srlAns  , //srl
	   (io.exe_aluop_i === RV64I_SRA  ) -> sraAns  , //sra     
	   (io.exe_aluop_i === RV64I_SLLI ) -> slliAns , //slli
	   (io.exe_aluop_i === RV64I_SRLI ) -> srliAns , //srli
	   (io.exe_aluop_i === RV64I_SRAI ) -> sraiAns , //srai  
 	   (io.exe_aluop_i === RV64I_SLLW ) -> sllwAns , //sllw
	   (io.exe_aluop_i === RV64I_SRLW ) -> srlwAns , //srlw
	   (io.exe_aluop_i === RV64I_SRAW ) -> srawAns , //sraw
	   (io.exe_aluop_i === RV64I_SLLIW) -> slliwAns, //slliw
	   (io.exe_aluop_i === RV64I_SRLIW) -> srliwAns, //srliw
	   (io.exe_aluop_i === RV64I_SRAIW) -> sraiwAns)) //sraiw

  // 根据内部操作码aluop进行算术运算
  val arithres = MuxCase(0.U,Seq(
       (io.exe_aluop_i === RV64I_ADD   ) -> addAns   , //add
	   (io.exe_aluop_i === RV64I_SUB   ) -> subAns   , //sub
	   (io.exe_aluop_i === RV64I_SLT   ) -> sltAns   , //slt
	   (io.exe_aluop_i === RV64I_SLTU  ) -> sltuAns  , //sltu
	   (io.exe_aluop_i === RV64I_ADDI  ) -> addiAns  , //addi
	   (io.exe_aluop_i === RV64I_SLTI  ) -> sltiAns  , //slt
	   (io.exe_aluop_i === RV64I_SLTIU ) -> sltiuAns , //sltu	   
	   (io.exe_aluop_i === RV64I_LB    ) -> lbAns    , //lb 
	   (io.exe_aluop_i === RV64I_LH    ) -> lhAns    , //lh 
	   (io.exe_aluop_i === RV64I_LW    ) -> lwAns    , //lw 
	   (io.exe_aluop_i === RV64I_LBU   ) -> lbuAns   , //lbu
	   (io.exe_aluop_i === RV64I_LHU   ) -> lhuAns   , //lhu
	   (io.exe_aluop_i === RV64I_SB    ) -> sbAns    , //sb		
	   (io.exe_aluop_i === RV64I_SH    ) -> shAns    , //sh     
	   (io.exe_aluop_i === RV64I_SW    ) -> swAns    , //sw
       (io.exe_aluop_i === RV64I_LUI   ) -> luiAns   , //lui 
       (io.exe_aluop_i === RV64I_AUIPC ) -> auipcAns , //auipc
	   (io.exe_aluop_i === RV64M_MUL   ) -> mulAns   , //mul 
	   (io.exe_aluop_i === RV64M_MULH  ) -> mulhAns  , //mulh
	   (io.exe_aluop_i === RV64M_MULHSU) -> mulhsuAns, //mulhsu
	   (io.exe_aluop_i === RV64M_MULHU ) -> mulhuAns , //mulhu
	   (io.exe_aluop_i === RV64M_DIV   ) -> divAns   , //div 
	   (io.exe_aluop_i === RV64M_DIVU  ) -> divuAns  , //divu
	   (io.exe_aluop_i === RV64M_REM   ) -> remAns   , //rem 
	   (io.exe_aluop_i === RV64M_REMU  ) -> remuAns  , //remu
	   (io.exe_aluop_i === RV64I_LWU   ) -> lwuAns   , //lwu
	   (io.exe_aluop_i === RV64I_LD    ) -> ldAns    , //ld
	   (io.exe_aluop_i === RV64I_SD    ) -> sdAns    , //sd
	   (io.exe_aluop_i === RV64I_ADDIW ) -> addiwAns , //addi
	   (io.exe_aluop_i === RV64I_ADDW  ) -> addwAns  , //addw
	   (io.exe_aluop_i === RV64I_SUBW  ) -> subwAns  , //subw
	   (io.exe_aluop_i === RV64M_MULW  ) -> mulwAns  , //mulw
	   (io.exe_aluop_i === RV64M_DIVW  ) -> divwAns  , //divw 
	   (io.exe_aluop_i === RV64M_DIVUW ) -> divuwAns , //divuw
	   (io.exe_aluop_i === RV64M_REMW  ) -> remwAns  , //remw 
	   (io.exe_aluop_i === RV64M_REMUW ) -> remuwAns)) //remuw	   
  
  // csr指令写通用寄存器，内容为csr寄存器值
  val csrres = MuxCase(0.U, Seq(     
  	   (io.exe_aluop_i === RV64I_CSRRW ) -> csr_data, //csrrw 
	   (io.exe_aluop_i === RV64I_CSRRS ) -> csr_data, //csrrs 
	   (io.exe_aluop_i === RV64I_CSRRC ) -> csr_data, //csrrc 
	   (io.exe_aluop_i === RV64I_CSRRWI) -> csr_data, //csrrwi
	   (io.exe_aluop_i === RV64I_CSRRSI) -> csr_data, //csrrsi
	   (io.exe_aluop_i === RV64I_CSRRCI) -> csr_data))//csrrci

  // 根据内部操作码aluop进行返回地址运算
  val ret_addr = MuxCase(0.U,Seq( 
	   (io.exe_aluop_i === RV64I_JAL  ) -> jalAns ,  //jal
	   (io.exe_aluop_i === RV64I_JALR ) -> jalrAns)) //jalr
  
  /*----------------------------------------------------------------------------------------*/
  // 根据操作类型alutype确定执行阶段最终的运算结果
  io.exe_wd_o := MuxCase(0.U,Seq(
     (io.exe_alutype_i === NOP   ) -> 0.U,       //NOP
	 (io.exe_alutype_i === ARITH ) -> arithres,  //ARITH
	 (io.exe_alutype_i === LOGIC ) -> logicres,  //LOGIC
     (io.exe_alutype_i === SHIFT ) -> shiftres,  //SHIFT 
	 (io.exe_alutype_i === JUMP  ) -> ret_addr,  //JUMP
	 (io.exe_alutype_i === CSR   ) -> csrres))   //CSR
  
  /*----------------------------------------------------------------------------------------*/
  //CSR相关指令读csr寄存器并写rd
  when(io.exe_alutype_i === CSR ){
	io.csr_ra_o := io.csr_addr_i    
	io.csr_re_o := 1.U
	io.csr_we_o := 1.U
	io.csr_wa_o := io.csr_addr_i 
	io.csr_wd_o := MuxCase(0.U, Seq(
		(io.exe_aluop_i === RV64I_CSRRW ) -> io.exe_src1_i                ,
	    (io.exe_aluop_i === RV64I_CSRRS ) -> (csr_data | io.exe_src1_i)   , 
	    (io.exe_aluop_i === RV64I_CSRRC ) -> (csr_data & (~io.exe_src1_i)), 
	    (io.exe_aluop_i === RV64I_CSRRWI) -> io.exe_src1_i                ,
	    (io.exe_aluop_i === RV64I_CSRRSI) -> (csr_data | io.exe_src1_i)   ,  
	    (io.exe_aluop_i === RV64I_CSRRCI) -> (csr_data & (~io.exe_src1_i))))
  }.otherwise{
    io.csr_ra_o := 0.U   
	io.csr_re_o := 0.U
	io.csr_we_o := 0.U
	io.csr_wa_o := 0.U  
	io.csr_wd_o := 0.U
  }
}

