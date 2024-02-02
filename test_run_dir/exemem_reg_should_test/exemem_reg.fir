;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit exemem_reg : 
  module exemem_reg : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip exe_aluop : UInt<8>, flip exe_wa : UInt<5>, flip exe_wreg : UInt<1>, flip exe_wd : UInt<32>, mem_aluop : UInt<8>, mem_wa : UInt<5>, mem_wreg : UInt<1>, mem_wd : UInt<32>}
    
    reg aluop_reg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[exemem_reg.scala 36:29]
    aluop_reg <= io.exe_aluop @[exemem_reg.scala 37:19]
    io.mem_aluop <= aluop_reg @[exemem_reg.scala 38:19]
    reg wa_reg : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[exemem_reg.scala 40:30]
    wa_reg <= io.exe_wa @[exemem_reg.scala 41:16]
    io.mem_wa <= wa_reg @[exemem_reg.scala 42:16]
    reg wreg_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[exemem_reg.scala 44:32]
    wreg_reg <= io.exe_wreg @[exemem_reg.scala 45:18]
    io.mem_wreg <= wreg_reg @[exemem_reg.scala 46:18]
    reg wd_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[exemem_reg.scala 48:30]
    wd_reg <= io.exe_wd @[exemem_reg.scala 49:16]
    io.mem_wd <= wd_reg @[exemem_reg.scala 50:16]
    
