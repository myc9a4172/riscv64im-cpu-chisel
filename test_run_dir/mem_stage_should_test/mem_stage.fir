;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit mem_stage : 
  module mem_stage : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mem_aluop_i : UInt<8>, flip mem_wa_i : UInt<5>, flip mem_wreg_i : UInt<1>, flip mem_wd_i : UInt<32>, mem_wa_o : UInt<5>, mem_wreg_o : UInt<1>, mem_dreg_o : UInt<32>}
    
    io.mem_wa_o <= io.mem_wa_i @[mem_stage.scala 40:20]
    io.mem_wreg_o <= io.mem_wreg_i @[mem_stage.scala 41:24]
    io.mem_dreg_o <= io.mem_wd_i @[mem_stage.scala 42:24]
    
