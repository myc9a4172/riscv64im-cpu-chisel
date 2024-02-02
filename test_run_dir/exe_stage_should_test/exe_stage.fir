;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit exe_stage : 
  module exe_stage : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip exe_alutype_i : UInt<3>, flip exe_aluop_i : UInt<8>, flip exe_src1_i : UInt<32>, flip exe_src2_i : UInt<32>, flip exe_wa_i : UInt<5>, flip exe_wreg_i : UInt<1>, exe_aluop_o : UInt<8>, exe_wa_o : UInt<5>, exe_wreg_o : UInt<1>, exe_wd_o : UInt<32>}
    
    io.exe_aluop_o <= io.exe_aluop_i @[exe_stage.scala 41:18]
    io.exe_wa_o <= io.exe_wa_i @[exe_stage.scala 46:17]
    io.exe_wreg_o <= io.exe_wreg_i @[exe_stage.scala 47:17]
    node _T = eq(io.exe_aluop_i, UInt<4>("h0a")) @[exe_stage.scala 51:24]
    node _T_1 = and(io.exe_src1_i, io.exe_src2_i) @[exe_stage.scala 51:61]
    node _T_2 = eq(io.exe_aluop_i, UInt<4>("h09")) @[exe_stage.scala 52:28]
    node _T_3 = or(io.exe_src1_i, io.exe_src2_i) @[exe_stage.scala 52:65]
    node _T_4 = mux(_T_2, _T_3, UInt<1>("h00")) @[Mux.scala 98:16]
    node logicres = mux(_T, _T_1, _T_4) @[Mux.scala 98:16]
    node _T_5 = eq(io.exe_aluop_i, UInt<1>("h01")) @[exe_stage.scala 63:24]
    node _T_6 = add(io.exe_src1_i, io.exe_src2_i) @[exe_stage.scala 63:61]
    node _T_7 = tail(_T_6, 1) @[exe_stage.scala 63:61]
    node _T_8 = eq(io.exe_aluop_i, UInt<2>("h02")) @[exe_stage.scala 64:28]
    node _T_9 = sub(io.exe_src1_i, io.exe_src2_i) @[exe_stage.scala 64:65]
    node _T_10 = tail(_T_9, 1) @[exe_stage.scala 64:65]
    node _T_11 = mux(_T_8, _T_10, UInt<1>("h00")) @[Mux.scala 98:16]
    node arithres = mux(_T_5, _T_7, _T_11) @[Mux.scala 98:16]
    node _T_12 = eq(io.exe_alutype_i, UInt<1>("h01")) @[exe_stage.scala 69:28]
    node _T_13 = eq(io.exe_alutype_i, UInt<2>("h02")) @[exe_stage.scala 70:28]
    node _T_14 = mux(_T_13, logicres, UInt<1>("h00")) @[Mux.scala 98:16]
    node _T_15 = mux(_T_12, arithres, _T_14) @[Mux.scala 98:16]
    io.exe_wd_o <= _T_15 @[exe_stage.scala 68:15]
    
