circuit exemem_reg :
  module exemem_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_exe_aluop : UInt<8>
    input io_exe_wa : UInt<5>
    input io_exe_wreg : UInt<1>
    input io_exe_wd : UInt<32>
    output io_mem_aluop : UInt<8>
    output io_mem_wa : UInt<5>
    output io_mem_wreg : UInt<1>
    output io_mem_wd : UInt<32>
  
    reg aluop_reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), aluop_reg) @[exemem_reg.scala 36:29]
    reg wa_reg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), wa_reg) @[exemem_reg.scala 40:30]
    reg wreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wreg_reg) @[exemem_reg.scala 44:32]
    reg wd_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), wd_reg) @[exemem_reg.scala 48:30]
    io_mem_aluop <= aluop_reg @[exemem_reg.scala 38:19]
    io_mem_wa <= wa_reg @[exemem_reg.scala 42:16]
    io_mem_wreg <= wreg_reg @[exemem_reg.scala 46:18]
    io_mem_wd <= wd_reg @[exemem_reg.scala 50:16]
    aluop_reg <= mux(reset, UInt<8>("h0"), io_exe_aluop) @[exemem_reg.scala 37:19]
    wa_reg <= mux(reset, UInt<5>("h0"), io_exe_wa) @[exemem_reg.scala 41:16]
    wreg_reg <= mux(reset, UInt<1>("h0"), io_exe_wreg) @[exemem_reg.scala 45:18]
    wd_reg <= mux(reset, UInt<32>("h0"), io_exe_wd) @[exemem_reg.scala 49:16]
