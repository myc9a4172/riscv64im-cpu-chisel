circuit wb_stage :
  module wb_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_wb_wa_i : UInt<5>
    input io_wb_wreg_i : UInt<1>
    input io_wb_dreg_i : UInt<32>
    input io_dm : UInt<32>
    output io_wb_wa_o : UInt<5>
    output io_wb_wreg_o : UInt<1>
    output io_wb_wd_o : UInt<32>
  
    io_wb_wa_o <= io_wb_wa_i @[wb_stage.scala 36:23]
    io_wb_wreg_o <= io_wb_wreg_i @[wb_stage.scala 37:23]
    io_wb_wd_o <= io_wb_dreg_i @[wb_stage.scala 44:20]
