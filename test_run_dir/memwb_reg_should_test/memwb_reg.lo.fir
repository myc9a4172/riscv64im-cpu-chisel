circuit memwb_reg :
  module memwb_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_wa : UInt<5>
    input io_mem_wreg : UInt<1>
    input io_mem_dreg : UInt<32>
    output io_wb_wa : UInt<5>
    output io_wb_wreg : UInt<1>
    output io_wb_dreg : UInt<32>
  
    reg wa_reg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), wa_reg) @[memwb_reg.scala 25:30]
    reg wreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wreg_reg) @[memwb_reg.scala 29:32]
    reg dreg_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), dreg_reg) @[memwb_reg.scala 33:32]
    io_wb_wa <= wa_reg @[memwb_reg.scala 27:16]
    io_wb_wreg <= wreg_reg @[memwb_reg.scala 31:17]
    io_wb_dreg <= dreg_reg @[memwb_reg.scala 35:18]
    wa_reg <= mux(reset, UInt<5>("h0"), io_mem_wa) @[memwb_reg.scala 26:16]
    wreg_reg <= mux(reset, UInt<1>("h0"), io_mem_wreg) @[memwb_reg.scala 30:17]
    dreg_reg <= mux(reset, UInt<32>("h0"), io_mem_dreg) @[memwb_reg.scala 34:18]
