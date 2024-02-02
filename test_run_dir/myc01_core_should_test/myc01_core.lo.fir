circuit myc01_core :
  module if_stage :
    input clock : Clock
    input reset : UInt<1>
    output io_ice : UInt<1>
    output io_pc : UInt<32>
    output io_iaddr : UInt<32>
  
    reg ice_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ice_reg) @[if_stage.scala 17:24]
    reg pc_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_reg) @[if_stage.scala 20:23]
    node _T = eq(io_ice, UInt<1>("h0")) @[if_stage.scala 23:14]
    node _T_1 = add(pc_reg, UInt<3>("h4")) @[if_stage.scala 26:23]
    node _T_2 = tail(_T_1, 1) @[if_stage.scala 26:23]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _T_2) @[if_stage.scala 23:21]
    node _T_3 = eq(io_ice, UInt<1>("h0")) @[if_stage.scala 29:26]
    node _T_4 = mux(_T_3, UInt<1>("h0"), pc_reg) @[if_stage.scala 29:18]
    io_ice <= ice_reg @[if_stage.scala 18:10]
    io_pc <= pc_reg @[if_stage.scala 21:9]
    io_iaddr <= _T_4 @[if_stage.scala 29:12]
    ice_reg <= mux(reset, UInt<1>("h1"), ice_reg)
    pc_reg <= mux(reset, UInt<32>("h0"), _GEN_0) @[if_stage.scala 24:13 if_stage.scala 26:13]

  module ifid_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_if_pc : UInt<32>
    output io_id_pc : UInt<32>
  
    reg pc_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_reg) @[ifid_reg.scala 16:23]
    io_id_pc <= pc_reg @[ifid_reg.scala 19:12]
    pc_reg <= mux(reset, UInt<32>("h0"), io_if_pc) @[ifid_reg.scala 17:10]

  module id_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_id_pc_i : UInt<32>
    input io_id_inst_i : UInt<32>
    input io_rd1 : UInt<32>
    input io_rd2 : UInt<32>
    output io_id_alutype_o : UInt<3>
    output io_id_aluop_o : UInt<8>
    output io_id_wa_o : UInt<5>
    output io_id_wreg_o : UInt<1>
    output io_id_src1_o : UInt<32>
    output io_id_src2_o : UInt<32>
    output io_rreg1 : UInt<1>
    output io_ra1 : UInt<5>
    output io_rreg2 : UInt<1>
    output io_ra2 : UInt<5>
  
    node _T = bits(io_id_inst_i, 7, 0) @[id_stage.scala 40:35]
    node _T_1 = bits(io_id_inst_i, 15, 8) @[id_stage.scala 41:39]
    node _T_2 = bits(io_id_inst_i, 23, 16) @[id_stage.scala 42:51]
    node _T_3 = bits(io_id_inst_i, 31, 24) @[id_stage.scala 43:51]
    node _T_4 = cat(_T_2, _T_3) @[Cat.scala 30:58]
    node _T_5 = cat(_T_1, _T_4) @[Cat.scala 30:58]
    node id_inst = cat(_T, _T_5) @[Cat.scala 30:58]
    node opcode = bits(id_inst, 6, 0) @[id_stage.scala 47:29]
    node rd = bits(id_inst, 11, 7) @[id_stage.scala 48:29]
    node func3 = bits(id_inst, 14, 12) @[id_stage.scala 49:25]
    node rs1 = bits(id_inst, 19, 15) @[id_stage.scala 50:25]
    node rs2 = bits(id_inst, 24, 20) @[id_stage.scala 51:29]
    node func7 = bits(id_inst, 31, 25) @[id_stage.scala 52:29]
    node _T_6 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 58:29]
    node _T_7 = eq(func7, UInt<1>("h0")) @[id_stage.scala 58:57]
    node _T_8 = and(_T_6, _T_7) @[id_stage.scala 58:47]
    node _T_9 = eq(func3, UInt<1>("h0")) @[id_stage.scala 58:85]
    node inst_add = and(_T_8, _T_9) @[id_stage.scala 58:75]
    node _T_10 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 59:29]
    node _T_11 = eq(func7, UInt<6>("h20")) @[id_stage.scala 59:57]
    node _T_12 = and(_T_10, _T_11) @[id_stage.scala 59:47]
    node _T_13 = eq(func3, UInt<1>("h0")) @[id_stage.scala 59:85]
    node inst_sub = and(_T_12, _T_13) @[id_stage.scala 59:75]
    node _T_14 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 60:33]
    node _T_15 = eq(func7, UInt<1>("h0")) @[id_stage.scala 60:61]
    node _T_16 = and(_T_14, _T_15) @[id_stage.scala 60:51]
    node _T_17 = eq(func3, UInt<1>("h1")) @[id_stage.scala 60:89]
    node inst_sll = and(_T_16, _T_17) @[id_stage.scala 60:79]
    node _T_18 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 61:33]
    node _T_19 = eq(func7, UInt<1>("h0")) @[id_stage.scala 61:61]
    node _T_20 = and(_T_18, _T_19) @[id_stage.scala 61:51]
    node _T_21 = eq(func3, UInt<2>("h2")) @[id_stage.scala 61:89]
    node inst_slt = and(_T_20, _T_21) @[id_stage.scala 61:79]
    node _T_22 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 62:33]
    node _T_23 = eq(func7, UInt<1>("h0")) @[id_stage.scala 62:61]
    node _T_24 = and(_T_22, _T_23) @[id_stage.scala 62:51]
    node _T_25 = eq(func3, UInt<2>("h3")) @[id_stage.scala 62:89]
    node inst_sltu = and(_T_24, _T_25) @[id_stage.scala 62:79]
    node _T_26 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 63:33]
    node _T_27 = eq(func7, UInt<1>("h0")) @[id_stage.scala 63:61]
    node _T_28 = and(_T_26, _T_27) @[id_stage.scala 63:51]
    node _T_29 = eq(func3, UInt<3>("h4")) @[id_stage.scala 63:89]
    node inst_xor = and(_T_28, _T_29) @[id_stage.scala 63:79]
    node _T_30 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 64:33]
    node _T_31 = eq(func7, UInt<1>("h0")) @[id_stage.scala 64:61]
    node _T_32 = and(_T_30, _T_31) @[id_stage.scala 64:51]
    node _T_33 = eq(func3, UInt<3>("h5")) @[id_stage.scala 64:89]
    node inst_srl = and(_T_32, _T_33) @[id_stage.scala 64:79]
    node _T_34 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 65:33]
    node _T_35 = eq(func7, UInt<6>("h20")) @[id_stage.scala 65:61]
    node _T_36 = and(_T_34, _T_35) @[id_stage.scala 65:51]
    node _T_37 = eq(func3, UInt<3>("h5")) @[id_stage.scala 65:89]
    node inst_sra = and(_T_36, _T_37) @[id_stage.scala 65:79]
    node _T_38 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 66:33]
    node _T_39 = eq(func7, UInt<1>("h0")) @[id_stage.scala 66:61]
    node _T_40 = and(_T_38, _T_39) @[id_stage.scala 66:51]
    node _T_41 = eq(func3, UInt<3>("h6")) @[id_stage.scala 66:89]
    node inst_or = and(_T_40, _T_41) @[id_stage.scala 66:79]
    node _T_42 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 67:33]
    node _T_43 = eq(func7, UInt<1>("h0")) @[id_stage.scala 67:61]
    node _T_44 = and(_T_42, _T_43) @[id_stage.scala 67:51]
    node _T_45 = eq(func3, UInt<3>("h7")) @[id_stage.scala 67:89]
    node inst_and = and(_T_44, _T_45) @[id_stage.scala 67:79]
    node _T_46 = or(inst_sll, inst_srl) @[id_stage.scala 81:41]
    node _T_47 = or(_T_46, inst_sra) @[id_stage.scala 81:52]
    node _T_48 = or(inst_and, inst_or) @[id_stage.scala 82:41]
    node _T_49 = or(_T_48, inst_xor) @[id_stage.scala 82:52]
    node _T_50 = or(inst_add, inst_sub) @[id_stage.scala 83:41]
    node _T_51 = or(_T_50, inst_slt) @[id_stage.scala 83:52]
    node _T_52 = or(_T_51, inst_sltu) @[id_stage.scala 83:63]
    node id_alutype_temp_2 = _T_47 @[id_stage.scala 79:35 id_stage.scala 81:28]
    node id_alutype_temp_1 = _T_49 @[id_stage.scala 79:35 id_stage.scala 82:28]
    node _T_53 = cat(id_alutype_temp_2, id_alutype_temp_1) @[id_stage.scala 85:44]
    node id_alutype_temp_0 = _T_52 @[id_stage.scala 79:35 id_stage.scala 83:28]
    node _T_54 = cat(_T_53, id_alutype_temp_0) @[id_stage.scala 85:44]
    node _T_55 = eq(inst_add, UInt<1>("h1")) @[id_stage.scala 90:18]
    node _T_56 = eq(inst_sub, UInt<1>("h1")) @[id_stage.scala 91:18]
    node _T_57 = eq(inst_sll, UInt<1>("h1")) @[id_stage.scala 92:22]
    node _T_58 = eq(inst_slt, UInt<1>("h1")) @[id_stage.scala 93:22]
    node _T_59 = eq(inst_sltu, UInt<1>("h1")) @[id_stage.scala 94:22]
    node _T_60 = eq(inst_xor, UInt<1>("h1")) @[id_stage.scala 95:22]
    node _T_61 = eq(inst_srl, UInt<1>("h1")) @[id_stage.scala 96:22]
    node _T_62 = eq(inst_sra, UInt<1>("h1")) @[id_stage.scala 97:22]
    node _T_63 = eq(inst_or, UInt<1>("h1")) @[id_stage.scala 98:22]
    node _T_64 = eq(inst_and, UInt<1>("h1")) @[id_stage.scala 99:22]
    node _T_65 = mux(_T_64, UInt<4>("ha"), UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_66 = mux(_T_63, UInt<4>("h9"), _T_65) @[Mux.scala 98:16]
    node _T_67 = mux(_T_62, UInt<4>("h8"), _T_66) @[Mux.scala 98:16]
    node _T_68 = mux(_T_61, UInt<3>("h7"), _T_67) @[Mux.scala 98:16]
    node _T_69 = mux(_T_60, UInt<3>("h6"), _T_68) @[Mux.scala 98:16]
    node _T_70 = mux(_T_59, UInt<3>("h5"), _T_69) @[Mux.scala 98:16]
    node _T_71 = mux(_T_58, UInt<3>("h4"), _T_70) @[Mux.scala 98:16]
    node _T_72 = mux(_T_57, UInt<2>("h3"), _T_71) @[Mux.scala 98:16]
    node _T_73 = mux(_T_56, UInt<2>("h2"), _T_72) @[Mux.scala 98:16]
    node _T_74 = mux(_T_55, UInt<1>("h1"), _T_73) @[Mux.scala 98:16]
    node _T_75 = or(inst_add, inst_sub) @[id_stage.scala 103:33]
    node _T_76 = or(_T_75, inst_slt) @[id_stage.scala 103:44]
    node _T_77 = or(_T_76, inst_sltu) @[id_stage.scala 103:55]
    node _T_78 = or(_T_77, inst_and) @[id_stage.scala 103:67]
    node _T_79 = or(_T_78, inst_or) @[id_stage.scala 104:37]
    node _T_80 = or(_T_79, inst_xor) @[id_stage.scala 104:48]
    node _T_81 = or(_T_80, inst_sll) @[id_stage.scala 104:59]
    node _T_82 = or(_T_81, inst_srl) @[id_stage.scala 105:53]
    node _T_83 = or(_T_82, inst_sra) @[id_stage.scala 105:64]
    node _T_84 = or(inst_add, inst_sub) @[id_stage.scala 124:28]
    node _T_85 = or(_T_84, inst_slt) @[id_stage.scala 124:39]
    node _T_86 = or(_T_85, inst_sltu) @[id_stage.scala 124:50]
    node _T_87 = or(_T_86, inst_and) @[id_stage.scala 124:62]
    node _T_88 = or(_T_87, inst_or) @[id_stage.scala 125:32]
    node _T_89 = or(_T_88, inst_xor) @[id_stage.scala 125:43]
    node _T_90 = or(_T_89, inst_sll) @[id_stage.scala 125:54]
    node _T_91 = or(_T_90, inst_srl) @[id_stage.scala 126:44]
    node _T_92 = or(_T_91, inst_sra) @[id_stage.scala 126:55]
    node _T_93 = or(inst_add, inst_sub) @[id_stage.scala 129:28]
    node _T_94 = or(_T_93, inst_slt) @[id_stage.scala 129:39]
    node _T_95 = or(_T_94, inst_sltu) @[id_stage.scala 129:50]
    node _T_96 = or(_T_95, inst_and) @[id_stage.scala 129:62]
    node _T_97 = or(_T_96, inst_or) @[id_stage.scala 130:32]
    node _T_98 = or(_T_97, inst_xor) @[id_stage.scala 130:43]
    node _T_99 = or(_T_98, inst_sll) @[id_stage.scala 130:54]
    node _T_100 = or(_T_99, inst_srl) @[id_stage.scala 131:32]
    node _T_101 = or(_T_100, inst_sra) @[id_stage.scala 131:43]
    io_id_alutype_o <= _T_54 @[id_stage.scala 85:25]
    io_id_aluop_o <= _T_74 @[id_stage.scala 89:23]
    io_id_wa_o <= rd @[id_stage.scala 143:20]
    io_id_wreg_o <= _T_83 @[id_stage.scala 103:19]
    io_id_src1_o <= io_rd1 @[id_stage.scala 149:22]
    io_id_src2_o <= io_rd2 @[id_stage.scala 150:22]
    io_rreg1 <= _T_92 @[id_stage.scala 124:15]
    io_ra1 <= rs1 @[id_stage.scala 137:16]
    io_rreg2 <= _T_101 @[id_stage.scala 129:15]
    io_ra2 <= rs2 @[id_stage.scala 138:16]

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
      reset => (UInt<1>("h0"), alutype_reg) @[idexe_reg.scala 37:30]
    reg aluop_reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), aluop_reg) @[idexe_reg.scala 41:32]
    reg src1_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), src1_reg) @[idexe_reg.scala 45:31]
    reg src2_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), src2_reg) @[idexe_reg.scala 49:31]
    reg wa_reg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), wa_reg) @[idexe_reg.scala 53:29]
    reg wreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wreg_reg) @[idexe_reg.scala 57:31]
    io_exe_alutype <= alutype_reg @[idexe_reg.scala 39:21]
    io_exe_aluop <= aluop_reg @[idexe_reg.scala 43:19]
    io_exe_src1 <= src1_reg @[idexe_reg.scala 47:18]
    io_exe_src2 <= src2_reg @[idexe_reg.scala 51:18]
    io_exe_wa <= wa_reg @[idexe_reg.scala 55:16]
    io_exe_wreg <= wreg_reg @[idexe_reg.scala 59:18]
    alutype_reg <= mux(reset, UInt<3>("h0"), io_id_alutype) @[idexe_reg.scala 38:21]
    aluop_reg <= mux(reset, UInt<8>("h0"), io_id_aluop) @[idexe_reg.scala 42:19]
    src1_reg <= mux(reset, UInt<32>("h0"), io_id_src1) @[idexe_reg.scala 46:18]
    src2_reg <= mux(reset, UInt<32>("h0"), io_id_src2) @[idexe_reg.scala 50:18]
    wa_reg <= mux(reset, UInt<5>("h0"), io_id_wa) @[idexe_reg.scala 54:16]
    wreg_reg <= mux(reset, UInt<1>("h0"), io_id_wreg) @[idexe_reg.scala 58:18]

  module exe_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_exe_alutype_i : UInt<3>
    input io_exe_aluop_i : UInt<8>
    input io_exe_src1_i : UInt<32>
    input io_exe_src2_i : UInt<32>
    input io_exe_wa_i : UInt<5>
    input io_exe_wreg_i : UInt<1>
    output io_exe_aluop_o : UInt<8>
    output io_exe_wa_o : UInt<5>
    output io_exe_wreg_o : UInt<1>
    output io_exe_wd_o : UInt<32>
  
    node andAns = and(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 54:31]
    node orAns = or(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 55:31]
    node xorAns = xor(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 57:31]
    node _T = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 58:31]
    node addAns = tail(_T, 1) @[exe_stage.scala 58:31]
    node _T_1 = sub(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 59:31]
    node subAns = tail(_T_1, 1) @[exe_stage.scala 59:31]
    node _T_2 = asSInt(io_exe_src1_i) @[exe_stage.scala 61:42]
    node _T_3 = asSInt(io_exe_src2_i) @[exe_stage.scala 61:67]
    node _T_4 = lt(_T_2, _T_3) @[exe_stage.scala 61:45]
    node sltAns = mux(_T_4, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 61:20]
    node _T_5 = lt(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 62:45]
    node sltuAns = mux(_T_5, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 62:20]
    node _T_6 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 64:48]
    node _T_7 = dshl(io_exe_src1_i, _T_6) @[exe_stage.scala 64:32]
    node sllAns = bits(_T_7, 31, 0) @[exe_stage.scala 64:54]
    node _T_8 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 65:48]
    node srlAns = dshr(io_exe_src1_i, _T_8) @[exe_stage.scala 65:32]
    node _T_9 = asSInt(io_exe_src1_i) @[exe_stage.scala 66:38]
    node _T_10 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 66:57]
    node _T_11 = dshr(_T_9, _T_10) @[exe_stage.scala 66:41]
    node sraAns = asUInt(_T_11) @[exe_stage.scala 66:70]
    node _T_12 = eq(io_exe_aluop_i, UInt<4>("ha")) @[exe_stage.scala 72:24]
    node _T_13 = eq(io_exe_aluop_i, UInt<4>("h9")) @[exe_stage.scala 73:28]
    node _T_14 = eq(io_exe_aluop_i, UInt<3>("h6")) @[exe_stage.scala 74:28]
    node _T_15 = mux(_T_14, xorAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_16 = mux(_T_13, orAns, _T_15) @[Mux.scala 98:16]
    node logicres = mux(_T_12, andAns, _T_16) @[Mux.scala 98:16]
    node _T_17 = eq(io_exe_aluop_i, UInt<2>("h3")) @[exe_stage.scala 80:24]
    node _T_18 = eq(io_exe_aluop_i, UInt<3>("h7")) @[exe_stage.scala 81:28]
    node _T_19 = eq(io_exe_aluop_i, UInt<4>("h8")) @[exe_stage.scala 82:28]
    node _T_20 = mux(_T_19, sraAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_21 = mux(_T_18, srlAns, _T_20) @[Mux.scala 98:16]
    node shiftres = mux(_T_17, sllAns, _T_21) @[Mux.scala 98:16]
    node _T_22 = eq(io_exe_aluop_i, UInt<1>("h1")) @[exe_stage.scala 89:24]
    node _T_23 = eq(io_exe_aluop_i, UInt<2>("h2")) @[exe_stage.scala 90:28]
    node _T_24 = eq(io_exe_aluop_i, UInt<3>("h4")) @[exe_stage.scala 91:28]
    node _T_25 = eq(io_exe_aluop_i, UInt<3>("h5")) @[exe_stage.scala 92:28]
    node _T_26 = mux(_T_25, sltuAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_27 = mux(_T_24, sltAns, _T_26) @[Mux.scala 98:16]
    node _T_28 = mux(_T_23, subAns, _T_27) @[Mux.scala 98:16]
    node arithres = mux(_T_22, addAns, _T_28) @[Mux.scala 98:16]
    node _T_29 = eq(io_exe_alutype_i, UInt<1>("h1")) @[exe_stage.scala 98:28]
    node _T_30 = eq(io_exe_alutype_i, UInt<2>("h2")) @[exe_stage.scala 99:28]
    node _T_31 = eq(io_exe_alutype_i, UInt<3>("h4")) @[exe_stage.scala 101:24]
    node _T_32 = mux(_T_31, shiftres, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_33 = mux(_T_30, logicres, _T_32) @[Mux.scala 98:16]
    node _T_34 = mux(_T_29, arithres, _T_33) @[Mux.scala 98:16]
    io_exe_aluop_o <= io_exe_aluop_i @[exe_stage.scala 42:18]
    io_exe_wa_o <= io_exe_wa_i @[exe_stage.scala 47:17]
    io_exe_wreg_o <= io_exe_wreg_i @[exe_stage.scala 48:17]
    io_exe_wd_o <= _T_34 @[exe_stage.scala 97:15]

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

  module mem_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_aluop_i : UInt<8>
    input io_mem_wa_i : UInt<5>
    input io_mem_wreg_i : UInt<1>
    input io_mem_wd_i : UInt<32>
    output io_mem_wa_o : UInt<5>
    output io_mem_wreg_o : UInt<1>
    output io_mem_dreg_o : UInt<32>
  
    io_mem_wa_o <= io_mem_wa_i @[mem_stage.scala 41:20]
    io_mem_wreg_o <= io_mem_wreg_i @[mem_stage.scala 42:24]
    io_mem_dreg_o <= io_mem_wd_i @[mem_stage.scala 43:24]

  module memwb_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_wa : UInt<5>
    input io_mem_wreg : UInt<1>
    input io_mem_dreg : UInt<32>
    output io_wb_wa : UInt<5>
    output io_wb_wreg : UInt<1>
    output io_wb_dreg : UInt<32>
  
    reg wa_reg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), wa_reg) @[memwb_reg.scala 25:30]
    reg wreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wreg_reg) @[memwb_reg.scala 29:32]
    reg dreg_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), dreg_reg) @[memwb_reg.scala 33:32]
    io_wb_wa <= wa_reg @[memwb_reg.scala 27:16]
    io_wb_wreg <= wreg_reg @[memwb_reg.scala 31:17]
    io_wb_dreg <= dreg_reg @[memwb_reg.scala 35:18]
    wa_reg <= mux(reset, UInt<5>("h0"), io_mem_wa) @[memwb_reg.scala 26:16]
    wreg_reg <= mux(reset, UInt<1>("h0"), io_mem_wreg) @[memwb_reg.scala 30:17]
    dreg_reg <= mux(reset, UInt<32>("h0"), io_mem_dreg) @[memwb_reg.scala 34:18]

  module wb_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_wb_wa_i : UInt<5>
    input io_wb_wreg_i : UInt<1>
    input io_wb_dreg_i : UInt<32>
    output io_wb_wa_o : UInt<5>
    output io_wb_wreg_o : UInt<1>
    output io_wb_wd_o : UInt<32>
  
    io_wb_wa_o <= io_wb_wa_i @[wb_stage.scala 36:23]
    io_wb_wreg_o <= io_wb_wreg_i @[wb_stage.scala 37:23]
    io_wb_wd_o <= io_wb_dreg_i @[wb_stage.scala 44:20]

  module regfile :
    input clock : Clock
    input reset : UInt<1>
    input io_wa : UInt<5>
    input io_wd : UInt<6>
    input io_we : UInt<1>
    input io_ra1 : UInt<5>
    input io_ra2 : UInt<5>
    input io_re1 : UInt<1>
    input io_re2 : UInt<1>
    output io_rd1 : UInt<32>
    output io_rd2 : UInt<32>
  
    mem regs : @[regfile.scala 27:17]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => _T_7
      reader => _T_16
      writer => _T_21
      read-under-write => undefined
    node _T = eq(io_ra1, UInt<1>("h0")) @[regfile.scala 32:15]
    node _T_1 = eq(io_re1, UInt<1>("h1")) @[regfile.scala 34:22]
    node _T_2 = eq(io_ra1, io_wa) @[regfile.scala 34:42]
    node _T_3 = and(_T_1, _T_2) @[regfile.scala 34:31]
    node _T_4 = eq(io_we, UInt<1>("h1")) @[regfile.scala 34:63]
    node _T_5 = and(_T_3, _T_4) @[regfile.scala 34:53]
    node _T_6 = eq(io_re1, UInt<1>("h1")) @[regfile.scala 37:27]
    node _T_8 = mux(_T_6, regs._T_7.data, UInt<1>("h0")) @[regfile.scala 37:18]
    node _GEN_0 = mux(_T_5, io_wd, _T_8) @[regfile.scala 34:72]
    node _GEN_1 = validif(eq(_T_5, UInt<1>("h0")), io_ra1) @[regfile.scala 34:72]
    node _GEN_2 = validif(eq(_T_5, UInt<1>("h0")), clock) @[regfile.scala 34:72]
    node _GEN_3 = mux(_T_5, UInt<1>("h0"), UInt<1>("h1")) @[regfile.scala 34:72]
    node _GEN_4 = mux(_T, UInt<1>("h0"), _GEN_0) @[regfile.scala 32:29]
    node _GEN_5 = validif(eq(_T, UInt<1>("h0")), _GEN_1) @[regfile.scala 32:29]
    node _GEN_6 = validif(eq(_T, UInt<1>("h0")), _GEN_2) @[regfile.scala 32:29]
    node _GEN_7 = mux(_T, UInt<1>("h0"), _GEN_3) @[regfile.scala 32:29]
    node _T_9 = eq(io_ra2, UInt<1>("h0")) @[regfile.scala 41:15]
    node _T_10 = eq(io_re2, UInt<1>("h1")) @[regfile.scala 43:22]
    node _T_11 = eq(io_ra2, io_wa) @[regfile.scala 43:42]
    node _T_12 = and(_T_10, _T_11) @[regfile.scala 43:31]
    node _T_13 = eq(io_we, UInt<1>("h1")) @[regfile.scala 43:63]
    node _T_14 = and(_T_12, _T_13) @[regfile.scala 43:53]
    node _T_15 = eq(io_re2, UInt<1>("h1")) @[regfile.scala 46:27]
    node _T_17 = mux(_T_15, regs._T_16.data, UInt<1>("h0")) @[regfile.scala 46:18]
    node _GEN_8 = mux(_T_14, io_wd, _T_17) @[regfile.scala 43:72]
    node _GEN_9 = validif(eq(_T_14, UInt<1>("h0")), io_ra2) @[regfile.scala 43:72]
    node _GEN_10 = validif(eq(_T_14, UInt<1>("h0")), clock) @[regfile.scala 43:72]
    node _GEN_11 = mux(_T_14, UInt<1>("h0"), UInt<1>("h1")) @[regfile.scala 43:72]
    node _GEN_12 = mux(_T_9, UInt<1>("h0"), _GEN_8) @[regfile.scala 41:29]
    node _GEN_13 = validif(eq(_T_9, UInt<1>("h0")), _GEN_9) @[regfile.scala 41:29]
    node _GEN_14 = validif(eq(_T_9, UInt<1>("h0")), _GEN_10) @[regfile.scala 41:29]
    node _GEN_15 = mux(_T_9, UInt<1>("h0"), _GEN_11) @[regfile.scala 41:29]
    node _T_18 = eq(io_we, UInt<1>("h1")) @[regfile.scala 50:16]
    node _T_19 = neq(io_wa, UInt<1>("h0")) @[regfile.scala 50:35]
    node _T_20 = and(_T_18, _T_19) @[regfile.scala 50:25]
    node _GEN_16 = validif(_T_20, io_wa) @[regfile.scala 50:52]
    node _GEN_17 = validif(_T_20, clock) @[regfile.scala 50:52]
    node _GEN_18 = mux(_T_20, UInt<1>("h1"), UInt<1>("h0")) @[regfile.scala 50:52]
    node _GEN_19 = validif(_T_20, UInt<1>("h1")) @[regfile.scala 50:52]
    node _GEN_20 = validif(_T_20, io_wd) @[regfile.scala 50:52]
    io_rd1 <= _GEN_4 @[regfile.scala 33:12 regfile.scala 35:12 regfile.scala 37:12]
    io_rd2 <= _GEN_12 @[regfile.scala 42:12 regfile.scala 44:12 regfile.scala 46:12]
    regs._T_7.addr <= _GEN_5 @[regfile.scala 37:41]
    regs._T_7.en <= _GEN_7 @[regfile.scala 27:17 regfile.scala 37:41]
    regs._T_7.clk <= _GEN_6 @[regfile.scala 37:41]
    regs._T_16.addr <= _GEN_13 @[regfile.scala 46:41]
    regs._T_16.en <= _GEN_15 @[regfile.scala 27:17 regfile.scala 46:41]
    regs._T_16.clk <= _GEN_14 @[regfile.scala 46:41]
    regs._T_21.addr <= _GEN_16 @[regfile.scala 51:9]
    regs._T_21.en <= _GEN_18 @[regfile.scala 27:17 regfile.scala 51:9]
    regs._T_21.clk <= _GEN_17 @[regfile.scala 51:9]
    regs._T_21.data <= _GEN_20 @[regfile.scala 51:17]
    regs._T_21.mask <= _GEN_19 @[regfile.scala 51:9 regfile.scala 51:17]

  module myc01_core :
    input clock : Clock
    input reset : UInt<1>
    input io_inst : UInt<32>
    output io_iaddr : UInt<32>
    output io_ice : UInt<1>
    output io_exe_aluop_o : UInt<8>
    output io_exe_wa_o : UInt<5>
    output io_exe_wreg_o : UInt<1>
    output io_exe_wd_o : UInt<32>
    output io_id_pc : UInt<32>
  
    inst if_stage of if_stage @[myc01_core.scala 31:32]
    inst ifid_reg of ifid_reg @[myc01_core.scala 32:32]
    inst id_stage of id_stage @[myc01_core.scala 33:32]
    inst idexe_reg of idexe_reg @[myc01_core.scala 34:32]
    inst exe_stage of exe_stage @[myc01_core.scala 35:32]
    inst exemem_reg of exemem_reg @[myc01_core.scala 36:32]
    inst mem_stage of mem_stage @[myc01_core.scala 37:32]
    inst memwb_reg of memwb_reg @[myc01_core.scala 38:32]
    inst wb_stage of wb_stage @[myc01_core.scala 39:32]
    inst regfile of regfile @[myc01_core.scala 40:32]
    io_iaddr <= if_stage.io_iaddr @[myc01_core.scala 104:18]
    io_ice <= if_stage.io_ice @[myc01_core.scala 103:18]
    io_exe_aluop_o <= exe_stage.io_exe_aluop_o @[myc01_core.scala 109:23]
    io_exe_wa_o <= exe_stage.io_exe_wa_o @[myc01_core.scala 110:19]
    io_exe_wreg_o <= exe_stage.io_exe_wreg_o @[myc01_core.scala 111:19]
    io_exe_wd_o <= exe_stage.io_exe_wd_o @[myc01_core.scala 112:19]
    io_id_pc <= ifid_reg.io_id_pc @[myc01_core.scala 114:23]
    if_stage.clock <= clock
    if_stage.reset <= reset
    ifid_reg.clock <= clock
    ifid_reg.reset <= reset
    ifid_reg.io_if_pc <= if_stage.io_pc @[myc01_core.scala 43:27]
    id_stage.clock <= clock
    id_stage.reset <= reset
    id_stage.io_id_pc_i <= ifid_reg.io_id_pc @[myc01_core.scala 46:25]
    id_stage.io_id_inst_i <= io_inst @[myc01_core.scala 107:31]
    id_stage.io_rd1 <= regfile.io_rd1 @[myc01_core.scala 62:25]
    id_stage.io_rd2 <= regfile.io_rd2 @[myc01_core.scala 63:25]
    idexe_reg.clock <= clock
    idexe_reg.reset <= reset
    idexe_reg.io_id_alutype <= id_stage.io_id_alutype_o @[myc01_core.scala 49:29]
    idexe_reg.io_id_aluop <= id_stage.io_id_aluop_o @[myc01_core.scala 50:29]
    idexe_reg.io_id_src1 <= id_stage.io_id_src1_o @[myc01_core.scala 51:29]
    idexe_reg.io_id_src2 <= id_stage.io_id_src2_o @[myc01_core.scala 52:29]
    idexe_reg.io_id_wa <= id_stage.io_id_wa_o @[myc01_core.scala 53:29]
    idexe_reg.io_id_wreg <= id_stage.io_id_wreg_o @[myc01_core.scala 54:29]
    exe_stage.clock <= clock
    exe_stage.reset <= reset
    exe_stage.io_exe_alutype_i <= idexe_reg.io_exe_alutype @[myc01_core.scala 66:32]
    exe_stage.io_exe_aluop_i <= idexe_reg.io_exe_aluop @[myc01_core.scala 67:32]
    exe_stage.io_exe_src1_i <= idexe_reg.io_exe_src1 @[myc01_core.scala 68:32]
    exe_stage.io_exe_src2_i <= idexe_reg.io_exe_src2 @[myc01_core.scala 69:32]
    exe_stage.io_exe_wa_i <= idexe_reg.io_exe_wa @[myc01_core.scala 70:32]
    exe_stage.io_exe_wreg_i <= idexe_reg.io_exe_wreg @[myc01_core.scala 71:32]
    exemem_reg.clock <= clock
    exemem_reg.reset <= reset
    exemem_reg.io_exe_aluop <= exe_stage.io_exe_aluop_o @[myc01_core.scala 74:29]
    exemem_reg.io_exe_wa <= exe_stage.io_exe_wa_o @[myc01_core.scala 75:33]
    exemem_reg.io_exe_wreg <= exe_stage.io_exe_wreg_o @[myc01_core.scala 76:29]
    exemem_reg.io_exe_wd <= exe_stage.io_exe_wd_o @[myc01_core.scala 77:29]
    mem_stage.clock <= clock
    mem_stage.reset <= reset
    mem_stage.io_mem_aluop_i <= exemem_reg.io_mem_aluop @[myc01_core.scala 80:34]
    mem_stage.io_mem_wa_i <= exemem_reg.io_mem_wa @[myc01_core.scala 81:34]
    mem_stage.io_mem_wreg_i <= exemem_reg.io_mem_wreg @[myc01_core.scala 82:34]
    mem_stage.io_mem_wd_i <= exemem_reg.io_mem_wd @[myc01_core.scala 83:34]
    memwb_reg.clock <= clock
    memwb_reg.reset <= reset
    memwb_reg.io_mem_wa <= mem_stage.io_mem_wa_o @[myc01_core.scala 86:27]
    memwb_reg.io_mem_wreg <= mem_stage.io_mem_wreg_o @[myc01_core.scala 87:31]
    memwb_reg.io_mem_dreg <= mem_stage.io_mem_dreg_o @[myc01_core.scala 88:31]
    wb_stage.clock <= clock
    wb_stage.reset <= reset
    wb_stage.io_wb_wa_i <= memwb_reg.io_wb_wa @[myc01_core.scala 91:31]
    wb_stage.io_wb_wreg_i <= memwb_reg.io_wb_wreg @[myc01_core.scala 92:31]
    wb_stage.io_wb_dreg_i <= memwb_reg.io_wb_dreg @[myc01_core.scala 93:27]
    regfile.clock <= clock
    regfile.reset <= reset
    regfile.io_wa <= wb_stage.io_wb_wa_o @[myc01_core.scala 96:23]
    regfile.io_wd <= bits(wb_stage.io_wb_wd_o, 5, 0) @[myc01_core.scala 97:23]
    regfile.io_we <= wb_stage.io_wb_wreg_o @[myc01_core.scala 98:23]
    regfile.io_ra1 <= id_stage.io_ra1 @[myc01_core.scala 57:24]
    regfile.io_ra2 <= id_stage.io_ra2 @[myc01_core.scala 58:24]
    regfile.io_re1 <= id_stage.io_rreg1 @[myc01_core.scala 59:24]
    regfile.io_re2 <= id_stage.io_rreg2 @[myc01_core.scala 60:24]
