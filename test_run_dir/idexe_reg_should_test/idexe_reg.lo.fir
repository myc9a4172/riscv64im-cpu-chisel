circuit idexe_reg :
  module idexe_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_id_alutype : UInt<3>
    input io_id_aluop : UInt<8>
    input io_id_src1 : UInt<32>
    input io_id_src2 : UInt<32>
    input io_id_wa : UInt<5>
    input io_id_wreg : UInt<1>
    output io_exe_alutype : UInt<3>
    output io_exe_aluop : UInt<8>
    output io_exe_src1 : UInt<32>
    output io_exe_src2 : UInt<32>
    output io_exe_wa : UInt<5>
    output io_exe_wreg : UInt<1>
  
    reg alutype_reg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), alutype_reg) @[idexe_reg.scala 36:30]
    reg aluop_reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), aluop_reg) @[idexe_reg.scala 40:32]
    reg src1_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), src1_reg) @[idexe_reg.scala 44:31]
    reg src2_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), src2_reg) @[idexe_reg.scala 48:31]
    reg wa_reg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), wa_reg) @[idexe_reg.scala 52:29]
    reg wreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wreg_reg) @[idexe_reg.scala 56:31]
    io_exe_alutype <= alutype_reg @[idexe_reg.scala 38:21]
    io_exe_aluop <= aluop_reg @[idexe_reg.scala 42:19]
    io_exe_src1 <= src1_reg @[idexe_reg.scala 46:18]
    io_exe_src2 <= src2_reg @[idexe_reg.scala 50:18]
    io_exe_wa <= wa_reg @[idexe_reg.scala 54:16]
    io_exe_wreg <= wreg_reg @[idexe_reg.scala 58:18]
    alutype_reg <= mux(reset, UInt<3>("h0"), io_id_alutype) @[idexe_reg.scala 37:21]
    aluop_reg <= mux(reset, UInt<8>("h0"), io_id_aluop) @[idexe_reg.scala 41:19]
    src1_reg <= mux(reset, UInt<32>("h0"), io_id_src1) @[idexe_reg.scala 45:18]
    src2_reg <= mux(reset, UInt<32>("h0"), io_id_src2) @[idexe_reg.scala 49:18]
    wa_reg <= mux(reset, UInt<5>("h0"), io_id_wa) @[idexe_reg.scala 53:16]
    wreg_reg <= mux(reset, UInt<1>("h0"), io_id_wreg) @[idexe_reg.scala 57:18]
