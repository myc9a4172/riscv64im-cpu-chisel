;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit wb_stage : 
  module wb_stage : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip wb_wa_i : UInt<5>, flip wb_wreg_i : UInt<1>, flip wb_dreg_i : UInt<32>, flip dm : UInt<32>, wb_wa_o : UInt<5>, wb_wreg_o : UInt<1>, wb_wd_o : UInt<32>}
    
    io.wb_wa_o <= io.wb_wa_i @[wb_stage.scala 36:23]
    io.wb_wreg_o <= io.wb_wreg_i @[wb_stage.scala 37:23]
    io.wb_wd_o <= io.wb_dreg_i @[wb_stage.scala 44:20]
    
