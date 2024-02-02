;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit idexe_reg : 
  module idexe_reg : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip id_alutype : UInt<3>, flip id_aluop : UInt<8>, flip id_src1 : UInt<32>, flip id_src2 : UInt<32>, flip id_wa : UInt<5>, flip id_wreg : UInt<1>, exe_alutype : UInt<3>, exe_aluop : UInt<8>, exe_src1 : UInt<32>, exe_src2 : UInt<32>, exe_wa : UInt<5>, exe_wreg : UInt<1>}
    
    reg alutype_reg : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[idexe_reg.scala 36:30]
    alutype_reg <= io.id_alutype @[idexe_reg.scala 37:21]
    io.exe_alutype <= alutype_reg @[idexe_reg.scala 38:21]
    reg aluop_reg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[idexe_reg.scala 40:32]
    aluop_reg <= io.id_aluop @[idexe_reg.scala 41:19]
    io.exe_aluop <= aluop_reg @[idexe_reg.scala 42:19]
    reg src1_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[idexe_reg.scala 44:31]
    src1_reg <= io.id_src1 @[idexe_reg.scala 45:18]
    io.exe_src1 <= src1_reg @[idexe_reg.scala 46:18]
    reg src2_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[idexe_reg.scala 48:31]
    src2_reg <= io.id_src2 @[idexe_reg.scala 49:18]
    io.exe_src2 <= src2_reg @[idexe_reg.scala 50:18]
    reg wa_reg : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[idexe_reg.scala 52:29]
    wa_reg <= io.id_wa @[idexe_reg.scala 53:16]
    io.exe_wa <= wa_reg @[idexe_reg.scala 54:16]
    reg wreg_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[idexe_reg.scala 56:31]
    wreg_reg <= io.id_wreg @[idexe_reg.scala 57:18]
    io.exe_wreg <= wreg_reg @[idexe_reg.scala 58:18]
    
