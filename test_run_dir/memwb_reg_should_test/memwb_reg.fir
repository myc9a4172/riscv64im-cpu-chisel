;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit memwb_reg : 
  module memwb_reg : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mem_wa : UInt<5>, flip mem_wreg : UInt<1>, flip mem_dreg : UInt<32>, wb_wa : UInt<5>, wb_wreg : UInt<1>, wb_dreg : UInt<32>}
    
    reg wa_reg : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[memwb_reg.scala 25:30]
    wa_reg <= io.mem_wa @[memwb_reg.scala 26:16]
    io.wb_wa <= wa_reg @[memwb_reg.scala 27:16]
    reg wreg_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[memwb_reg.scala 29:32]
    wreg_reg <= io.mem_wreg @[memwb_reg.scala 30:17]
    io.wb_wreg <= wreg_reg @[memwb_reg.scala 31:17]
    reg dreg_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[memwb_reg.scala 33:32]
    dreg_reg <= io.mem_dreg @[memwb_reg.scala 34:18]
    io.wb_dreg <= dreg_reg @[memwb_reg.scala 35:18]
    
