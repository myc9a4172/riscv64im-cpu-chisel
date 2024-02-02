circuit if_stage :
  module if_stage :
    input clock : Clock
    input reset : UInt<1>
    output io_ice : UInt<1>
    output io_pc : UInt<32>
    output io_iaddr : UInt<32>
  
    reg ice_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ice_reg) @[if_stage.scala 16:24]
    reg pc_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_reg) @[if_stage.scala 19:23]
    node _T = eq(io_ice, UInt<1>("h0")) @[if_stage.scala 22:14]
    node _T_1 = add(pc_reg, UInt<3>("h4")) @[if_stage.scala 25:23]
    node _T_2 = tail(_T_1, 1) @[if_stage.scala 25:23]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _T_2) @[if_stage.scala 22:21]
    node _T_3 = eq(io_ice, UInt<1>("h0")) @[if_stage.scala 28:26]
    node _T_4 = mux(_T_3, UInt<1>("h0"), pc_reg) @[if_stage.scala 28:18]
    io_ice <= ice_reg @[if_stage.scala 17:10]
    io_pc <= pc_reg @[if_stage.scala 20:9]
    io_iaddr <= _T_4 @[if_stage.scala 28:12]
    ice_reg <= mux(reset, UInt<1>("h1"), ice_reg)
    pc_reg <= mux(reset, UInt<32>("h0"), _GEN_0) @[if_stage.scala 23:13 if_stage.scala 25:13]
