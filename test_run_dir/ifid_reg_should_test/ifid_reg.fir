;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit ifid_reg : 
  module ifid_reg : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip if_pc : UInt<32>, id_pc : UInt<32>}
    
    reg pc_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ifid_reg.scala 15:23]
    pc_reg <= io.if_pc @[ifid_reg.scala 16:10]
    io.id_pc <= pc_reg @[ifid_reg.scala 18:12]
    
