circuit mem_stage :
  module mem_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_aluop_i : UInt<8>
    input io_mem_wa_i : UInt<5>
    input io_mem_wreg_i : UInt<1>
    input io_mem_wd_i : UInt<32>
    output io_mem_wa_o : UInt<5>
    output io_mem_wreg_o : UInt<1>
    output io_mem_dreg_o : UInt<32>
  
    io_mem_wa_o <= io_mem_wa_i @[mem_stage.scala 40:20]
    io_mem_wreg_o <= io_mem_wreg_i @[mem_stage.scala 41:24]
    io_mem_dreg_o <= io_mem_wd_i @[mem_stage.scala 42:24]
