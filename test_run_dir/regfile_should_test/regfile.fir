;buildInfoPackage: chisel3, version: 3.3-SNAPSHOT, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit regfile : 
  module regfile : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip wa : UInt<5>, flip wd : UInt<32>, flip we : UInt<1>, flip ra1 : UInt<5>, flip ra2 : UInt<5>, flip re1 : UInt<1>, flip re2 : UInt<1>, rd1 : UInt<32>, rd2 : UInt<32>}
    
    cmem regs : UInt<32>[32] @[regfile.scala 25:17]
    node _T = eq(io.ra1, UInt<1>("h00")) @[regfile.scala 28:15]
    when _T : @[regfile.scala 28:29]
      io.rd1 <= UInt<1>("h00") @[regfile.scala 29:12]
      skip @[regfile.scala 28:29]
    else : @[regfile.scala 30:72]
      node _T_1 = eq(io.re1, UInt<1>("h01")) @[regfile.scala 30:22]
      node _T_2 = eq(io.ra1, io.wa) @[regfile.scala 30:42]
      node _T_3 = and(_T_1, _T_2) @[regfile.scala 30:31]
      node _T_4 = eq(io.we, UInt<1>("h01")) @[regfile.scala 30:63]
      node _T_5 = and(_T_3, _T_4) @[regfile.scala 30:53]
      when _T_5 : @[regfile.scala 30:72]
        io.rd1 <= io.wd @[regfile.scala 31:12]
        skip @[regfile.scala 30:72]
      else : @[regfile.scala 32:15]
        node _T_6 = eq(io.re1, UInt<1>("h01")) @[regfile.scala 33:27]
        infer mport _T_7 = regs[io.ra1], clock @[regfile.scala 33:41]
        node _T_8 = mux(_T_6, _T_7, UInt<1>("h00")) @[regfile.scala 33:18]
        io.rd1 <= _T_8 @[regfile.scala 33:12]
        skip @[regfile.scala 32:15]
    node _T_9 = eq(io.ra2, UInt<1>("h00")) @[regfile.scala 37:15]
    when _T_9 : @[regfile.scala 37:29]
      io.rd2 <= UInt<1>("h00") @[regfile.scala 38:12]
      skip @[regfile.scala 37:29]
    else : @[regfile.scala 39:72]
      node _T_10 = eq(io.re2, UInt<1>("h01")) @[regfile.scala 39:22]
      node _T_11 = eq(io.ra2, io.wa) @[regfile.scala 39:42]
      node _T_12 = and(_T_10, _T_11) @[regfile.scala 39:31]
      node _T_13 = eq(io.we, UInt<1>("h01")) @[regfile.scala 39:63]
      node _T_14 = and(_T_12, _T_13) @[regfile.scala 39:53]
      when _T_14 : @[regfile.scala 39:72]
        io.rd2 <= io.wd @[regfile.scala 40:12]
        skip @[regfile.scala 39:72]
      else : @[regfile.scala 41:15]
        node _T_15 = eq(io.re2, UInt<1>("h01")) @[regfile.scala 42:27]
        infer mport _T_16 = regs[io.ra2], clock @[regfile.scala 42:41]
        node _T_17 = mux(_T_15, _T_16, UInt<1>("h00")) @[regfile.scala 42:18]
        io.rd2 <= _T_17 @[regfile.scala 42:12]
        skip @[regfile.scala 41:15]
    node _T_18 = eq(io.we, UInt<1>("h01")) @[regfile.scala 46:16]
    node _T_19 = neq(io.wa, UInt<1>("h00")) @[regfile.scala 46:35]
    node _T_20 = and(_T_18, _T_19) @[regfile.scala 46:25]
    when _T_20 : @[regfile.scala 46:52]
      infer mport _T_21 = regs[io.wa], clock @[regfile.scala 47:9]
      _T_21 <= io.wd @[regfile.scala 47:17]
      skip @[regfile.scala 46:52]
    
