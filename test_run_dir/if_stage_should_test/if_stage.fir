;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit if_stage : 
  module if_stage : 
    input clock : Clock
    input reset : UInt<1>
    output io : {ice : UInt<1>, pc : UInt<32>, iaddr : UInt<32>}
    
    reg ice_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[if_stage.scala 16:24]
    io.ice <= ice_reg @[if_stage.scala 17:10]
    reg pc_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[if_stage.scala 19:23]
    io.pc <= pc_reg @[if_stage.scala 20:9]
    node _T = eq(io.ice, UInt<1>("h00")) @[if_stage.scala 22:14]
    when _T : @[if_stage.scala 22:21]
      pc_reg <= UInt<1>("h00") @[if_stage.scala 23:13]
      skip @[if_stage.scala 22:21]
    else : @[if_stage.scala 24:14]
      node _T_1 = add(pc_reg, UInt<3>("h04")) @[if_stage.scala 25:23]
      node _T_2 = tail(_T_1, 1) @[if_stage.scala 25:23]
      pc_reg <= _T_2 @[if_stage.scala 25:13]
      skip @[if_stage.scala 24:14]
    node _T_3 = eq(io.ice, UInt<1>("h00")) @[if_stage.scala 28:26]
    node _T_4 = mux(_T_3, UInt<1>("h00"), pc_reg) @[if_stage.scala 28:18]
    io.iaddr <= _T_4 @[if_stage.scala 28:12]
    
