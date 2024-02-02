circuit regfile :
  module regfile :
    input clock : Clock
    input reset : UInt<1>
    input io_wa : UInt<5>
    input io_wd : UInt<32>
    input io_we : UInt<1>
    input io_ra1 : UInt<5>
    input io_ra2 : UInt<5>
    input io_re1 : UInt<1>
    input io_re2 : UInt<1>
    output io_rd1 : UInt<32>
    output io_rd2 : UInt<32>
  
    mem regs : @[regfile.scala 25:17]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => _T_7
      reader => _T_16
      writer => _T_21
      read-under-write => undefined
    node _T = eq(io_ra1, UInt<1>("h0")) @[regfile.scala 28:15]
    node _T_1 = eq(io_re1, UInt<1>("h1")) @[regfile.scala 30:22]
    node _T_2 = eq(io_ra1, io_wa) @[regfile.scala 30:42]
    node _T_3 = and(_T_1, _T_2) @[regfile.scala 30:31]
    node _T_4 = eq(io_we, UInt<1>("h1")) @[regfile.scala 30:63]
    node _T_5 = and(_T_3, _T_4) @[regfile.scala 30:53]
    node _T_6 = eq(io_re1, UInt<1>("h1")) @[regfile.scala 33:27]
    node _T_8 = mux(_T_6, regs._T_7.data, UInt<1>("h0")) @[regfile.scala 33:18]
    node _GEN_0 = mux(_T_5, io_wd, _T_8) @[regfile.scala 30:72]
    node _GEN_1 = validif(eq(_T_5, UInt<1>("h0")), io_ra1) @[regfile.scala 30:72]
    node _GEN_2 = validif(eq(_T_5, UInt<1>("h0")), clock) @[regfile.scala 30:72]
    node _GEN_3 = mux(_T_5, UInt<1>("h0"), UInt<1>("h1")) @[regfile.scala 30:72]
    node _GEN_4 = mux(_T, UInt<1>("h0"), _GEN_0) @[regfile.scala 28:29]
    node _GEN_5 = validif(eq(_T, UInt<1>("h0")), _GEN_1) @[regfile.scala 28:29]
    node _GEN_6 = validif(eq(_T, UInt<1>("h0")), _GEN_2) @[regfile.scala 28:29]
    node _GEN_7 = mux(_T, UInt<1>("h0"), _GEN_3) @[regfile.scala 28:29]
    node _T_9 = eq(io_ra2, UInt<1>("h0")) @[regfile.scala 37:15]
    node _T_10 = eq(io_re2, UInt<1>("h1")) @[regfile.scala 39:22]
    node _T_11 = eq(io_ra2, io_wa) @[regfile.scala 39:42]
    node _T_12 = and(_T_10, _T_11) @[regfile.scala 39:31]
    node _T_13 = eq(io_we, UInt<1>("h1")) @[regfile.scala 39:63]
    node _T_14 = and(_T_12, _T_13) @[regfile.scala 39:53]
    node _T_15 = eq(io_re2, UInt<1>("h1")) @[regfile.scala 42:27]
    node _T_17 = mux(_T_15, regs._T_16.data, UInt<1>("h0")) @[regfile.scala 42:18]
    node _GEN_8 = mux(_T_14, io_wd, _T_17) @[regfile.scala 39:72]
    node _GEN_9 = validif(eq(_T_14, UInt<1>("h0")), io_ra2) @[regfile.scala 39:72]
    node _GEN_10 = validif(eq(_T_14, UInt<1>("h0")), clock) @[regfile.scala 39:72]
    node _GEN_11 = mux(_T_14, UInt<1>("h0"), UInt<1>("h1")) @[regfile.scala 39:72]
    node _GEN_12 = mux(_T_9, UInt<1>("h0"), _GEN_8) @[regfile.scala 37:29]
    node _GEN_13 = validif(eq(_T_9, UInt<1>("h0")), _GEN_9) @[regfile.scala 37:29]
    node _GEN_14 = validif(eq(_T_9, UInt<1>("h0")), _GEN_10) @[regfile.scala 37:29]
    node _GEN_15 = mux(_T_9, UInt<1>("h0"), _GEN_11) @[regfile.scala 37:29]
    node _T_18 = eq(io_we, UInt<1>("h1")) @[regfile.scala 46:16]
    node _T_19 = neq(io_wa, UInt<1>("h0")) @[regfile.scala 46:35]
    node _T_20 = and(_T_18, _T_19) @[regfile.scala 46:25]
    node _GEN_16 = validif(_T_20, io_wa) @[regfile.scala 46:52]
    node _GEN_17 = validif(_T_20, clock) @[regfile.scala 46:52]
    node _GEN_18 = mux(_T_20, UInt<1>("h1"), UInt<1>("h0")) @[regfile.scala 46:52]
    node _GEN_19 = validif(_T_20, UInt<1>("h1")) @[regfile.scala 46:52]
    node _GEN_20 = validif(_T_20, io_wd) @[regfile.scala 46:52]
    io_rd1 <= _GEN_4 @[regfile.scala 29:12 regfile.scala 31:12 regfile.scala 33:12]
    io_rd2 <= _GEN_12 @[regfile.scala 38:12 regfile.scala 40:12 regfile.scala 42:12]
    regs._T_7.addr <= _GEN_5 @[regfile.scala 33:41]
    regs._T_7.en <= _GEN_7 @[regfile.scala 25:17 regfile.scala 33:41]
    regs._T_7.clk <= _GEN_6 @[regfile.scala 33:41]
    regs._T_16.addr <= _GEN_13 @[regfile.scala 42:41]
    regs._T_16.en <= _GEN_15 @[regfile.scala 25:17 regfile.scala 42:41]
    regs._T_16.clk <= _GEN_14 @[regfile.scala 42:41]
    regs._T_21.addr <= _GEN_16 @[regfile.scala 47:9]
    regs._T_21.en <= _GEN_18 @[regfile.scala 25:17 regfile.scala 47:9]
    regs._T_21.clk <= _GEN_17 @[regfile.scala 47:9]
    regs._T_21.data <= _GEN_20 @[regfile.scala 47:17]
    regs._T_21.mask <= _GEN_19 @[regfile.scala 47:9 regfile.scala 47:17]
