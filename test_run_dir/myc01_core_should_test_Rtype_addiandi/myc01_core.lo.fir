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
    output io_id_mreg_o : UInt<1>
    output io_id_din_o : UInt<32>
    output io_id_src1_o : UInt<32>
    output io_id_src2_o : UInt<32>
    output io_rreg1 : UInt<1>
    output io_ra1 : UInt<5>
    output io_rreg2 : UInt<1>
    output io_ra2 : UInt<5>
    input io_exe2id_wreg : UInt<1>
    input io_exe2id_wa : UInt<5>
    input io_exe2id_wd : UInt<32>
    input io_mem2id_wreg : UInt<1>
    input io_mem2id_wa : UInt<5>
    input io_mem2id_wd : UInt<32>
  
    node _T = bits(io_id_inst_i, 7, 0) @[id_stage.scala 49:35]
    node _T_1 = bits(io_id_inst_i, 15, 8) @[id_stage.scala 50:39]
    node _T_2 = bits(io_id_inst_i, 23, 16) @[id_stage.scala 51:51]
    node _T_3 = bits(io_id_inst_i, 31, 24) @[id_stage.scala 52:51]
    node _T_4 = cat(_T_2, _T_3) @[Cat.scala 30:58]
    node _T_5 = cat(_T_1, _T_4) @[Cat.scala 30:58]
    node id_inst = cat(_T, _T_5) @[Cat.scala 30:58]
    node opcode = bits(id_inst, 6, 0) @[id_stage.scala 56:29]
    node rd = bits(id_inst, 11, 7) @[id_stage.scala 57:29]
    node func3 = bits(id_inst, 14, 12) @[id_stage.scala 58:25]
    node rs1 = bits(id_inst, 19, 15) @[id_stage.scala 59:25]
    node rs2 = bits(id_inst, 24, 20) @[id_stage.scala 60:29]
    node func7 = bits(id_inst, 31, 25) @[id_stage.scala 61:29]
    node imm_I = bits(id_inst, 31, 20) @[id_stage.scala 62:25]
    node shamt = bits(id_inst, 24, 20) @[id_stage.scala 63:29]
    node _T_6 = bits(id_inst, 31, 25) @[id_stage.scala 64:33]
    node _T_7 = bits(id_inst, 11, 7) @[id_stage.scala 64:48]
    node imm_S = cat(_T_6, _T_7) @[Cat.scala 30:58]
    node _T_8 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 69:30]
    node _T_9 = eq(func7, UInt<1>("h0")) @[id_stage.scala 69:58]
    node _T_10 = and(_T_8, _T_9) @[id_stage.scala 69:48]
    node _T_11 = eq(func3, UInt<1>("h0")) @[id_stage.scala 69:86]
    node inst_add = and(_T_10, _T_11) @[id_stage.scala 69:76]
    node _T_12 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 70:30]
    node _T_13 = eq(func7, UInt<6>("h20")) @[id_stage.scala 70:58]
    node _T_14 = and(_T_12, _T_13) @[id_stage.scala 70:48]
    node _T_15 = eq(func3, UInt<1>("h0")) @[id_stage.scala 70:86]
    node inst_sub = and(_T_14, _T_15) @[id_stage.scala 70:76]
    node _T_16 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 71:34]
    node _T_17 = eq(func7, UInt<1>("h0")) @[id_stage.scala 71:62]
    node _T_18 = and(_T_16, _T_17) @[id_stage.scala 71:52]
    node _T_19 = eq(func3, UInt<1>("h1")) @[id_stage.scala 71:90]
    node inst_sll = and(_T_18, _T_19) @[id_stage.scala 71:80]
    node _T_20 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 72:34]
    node _T_21 = eq(func7, UInt<1>("h0")) @[id_stage.scala 72:62]
    node _T_22 = and(_T_20, _T_21) @[id_stage.scala 72:52]
    node _T_23 = eq(func3, UInt<2>("h2")) @[id_stage.scala 72:90]
    node inst_slt = and(_T_22, _T_23) @[id_stage.scala 72:80]
    node _T_24 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 73:34]
    node _T_25 = eq(func7, UInt<1>("h0")) @[id_stage.scala 73:62]
    node _T_26 = and(_T_24, _T_25) @[id_stage.scala 73:52]
    node _T_27 = eq(func3, UInt<2>("h3")) @[id_stage.scala 73:90]
    node inst_sltu = and(_T_26, _T_27) @[id_stage.scala 73:80]
    node _T_28 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 74:34]
    node _T_29 = eq(func7, UInt<1>("h0")) @[id_stage.scala 74:62]
    node _T_30 = and(_T_28, _T_29) @[id_stage.scala 74:52]
    node _T_31 = eq(func3, UInt<3>("h4")) @[id_stage.scala 74:90]
    node inst_xor = and(_T_30, _T_31) @[id_stage.scala 74:80]
    node _T_32 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 75:34]
    node _T_33 = eq(func7, UInt<1>("h0")) @[id_stage.scala 75:62]
    node _T_34 = and(_T_32, _T_33) @[id_stage.scala 75:52]
    node _T_35 = eq(func3, UInt<3>("h5")) @[id_stage.scala 75:90]
    node inst_srl = and(_T_34, _T_35) @[id_stage.scala 75:80]
    node _T_36 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 76:34]
    node _T_37 = eq(func7, UInt<6>("h20")) @[id_stage.scala 76:62]
    node _T_38 = and(_T_36, _T_37) @[id_stage.scala 76:52]
    node _T_39 = eq(func3, UInt<3>("h5")) @[id_stage.scala 76:90]
    node inst_sra = and(_T_38, _T_39) @[id_stage.scala 76:80]
    node _T_40 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 77:34]
    node _T_41 = eq(func7, UInt<1>("h0")) @[id_stage.scala 77:62]
    node _T_42 = and(_T_40, _T_41) @[id_stage.scala 77:52]
    node _T_43 = eq(func3, UInt<3>("h6")) @[id_stage.scala 77:90]
    node inst_or = and(_T_42, _T_43) @[id_stage.scala 77:80]
    node _T_44 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 78:34]
    node _T_45 = eq(func7, UInt<1>("h0")) @[id_stage.scala 78:62]
    node _T_46 = and(_T_44, _T_45) @[id_stage.scala 78:52]
    node _T_47 = eq(func3, UInt<3>("h7")) @[id_stage.scala 78:90]
    node inst_and = and(_T_46, _T_47) @[id_stage.scala 78:80]
    node _T_48 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 81:30]
    node _T_49 = eq(func3, UInt<1>("h0")) @[id_stage.scala 81:58]
    node inst_addi = and(_T_48, _T_49) @[id_stage.scala 81:48]
    node _T_50 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 82:34]
    node _T_51 = eq(func3, UInt<2>("h2")) @[id_stage.scala 82:62]
    node inst_slti = and(_T_50, _T_51) @[id_stage.scala 82:52]
    node _T_52 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 83:34]
    node _T_53 = eq(func3, UInt<2>("h3")) @[id_stage.scala 83:62]
    node inst_sltiu = and(_T_52, _T_53) @[id_stage.scala 83:52]
    node _T_54 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 84:34]
    node _T_55 = eq(func3, UInt<3>("h4")) @[id_stage.scala 84:62]
    node inst_xori = and(_T_54, _T_55) @[id_stage.scala 84:52]
    node _T_56 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 85:34]
    node _T_57 = eq(func3, UInt<3>("h6")) @[id_stage.scala 85:62]
    node inst_ori = and(_T_56, _T_57) @[id_stage.scala 85:52]
    node _T_58 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 86:34]
    node _T_59 = eq(func3, UInt<3>("h7")) @[id_stage.scala 86:62]
    node inst_andi = and(_T_58, _T_59) @[id_stage.scala 86:52]
    node _T_60 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 87:34]
    node _T_61 = eq(func7, UInt<1>("h0")) @[id_stage.scala 87:62]
    node _T_62 = and(_T_60, _T_61) @[id_stage.scala 87:52]
    node _T_63 = eq(func3, UInt<1>("h1")) @[id_stage.scala 87:90]
    node inst_slli = and(_T_62, _T_63) @[id_stage.scala 87:80]
    node _T_64 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 88:34]
    node _T_65 = eq(func7, UInt<1>("h0")) @[id_stage.scala 88:62]
    node _T_66 = and(_T_64, _T_65) @[id_stage.scala 88:52]
    node _T_67 = eq(func3, UInt<3>("h5")) @[id_stage.scala 88:90]
    node inst_srli = and(_T_66, _T_67) @[id_stage.scala 88:80]
    node _T_68 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 89:34]
    node _T_69 = eq(func7, UInt<6>("h20")) @[id_stage.scala 89:62]
    node _T_70 = and(_T_68, _T_69) @[id_stage.scala 89:52]
    node _T_71 = eq(func3, UInt<3>("h5")) @[id_stage.scala 89:90]
    node inst_srai = and(_T_70, _T_71) @[id_stage.scala 89:80]
    node _T_72 = eq(opcode, UInt<2>("h3")) @[id_stage.scala 91:34]
    node _T_73 = eq(func3, UInt<1>("h0")) @[id_stage.scala 91:62]
    node inst_lb = and(_T_72, _T_73) @[id_stage.scala 91:52]
    node _T_74 = eq(opcode, UInt<2>("h3")) @[id_stage.scala 92:34]
    node _T_75 = eq(func3, UInt<1>("h1")) @[id_stage.scala 92:62]
    node inst_lh = and(_T_74, _T_75) @[id_stage.scala 92:52]
    node _T_76 = eq(opcode, UInt<2>("h3")) @[id_stage.scala 93:34]
    node _T_77 = eq(func3, UInt<2>("h2")) @[id_stage.scala 93:62]
    node inst_lw = and(_T_76, _T_77) @[id_stage.scala 93:52]
    node _T_78 = eq(opcode, UInt<2>("h3")) @[id_stage.scala 94:34]
    node _T_79 = eq(func3, UInt<3>("h4")) @[id_stage.scala 94:62]
    node inst_lbu = and(_T_78, _T_79) @[id_stage.scala 94:52]
    node _T_80 = eq(opcode, UInt<2>("h3")) @[id_stage.scala 95:34]
    node _T_81 = eq(func3, UInt<3>("h5")) @[id_stage.scala 95:62]
    node inst_lhu = and(_T_80, _T_81) @[id_stage.scala 95:52]
    node _T_82 = eq(opcode, UInt<6>("h23")) @[id_stage.scala 98:34]
    node _T_83 = eq(func3, UInt<1>("h0")) @[id_stage.scala 98:62]
    node inst_sb = and(_T_82, _T_83) @[id_stage.scala 98:52]
    node _T_84 = eq(opcode, UInt<6>("h23")) @[id_stage.scala 99:34]
    node _T_85 = eq(func3, UInt<1>("h1")) @[id_stage.scala 99:62]
    node inst_sh = and(_T_84, _T_85) @[id_stage.scala 99:52]
    node _T_86 = eq(opcode, UInt<6>("h23")) @[id_stage.scala 100:34]
    node _T_87 = eq(func3, UInt<2>("h2")) @[id_stage.scala 100:62]
    node inst_sw = and(_T_86, _T_87) @[id_stage.scala 100:52]
    node _T_88 = or(inst_sll, inst_srl) @[id_stage.scala 114:41]
    node _T_89 = or(_T_88, inst_sra) @[id_stage.scala 114:52]
    node _T_90 = or(_T_89, inst_slli) @[id_stage.scala 114:63]
    node _T_91 = or(_T_90, inst_srli) @[id_stage.scala 115:61]
    node _T_92 = or(_T_91, inst_srai) @[id_stage.scala 115:72]
    node _T_93 = or(inst_and, inst_or) @[id_stage.scala 117:41]
    node _T_94 = or(_T_93, inst_xor) @[id_stage.scala 117:52]
    node _T_95 = or(_T_94, inst_andi) @[id_stage.scala 117:63]
    node _T_96 = or(_T_95, inst_ori) @[id_stage.scala 118:41]
    node _T_97 = or(_T_96, inst_xori) @[id_stage.scala 118:52]
    node _T_98 = or(inst_add, inst_sub) @[id_stage.scala 120:41]
    node _T_99 = or(_T_98, inst_slt) @[id_stage.scala 120:53]
    node _T_100 = or(_T_99, inst_sltu) @[id_stage.scala 120:65]
    node _T_101 = or(_T_100, inst_addi) @[id_stage.scala 120:77]
    node _T_102 = or(_T_101, inst_slti) @[id_stage.scala 121:41]
    node _T_103 = or(_T_102, inst_sltiu) @[id_stage.scala 121:53]
    node _T_104 = or(_T_103, inst_lb) @[id_stage.scala 121:65]
    node _T_105 = or(_T_104, inst_lh) @[id_stage.scala 122:61]
    node _T_106 = or(_T_105, inst_lw) @[id_stage.scala 122:73]
    node _T_107 = or(_T_106, inst_lbu) @[id_stage.scala 122:85]
    node _T_108 = or(_T_107, inst_lhu) @[id_stage.scala 122:97]
    node _T_109 = or(_T_108, inst_sb) @[id_stage.scala 122:108]
    node _T_110 = or(_T_109, inst_sh) @[id_stage.scala 123:41]
    node _T_111 = or(_T_110, inst_sw) @[id_stage.scala 123:53]
    node id_alutype_temp_2 = _T_92 @[id_stage.scala 112:35 id_stage.scala 114:28]
    node id_alutype_temp_1 = _T_97 @[id_stage.scala 112:35 id_stage.scala 117:28]
    node _T_112 = cat(id_alutype_temp_2, id_alutype_temp_1) @[id_stage.scala 125:44]
    node id_alutype_temp_0 = _T_111 @[id_stage.scala 112:35 id_stage.scala 120:28]
    node _T_113 = cat(_T_112, id_alutype_temp_0) @[id_stage.scala 125:44]
    node _T_114 = eq(inst_add, UInt<1>("h1")) @[id_stage.scala 129:19]
    node _T_115 = eq(inst_sub, UInt<1>("h1")) @[id_stage.scala 130:19]
    node _T_116 = eq(inst_sll, UInt<1>("h1")) @[id_stage.scala 131:23]
    node _T_117 = eq(inst_slt, UInt<1>("h1")) @[id_stage.scala 132:23]
    node _T_118 = eq(inst_sltu, UInt<1>("h1")) @[id_stage.scala 133:23]
    node _T_119 = eq(inst_xor, UInt<1>("h1")) @[id_stage.scala 134:23]
    node _T_120 = eq(inst_srl, UInt<1>("h1")) @[id_stage.scala 135:23]
    node _T_121 = eq(inst_sra, UInt<1>("h1")) @[id_stage.scala 136:23]
    node _T_122 = eq(inst_or, UInt<1>("h1")) @[id_stage.scala 137:23]
    node _T_123 = eq(inst_and, UInt<1>("h1")) @[id_stage.scala 138:23]
    node _T_124 = eq(inst_addi, UInt<1>("h1")) @[id_stage.scala 140:23]
    node _T_125 = eq(inst_slti, UInt<1>("h1")) @[id_stage.scala 141:19]
    node _T_126 = eq(inst_sltiu, UInt<1>("h1")) @[id_stage.scala 142:23]
    node _T_127 = eq(inst_xori, UInt<1>("h1")) @[id_stage.scala 143:23]
    node _T_128 = eq(inst_ori, UInt<1>("h1")) @[id_stage.scala 144:23]
    node _T_129 = eq(inst_andi, UInt<1>("h1")) @[id_stage.scala 145:23]
    node _T_130 = eq(inst_slli, UInt<1>("h1")) @[id_stage.scala 146:23]
    node _T_131 = eq(inst_srli, UInt<1>("h1")) @[id_stage.scala 147:23]
    node _T_132 = eq(inst_srai, UInt<1>("h1")) @[id_stage.scala 148:23]
    node _T_133 = eq(inst_lb, UInt<1>("h1")) @[id_stage.scala 150:23]
    node _T_134 = eq(inst_lh, UInt<1>("h1")) @[id_stage.scala 151:23]
    node _T_135 = eq(inst_lw, UInt<1>("h1")) @[id_stage.scala 152:23]
    node _T_136 = eq(inst_lbu, UInt<1>("h1")) @[id_stage.scala 153:23]
    node _T_137 = eq(inst_lhu, UInt<1>("h1")) @[id_stage.scala 154:23]
    node _T_138 = eq(inst_sb, UInt<1>("h1")) @[id_stage.scala 156:23]
    node _T_139 = eq(inst_sh, UInt<1>("h1")) @[id_stage.scala 157:23]
    node _T_140 = eq(inst_sw, UInt<1>("h1")) @[id_stage.scala 158:23]
    node _T_141 = mux(_T_140, UInt<5>("h1b"), UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_142 = mux(_T_139, UInt<5>("h1a"), _T_141) @[Mux.scala 98:16]
    node _T_143 = mux(_T_138, UInt<5>("h19"), _T_142) @[Mux.scala 98:16]
    node _T_144 = mux(_T_137, UInt<5>("h18"), _T_143) @[Mux.scala 98:16]
    node _T_145 = mux(_T_136, UInt<5>("h17"), _T_144) @[Mux.scala 98:16]
    node _T_146 = mux(_T_135, UInt<5>("h16"), _T_145) @[Mux.scala 98:16]
    node _T_147 = mux(_T_134, UInt<5>("h15"), _T_146) @[Mux.scala 98:16]
    node _T_148 = mux(_T_133, UInt<5>("h14"), _T_147) @[Mux.scala 98:16]
    node _T_149 = mux(_T_132, UInt<5>("h13"), _T_148) @[Mux.scala 98:16]
    node _T_150 = mux(_T_131, UInt<5>("h12"), _T_149) @[Mux.scala 98:16]
    node _T_151 = mux(_T_130, UInt<5>("h11"), _T_150) @[Mux.scala 98:16]
    node _T_152 = mux(_T_129, UInt<5>("h10"), _T_151) @[Mux.scala 98:16]
    node _T_153 = mux(_T_128, UInt<4>("hf"), _T_152) @[Mux.scala 98:16]
    node _T_154 = mux(_T_127, UInt<4>("he"), _T_153) @[Mux.scala 98:16]
    node _T_155 = mux(_T_126, UInt<4>("hd"), _T_154) @[Mux.scala 98:16]
    node _T_156 = mux(_T_125, UInt<4>("hc"), _T_155) @[Mux.scala 98:16]
    node _T_157 = mux(_T_124, UInt<4>("hb"), _T_156) @[Mux.scala 98:16]
    node _T_158 = mux(_T_123, UInt<4>("ha"), _T_157) @[Mux.scala 98:16]
    node _T_159 = mux(_T_122, UInt<4>("h9"), _T_158) @[Mux.scala 98:16]
    node _T_160 = mux(_T_121, UInt<4>("h8"), _T_159) @[Mux.scala 98:16]
    node _T_161 = mux(_T_120, UInt<3>("h7"), _T_160) @[Mux.scala 98:16]
    node _T_162 = mux(_T_119, UInt<3>("h6"), _T_161) @[Mux.scala 98:16]
    node _T_163 = mux(_T_118, UInt<3>("h5"), _T_162) @[Mux.scala 98:16]
    node _T_164 = mux(_T_117, UInt<3>("h4"), _T_163) @[Mux.scala 98:16]
    node _T_165 = mux(_T_116, UInt<2>("h3"), _T_164) @[Mux.scala 98:16]
    node _T_166 = mux(_T_115, UInt<2>("h2"), _T_165) @[Mux.scala 98:16]
    node _T_167 = mux(_T_114, UInt<1>("h1"), _T_166) @[Mux.scala 98:16]
    node _T_168 = or(inst_add, inst_sub) @[id_stage.scala 163:34]
    node _T_169 = or(_T_168, inst_slt) @[id_stage.scala 163:46]
    node _T_170 = or(_T_169, inst_sltu) @[id_stage.scala 163:58]
    node _T_171 = or(_T_170, inst_and) @[id_stage.scala 163:70]
    node _T_172 = or(_T_171, inst_or) @[id_stage.scala 164:38]
    node _T_173 = or(_T_172, inst_xor) @[id_stage.scala 164:50]
    node _T_174 = or(_T_173, inst_sll) @[id_stage.scala 164:62]
    node _T_175 = or(_T_174, inst_srl) @[id_stage.scala 165:54]
    node _T_176 = or(_T_175, inst_sra) @[id_stage.scala 165:66]
    node _T_177 = or(_T_176, inst_addi) @[id_stage.scala 165:78]
    node _T_178 = or(_T_177, inst_slti) @[id_stage.scala 166:54]
    node _T_179 = or(_T_178, inst_sltiu) @[id_stage.scala 166:66]
    node _T_180 = or(_T_179, inst_andi) @[id_stage.scala 166:78]
    node _T_181 = or(_T_180, inst_ori) @[id_stage.scala 167:54]
    node _T_182 = or(_T_181, inst_xori) @[id_stage.scala 167:66]
    node _T_183 = or(_T_182, inst_slli) @[id_stage.scala 167:78]
    node _T_184 = or(_T_183, inst_srli) @[id_stage.scala 168:34]
    node _T_185 = or(_T_184, inst_srai) @[id_stage.scala 168:46]
    node _T_186 = or(_T_185, inst_lb) @[id_stage.scala 168:58]
    node _T_187 = or(_T_186, inst_lh) @[id_stage.scala 169:54]
    node _T_188 = or(_T_187, inst_lw) @[id_stage.scala 169:66]
    node _T_189 = or(_T_188, inst_lbu) @[id_stage.scala 169:78]
    node _T_190 = or(_T_189, inst_lhu) @[id_stage.scala 169:90]
    node _T_191 = or(inst_addi, inst_slti) @[id_stage.scala 172:37]
    node _T_192 = or(_T_191, inst_sltiu) @[id_stage.scala 172:49]
    node _T_193 = or(_T_192, inst_andi) @[id_stage.scala 172:62]
    node _T_194 = or(_T_193, inst_ori) @[id_stage.scala 173:37]
    node _T_195 = or(_T_194, inst_xori) @[id_stage.scala 173:49]
    node _T_196 = or(_T_195, inst_lb) @[id_stage.scala 173:62]
    node _T_197 = or(_T_196, inst_lh) @[id_stage.scala 174:49]
    node _T_198 = or(_T_197, inst_lw) @[id_stage.scala 174:61]
    node _T_199 = or(_T_198, inst_lbu) @[id_stage.scala 174:74]
    node imm_Itype = or(_T_199, inst_lhu) @[id_stage.scala 174:86]
    node _T_200 = or(inst_slli, inst_srli) @[id_stage.scala 177:37]
    node imm_shamt = or(_T_200, inst_srai) @[id_stage.scala 177:49]
    node _T_201 = or(inst_sb, inst_sh) @[id_stage.scala 180:37]
    node imm_Stype = or(_T_201, inst_sw) @[id_stage.scala 180:49]
    node _T_202 = or(inst_lb, inst_lh) @[id_stage.scala 184:30]
    node _T_203 = or(_T_202, inst_lw) @[id_stage.scala 184:41]
    node _T_204 = or(_T_203, inst_lbu) @[id_stage.scala 184:52]
    node _T_205 = or(_T_204, inst_lhu) @[id_stage.scala 184:64]
    node _T_206 = or(inst_add, inst_sub) @[id_stage.scala 187:29]
    node _T_207 = or(_T_206, inst_slt) @[id_stage.scala 187:41]
    node _T_208 = or(_T_207, inst_sltu) @[id_stage.scala 187:53]
    node _T_209 = or(_T_208, inst_and) @[id_stage.scala 187:66]
    node _T_210 = or(_T_209, inst_or) @[id_stage.scala 188:33]
    node _T_211 = or(_T_210, inst_xor) @[id_stage.scala 188:45]
    node _T_212 = or(_T_211, inst_sll) @[id_stage.scala 188:57]
    node _T_213 = or(_T_212, inst_srl) @[id_stage.scala 189:45]
    node _T_214 = or(_T_213, inst_sra) @[id_stage.scala 189:57]
    node _T_215 = or(_T_214, inst_addi) @[id_stage.scala 189:69]
    node _T_216 = or(_T_215, inst_slti) @[id_stage.scala 190:45]
    node _T_217 = or(_T_216, inst_sltiu) @[id_stage.scala 190:57]
    node _T_218 = or(_T_217, inst_andi) @[id_stage.scala 190:69]
    node _T_219 = or(_T_218, inst_ori) @[id_stage.scala 191:45]
    node _T_220 = or(_T_219, inst_xori) @[id_stage.scala 191:57]
    node _T_221 = or(_T_220, inst_slli) @[id_stage.scala 191:69]
    node _T_222 = or(_T_221, inst_srli) @[id_stage.scala 192:29]
    node _T_223 = or(_T_222, inst_srai) @[id_stage.scala 192:41]
    node _T_224 = or(_T_223, inst_lb) @[id_stage.scala 192:53]
    node _T_225 = or(_T_224, inst_lh) @[id_stage.scala 193:29]
    node _T_226 = or(_T_225, inst_lw) @[id_stage.scala 193:41]
    node _T_227 = or(_T_226, inst_lbu) @[id_stage.scala 193:53]
    node _T_228 = or(_T_227, inst_lhu) @[id_stage.scala 193:66]
    node _T_229 = or(_T_228, inst_sb) @[id_stage.scala 193:78]
    node _T_230 = or(_T_229, inst_sh) @[id_stage.scala 194:33]
    node _T_231 = or(_T_230, inst_sw) @[id_stage.scala 194:45]
    node _T_232 = or(inst_add, inst_sub) @[id_stage.scala 197:29]
    node _T_233 = or(_T_232, inst_slt) @[id_stage.scala 197:41]
    node _T_234 = or(_T_233, inst_sltu) @[id_stage.scala 197:53]
    node _T_235 = or(_T_234, inst_and) @[id_stage.scala 197:66]
    node _T_236 = or(_T_235, inst_or) @[id_stage.scala 198:33]
    node _T_237 = or(_T_236, inst_xor) @[id_stage.scala 198:45]
    node _T_238 = or(_T_237, inst_sll) @[id_stage.scala 198:57]
    node _T_239 = or(_T_238, inst_srl) @[id_stage.scala 199:33]
    node _T_240 = or(_T_239, inst_sra) @[id_stage.scala 199:45]
    node _T_241 = or(_T_240, inst_sb) @[id_stage.scala 199:57]
    node _T_242 = or(_T_241, inst_sh) @[id_stage.scala 200:45]
    node _T_243 = or(_T_242, inst_sw) @[id_stage.scala 200:57]
    node _T_244 = eq(io_exe2id_wreg, UInt<1>("h1")) @[id_stage.scala 205:37]
    node _T_245 = eq(io_exe2id_wa, io_ra1) @[id_stage.scala 205:61]
    node _T_246 = and(_T_244, _T_245) @[id_stage.scala 205:45]
    node _T_247 = eq(io_rreg1, UInt<1>("h1")) @[id_stage.scala 205:84]
    node _T_248 = and(_T_246, _T_247) @[id_stage.scala 205:72]
    node _T_249 = eq(io_mem2id_wreg, UInt<1>("h1")) @[id_stage.scala 206:49]
    node _T_250 = eq(io_mem2id_wa, io_ra1) @[id_stage.scala 206:73]
    node _T_251 = and(_T_249, _T_250) @[id_stage.scala 206:57]
    node _T_252 = eq(io_rreg1, UInt<1>("h1")) @[id_stage.scala 206:96]
    node _T_253 = and(_T_251, _T_252) @[id_stage.scala 206:84]
    node _T_254 = mux(_T_253, UInt<2>("h2"), UInt<1>("h0")) @[Mux.scala 98:16]
    node fwrd_reg1 = mux(_T_248, UInt<1>("h1"), _T_254) @[Mux.scala 98:16]
    node _T_255 = eq(io_exe2id_wreg, UInt<1>("h1")) @[id_stage.scala 210:37]
    node _T_256 = eq(io_exe2id_wa, io_ra2) @[id_stage.scala 210:61]
    node _T_257 = and(_T_255, _T_256) @[id_stage.scala 210:45]
    node _T_258 = eq(io_rreg2, UInt<1>("h1")) @[id_stage.scala 210:84]
    node _T_259 = and(_T_257, _T_258) @[id_stage.scala 210:72]
    node _T_260 = eq(io_mem2id_wreg, UInt<1>("h1")) @[id_stage.scala 211:49]
    node _T_261 = eq(io_mem2id_wa, io_ra2) @[id_stage.scala 211:73]
    node _T_262 = and(_T_260, _T_261) @[id_stage.scala 211:57]
    node _T_263 = eq(io_rreg2, UInt<1>("h1")) @[id_stage.scala 211:96]
    node _T_264 = and(_T_262, _T_263) @[id_stage.scala 211:84]
    node _T_265 = mux(_T_264, UInt<2>("h2"), UInt<1>("h0")) @[Mux.scala 98:16]
    node fwrd_reg2 = mux(_T_259, UInt<1>("h1"), _T_265) @[Mux.scala 98:16]
    node _T_267 = eq(imm_Itype, UInt<1>("h1")) @[id_stage.scala 223:38]
    node _T_268 = asSInt(imm_I) @[id_stage.scala 223:62]
    node _T_269 = eq(imm_Stype, UInt<1>("h1")) @[id_stage.scala 224:46]
    node _T_270 = asSInt(imm_S) @[id_stage.scala 224:70]
    node _T_271 = eq(imm_shamt, UInt<1>("h1")) @[id_stage.scala 225:46]
    node _T_272 = cat(UInt<27>("h0"), shamt) @[Cat.scala 30:58]
    node _T_273 = asSInt(_T_272) @[id_stage.scala 225:86]
    node _T_274 = mux(_T_271, _T_273, asSInt(UInt<1>("h0"))) @[Mux.scala 98:16]
    node _T_275 = mux(_T_269, _T_270, _T_274) @[Mux.scala 98:16]
    node _T_276 = mux(_T_267, _T_268, _T_275) @[Mux.scala 98:16]
    node _T_266 = _T_276 @[id_stage.scala 222:24]
    node imm_ext = asUInt(_T_266) @[id_stage.scala 227:30]
    node _T_277 = eq(fwrd_reg1, UInt<1>("h1")) @[id_stage.scala 238:28]
    node _T_278 = eq(fwrd_reg1, UInt<2>("h2")) @[id_stage.scala 239:44]
    node _T_279 = mux(_T_278, io_mem2id_wd, io_rd1) @[Mux.scala 98:16]
    node _T_280 = mux(_T_277, io_exe2id_wd, _T_279) @[Mux.scala 98:16]
    node _T_281 = eq(fwrd_reg2, UInt<1>("h1")) @[id_stage.scala 243:32]
    node _T_282 = eq(fwrd_reg2, UInt<2>("h2")) @[id_stage.scala 244:44]
    node _T_283 = eq(imm_Itype, UInt<1>("h1")) @[id_stage.scala 245:32]
    node _T_284 = eq(imm_shamt, UInt<1>("h1")) @[id_stage.scala 245:53]
    node _T_285 = or(_T_283, _T_284) @[id_stage.scala 245:40]
    node _T_286 = eq(imm_Stype, UInt<1>("h1")) @[id_stage.scala 245:74]
    node _T_287 = or(_T_285, _T_286) @[id_stage.scala 245:61]
    node _T_288 = mux(_T_287, imm_ext, io_rd2) @[Mux.scala 98:16]
    node _T_289 = mux(_T_282, io_mem2id_wd, _T_288) @[Mux.scala 98:16]
    node _T_290 = mux(_T_281, io_exe2id_wd, _T_289) @[Mux.scala 98:16]
    io_id_alutype_o <= _T_113 @[id_stage.scala 125:25]
    io_id_aluop_o <= _T_167 @[id_stage.scala 128:23]
    io_id_wa_o <= rd @[id_stage.scala 231:20]
    io_id_wreg_o <= _T_190 @[id_stage.scala 163:19]
    io_id_mreg_o <= _T_205 @[id_stage.scala 184:18]
    io_id_din_o <= io_rd2 @[id_stage.scala 234:21]
    io_id_src1_o <= _T_280 @[id_stage.scala 237:22]
    io_id_src2_o <= _T_290 @[id_stage.scala 242:22]
    io_rreg1 <= _T_231 @[id_stage.scala 187:15]
    io_ra1 <= rs1 @[id_stage.scala 216:16]
    io_rreg2 <= _T_243 @[id_stage.scala 197:15]
    io_ra2 <= rs2 @[id_stage.scala 217:16]

  module idexe_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_id_alutype : UInt<3>
    input io_id_aluop : UInt<8>
    input io_id_src1 : UInt<32>
    input io_id_src2 : UInt<32>
    input io_id_wa : UInt<5>
    input io_id_wreg : UInt<1>
    input io_id_mreg : UInt<1>
    input io_id_din : UInt<32>
    output io_exe_alutype : UInt<3>
    output io_exe_aluop : UInt<8>
    output io_exe_src1 : UInt<32>
    output io_exe_src2 : UInt<32>
    output io_exe_wa : UInt<5>
    output io_exe_wreg : UInt<1>
    output io_exe_mreg : UInt<1>
    output io_exe_din : UInt<32>
  
    reg alutype_reg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), alutype_reg) @[idexe_reg.scala 34:30]
    reg aluop_reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), aluop_reg) @[idexe_reg.scala 38:32]
    reg src1_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), src1_reg) @[idexe_reg.scala 42:31]
    reg src2_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), src2_reg) @[idexe_reg.scala 46:31]
    reg wa_reg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), wa_reg) @[idexe_reg.scala 50:29]
    reg wreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wreg_reg) @[idexe_reg.scala 54:31]
    reg mreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), mreg_reg) @[idexe_reg.scala 58:31]
    reg din_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), din_reg) @[idexe_reg.scala 62:30]
    io_exe_alutype <= alutype_reg @[idexe_reg.scala 36:21]
    io_exe_aluop <= aluop_reg @[idexe_reg.scala 40:19]
    io_exe_src1 <= src1_reg @[idexe_reg.scala 44:18]
    io_exe_src2 <= src2_reg @[idexe_reg.scala 48:18]
    io_exe_wa <= wa_reg @[idexe_reg.scala 52:16]
    io_exe_wreg <= wreg_reg @[idexe_reg.scala 56:18]
    io_exe_mreg <= mreg_reg @[idexe_reg.scala 60:18]
    io_exe_din <= din_reg @[idexe_reg.scala 64:17]
    alutype_reg <= mux(reset, UInt<3>("h0"), io_id_alutype) @[idexe_reg.scala 35:21]
    aluop_reg <= mux(reset, UInt<8>("h0"), io_id_aluop) @[idexe_reg.scala 39:19]
    src1_reg <= mux(reset, UInt<32>("h0"), io_id_src1) @[idexe_reg.scala 43:18]
    src2_reg <= mux(reset, UInt<32>("h0"), io_id_src2) @[idexe_reg.scala 47:18]
    wa_reg <= mux(reset, UInt<5>("h0"), io_id_wa) @[idexe_reg.scala 51:16]
    wreg_reg <= mux(reset, UInt<1>("h0"), io_id_wreg) @[idexe_reg.scala 55:18]
    mreg_reg <= mux(reset, UInt<1>("h0"), io_id_mreg) @[idexe_reg.scala 59:18]
    din_reg <= mux(reset, UInt<32>("h0"), io_id_din) @[idexe_reg.scala 63:17]

  module exe_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_exe_alutype_i : UInt<3>
    input io_exe_aluop_i : UInt<8>
    input io_exe_src1_i : UInt<32>
    input io_exe_src2_i : UInt<32>
    input io_exe_wa_i : UInt<5>
    input io_exe_wreg_i : UInt<1>
    input io_exe_mreg_i : UInt<1>
    input io_exe_din_i : UInt<32>
    output io_exe_aluop_o : UInt<8>
    output io_exe_wa_o : UInt<5>
    output io_exe_wreg_o : UInt<1>
    output io_exe_wd_o : UInt<32>
    output io_exe_mreg_o : UInt<1>
    output io_exe_din_o : UInt<32>
  
    node andAns = and(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 51:32]
    node orAns = or(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 52:32]
    node xorAns = xor(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 53:32]
    node _T = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 54:32]
    node addAns = tail(_T, 1) @[exe_stage.scala 54:32]
    node _T_1 = sub(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 55:32]
    node subAns = tail(_T_1, 1) @[exe_stage.scala 55:32]
    node _T_2 = asSInt(io_exe_src1_i) @[exe_stage.scala 56:43]
    node _T_3 = asSInt(io_exe_src2_i) @[exe_stage.scala 56:68]
    node _T_4 = lt(_T_2, _T_3) @[exe_stage.scala 56:46]
    node sltAns = mux(_T_4, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 56:21]
    node _T_5 = lt(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 57:46]
    node sltuAns = mux(_T_5, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 57:21]
    node _T_6 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 58:49]
    node _T_7 = dshl(io_exe_src1_i, _T_6) @[exe_stage.scala 58:33]
    node sllAns = bits(_T_7, 31, 0) @[exe_stage.scala 58:55]
    node _T_8 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 59:49]
    node srlAns = dshr(io_exe_src1_i, _T_8) @[exe_stage.scala 59:33]
    node _T_9 = asSInt(io_exe_src1_i) @[exe_stage.scala 60:39]
    node _T_10 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 60:58]
    node _T_11 = dshr(_T_9, _T_10) @[exe_stage.scala 60:42]
    node sraAns = asUInt(_T_11) @[exe_stage.scala 60:71]
    node _T_12 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 63:32]
    node addiAns = tail(_T_12, 1) @[exe_stage.scala 63:32]
    node _T_13 = asSInt(io_exe_src1_i) @[exe_stage.scala 64:43]
    node _T_14 = asSInt(io_exe_src2_i) @[exe_stage.scala 64:68]
    node _T_15 = lt(_T_13, _T_14) @[exe_stage.scala 64:46]
    node sltiAns = mux(_T_15, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 64:21]
    node _T_16 = lt(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 65:46]
    node sltiuAns = mux(_T_16, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 65:21]
    node xoriAns = xor(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 66:32]
    node oriAns = or(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 67:32]
    node andiAns = and(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 68:32]
    node _T_17 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 70:49]
    node _T_18 = dshl(io_exe_src1_i, _T_17) @[exe_stage.scala 70:33]
    node slliAns = bits(_T_18, 31, 0) @[exe_stage.scala 70:55]
    node _T_19 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 71:49]
    node srliAns = dshr(io_exe_src1_i, _T_19) @[exe_stage.scala 71:33]
    node _T_20 = asSInt(io_exe_src1_i) @[exe_stage.scala 72:39]
    node _T_21 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 72:58]
    node _T_22 = dshr(_T_20, _T_21) @[exe_stage.scala 72:42]
    node sraiAns = asUInt(_T_22) @[exe_stage.scala 72:71]
    node _T_23 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 74:32]
    node lbAns = tail(_T_23, 1) @[exe_stage.scala 74:32]
    node _T_24 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 75:32]
    node lhAns = tail(_T_24, 1) @[exe_stage.scala 75:32]
    node _T_25 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 76:32]
    node lwAns = tail(_T_25, 1) @[exe_stage.scala 76:32]
    node _T_26 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 77:32]
    node lbuAns = tail(_T_26, 1) @[exe_stage.scala 77:32]
    node _T_27 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 78:32]
    node lhuAns = tail(_T_27, 1) @[exe_stage.scala 78:32]
    node _T_28 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 81:32]
    node sbAns = tail(_T_28, 1) @[exe_stage.scala 81:32]
    node _T_29 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 82:32]
    node shAns = tail(_T_29, 1) @[exe_stage.scala 82:32]
    node _T_30 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 83:32]
    node swAns = tail(_T_30, 1) @[exe_stage.scala 83:32]
    node _T_31 = eq(io_exe_aluop_i, UInt<4>("ha")) @[exe_stage.scala 89:24]
    node _T_32 = eq(io_exe_aluop_i, UInt<4>("h9")) @[exe_stage.scala 90:28]
    node _T_33 = eq(io_exe_aluop_i, UInt<3>("h6")) @[exe_stage.scala 91:28]
    node _T_34 = eq(io_exe_aluop_i, UInt<5>("h10")) @[exe_stage.scala 92:28]
    node _T_35 = eq(io_exe_aluop_i, UInt<4>("hf")) @[exe_stage.scala 93:28]
    node _T_36 = eq(io_exe_aluop_i, UInt<4>("he")) @[exe_stage.scala 94:28]
    node _T_37 = mux(_T_36, xoriAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_38 = mux(_T_35, oriAns, _T_37) @[Mux.scala 98:16]
    node _T_39 = mux(_T_34, andiAns, _T_38) @[Mux.scala 98:16]
    node _T_40 = mux(_T_33, xorAns, _T_39) @[Mux.scala 98:16]
    node _T_41 = mux(_T_32, orAns, _T_40) @[Mux.scala 98:16]
    node logicres = mux(_T_31, andAns, _T_41) @[Mux.scala 98:16]
    node _T_42 = eq(io_exe_aluop_i, UInt<2>("h3")) @[exe_stage.scala 99:24]
    node _T_43 = eq(io_exe_aluop_i, UInt<3>("h7")) @[exe_stage.scala 100:28]
    node _T_44 = eq(io_exe_aluop_i, UInt<4>("h8")) @[exe_stage.scala 101:28]
    node _T_45 = eq(io_exe_aluop_i, UInt<5>("h11")) @[exe_stage.scala 102:28]
    node _T_46 = eq(io_exe_aluop_i, UInt<5>("h12")) @[exe_stage.scala 103:28]
    node _T_47 = eq(io_exe_aluop_i, UInt<5>("h13")) @[exe_stage.scala 104:28]
    node _T_48 = mux(_T_47, sraiAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_49 = mux(_T_46, srliAns, _T_48) @[Mux.scala 98:16]
    node _T_50 = mux(_T_45, slliAns, _T_49) @[Mux.scala 98:16]
    node _T_51 = mux(_T_44, sraAns, _T_50) @[Mux.scala 98:16]
    node _T_52 = mux(_T_43, srlAns, _T_51) @[Mux.scala 98:16]
    node shiftres = mux(_T_42, sllAns, _T_52) @[Mux.scala 98:16]
    node _T_53 = eq(io_exe_aluop_i, UInt<1>("h1")) @[exe_stage.scala 109:24]
    node _T_54 = eq(io_exe_aluop_i, UInt<2>("h2")) @[exe_stage.scala 110:28]
    node _T_55 = eq(io_exe_aluop_i, UInt<3>("h4")) @[exe_stage.scala 111:28]
    node _T_56 = eq(io_exe_aluop_i, UInt<3>("h5")) @[exe_stage.scala 112:28]
    node _T_57 = eq(io_exe_aluop_i, UInt<4>("hb")) @[exe_stage.scala 113:28]
    node _T_58 = eq(io_exe_aluop_i, UInt<4>("hc")) @[exe_stage.scala 114:28]
    node _T_59 = eq(io_exe_aluop_i, UInt<4>("hd")) @[exe_stage.scala 115:28]
    node _T_60 = eq(io_exe_aluop_i, UInt<5>("h14")) @[exe_stage.scala 117:28]
    node _T_61 = eq(io_exe_aluop_i, UInt<5>("h15")) @[exe_stage.scala 118:28]
    node _T_62 = eq(io_exe_aluop_i, UInt<5>("h16")) @[exe_stage.scala 119:28]
    node _T_63 = eq(io_exe_aluop_i, UInt<5>("h17")) @[exe_stage.scala 120:28]
    node _T_64 = eq(io_exe_aluop_i, UInt<5>("h18")) @[exe_stage.scala 121:28]
    node _T_65 = eq(io_exe_aluop_i, UInt<5>("h19")) @[exe_stage.scala 122:28]
    node _T_66 = eq(io_exe_aluop_i, UInt<5>("h1a")) @[exe_stage.scala 123:28]
    node _T_67 = eq(io_exe_aluop_i, UInt<5>("h1b")) @[exe_stage.scala 124:28]
    node _T_68 = mux(_T_67, swAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_69 = mux(_T_66, shAns, _T_68) @[Mux.scala 98:16]
    node _T_70 = mux(_T_65, sbAns, _T_69) @[Mux.scala 98:16]
    node _T_71 = mux(_T_64, lhuAns, _T_70) @[Mux.scala 98:16]
    node _T_72 = mux(_T_63, lbuAns, _T_71) @[Mux.scala 98:16]
    node _T_73 = mux(_T_62, lwAns, _T_72) @[Mux.scala 98:16]
    node _T_74 = mux(_T_61, lhAns, _T_73) @[Mux.scala 98:16]
    node _T_75 = mux(_T_60, lbAns, _T_74) @[Mux.scala 98:16]
    node _T_76 = mux(_T_59, sltiuAns, _T_75) @[Mux.scala 98:16]
    node _T_77 = mux(_T_58, sltiAns, _T_76) @[Mux.scala 98:16]
    node _T_78 = mux(_T_57, addiAns, _T_77) @[Mux.scala 98:16]
    node _T_79 = mux(_T_56, sltuAns, _T_78) @[Mux.scala 98:16]
    node _T_80 = mux(_T_55, sltAns, _T_79) @[Mux.scala 98:16]
    node _T_81 = mux(_T_54, subAns, _T_80) @[Mux.scala 98:16]
    node arithres = mux(_T_53, addAns, _T_81) @[Mux.scala 98:16]
    node _T_82 = eq(io_exe_alutype_i, UInt<1>("h1")) @[exe_stage.scala 130:28]
    node _T_83 = eq(io_exe_alutype_i, UInt<2>("h2")) @[exe_stage.scala 131:28]
    node _T_84 = eq(io_exe_alutype_i, UInt<3>("h4")) @[exe_stage.scala 133:24]
    node _T_85 = mux(_T_84, shiftres, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_86 = mux(_T_83, logicres, _T_85) @[Mux.scala 98:16]
    node _T_87 = mux(_T_82, arithres, _T_86) @[Mux.scala 98:16]
    io_exe_aluop_o <= io_exe_aluop_i @[exe_stage.scala 40:18]
    io_exe_wa_o <= io_exe_wa_i @[exe_stage.scala 44:17]
    io_exe_wreg_o <= io_exe_wreg_i @[exe_stage.scala 45:17]
    io_exe_wd_o <= _T_87 @[exe_stage.scala 129:15]
    io_exe_mreg_o <= io_exe_mreg_i @[exe_stage.scala 41:18]
    io_exe_din_o <= io_exe_din_i @[exe_stage.scala 42:18]

  module exemem_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_exe_aluop : UInt<8>
    input io_exe_wa : UInt<5>
    input io_exe_wreg : UInt<1>
    input io_exe_wd : UInt<32>
    input io_exe_mreg : UInt<1>
    input io_exe_din : UInt<32>
    output io_mem_aluop : UInt<8>
    output io_mem_wa : UInt<5>
    output io_mem_wreg : UInt<1>
    output io_mem_wd : UInt<32>
    output io_mem_mreg : UInt<1>
    output io_mem_din : UInt<32>
  
    reg aluop_reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), aluop_reg) @[exemem_reg.scala 33:29]
    reg wa_reg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), wa_reg) @[exemem_reg.scala 37:30]
    reg wreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wreg_reg) @[exemem_reg.scala 41:32]
    reg wd_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), wd_reg) @[exemem_reg.scala 45:30]
    reg mreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), mreg_reg) @[exemem_reg.scala 49:32]
    reg din_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), din_reg) @[exemem_reg.scala 53:31]
    io_mem_aluop <= aluop_reg @[exemem_reg.scala 35:19]
    io_mem_wa <= wa_reg @[exemem_reg.scala 39:16]
    io_mem_wreg <= wreg_reg @[exemem_reg.scala 43:18]
    io_mem_wd <= wd_reg @[exemem_reg.scala 47:16]
    io_mem_mreg <= mreg_reg @[exemem_reg.scala 51:18]
    io_mem_din <= din_reg @[exemem_reg.scala 55:17]
    aluop_reg <= mux(reset, UInt<8>("h0"), io_exe_aluop) @[exemem_reg.scala 34:19]
    wa_reg <= mux(reset, UInt<5>("h0"), io_exe_wa) @[exemem_reg.scala 38:16]
    wreg_reg <= mux(reset, UInt<1>("h0"), io_exe_wreg) @[exemem_reg.scala 42:18]
    wd_reg <= mux(reset, UInt<32>("h0"), io_exe_wd) @[exemem_reg.scala 46:16]
    mreg_reg <= mux(reset, UInt<1>("h0"), io_exe_mreg) @[exemem_reg.scala 50:18]
    din_reg <= mux(reset, UInt<32>("h0"), io_exe_din) @[exemem_reg.scala 54:17]

  module mem_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_aluop_i : UInt<8>
    input io_mem_wa_i : UInt<5>
    input io_mem_wreg_i : UInt<1>
    input io_mem_wd_i : UInt<32>
    input io_mem_mreg_i : UInt<1>
    input io_mem_din_i : UInt<32>
    output io_mem_wa_o : UInt<5>
    output io_mem_wreg_o : UInt<1>
    output io_mem_dreg_o : UInt<32>
    output io_mem_mreg_o : UInt<1>
    output io_dre : UInt<4>
    output io_load_unsign : UInt<1>
    output io_dce : UInt<1>
    output io_daddr : UInt<32>
    output io_dwe : UInt<4>
    output io_din : UInt<32>
  
    node inst_lb = eq(io_mem_aluop_i, UInt<5>("h14")) @[mem_stage.scala 46:39]
    node inst_lh = eq(io_mem_aluop_i, UInt<5>("h15")) @[mem_stage.scala 47:39]
    node inst_lw = eq(io_mem_aluop_i, UInt<5>("h16")) @[mem_stage.scala 48:39]
    node inst_lbu = eq(io_mem_aluop_i, UInt<5>("h17")) @[mem_stage.scala 49:39]
    node inst_lhu = eq(io_mem_aluop_i, UInt<5>("h18")) @[mem_stage.scala 50:39]
    node inst_sb = eq(io_mem_aluop_i, UInt<5>("h19")) @[mem_stage.scala 51:39]
    node inst_sh = eq(io_mem_aluop_i, UInt<5>("h1a")) @[mem_stage.scala 52:39]
    node inst_sw = eq(io_mem_aluop_i, UInt<5>("h1b")) @[mem_stage.scala 53:39]
    node _T = or(inst_lb, inst_lh) @[mem_stage.scala 56:28]
    node _T_1 = or(_T, inst_lw) @[mem_stage.scala 56:40]
    node _T_2 = or(_T_1, inst_lbu) @[mem_stage.scala 56:52]
    node _T_3 = or(_T_2, inst_lhu) @[mem_stage.scala 56:64]
    node _T_4 = or(_T_3, inst_sb) @[mem_stage.scala 56:75]
    node _T_5 = or(_T_4, inst_sh) @[mem_stage.scala 57:28]
    node _T_6 = or(_T_5, inst_sw) @[mem_stage.scala 57:40]
    node _T_7 = or(inst_lb, inst_lbu) @[mem_stage.scala 65:34]
    node _T_8 = bits(io_daddr, 1, 0) @[mem_stage.scala 65:57]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[mem_stage.scala 65:63]
    node _T_10 = and(_T_7, _T_9) @[mem_stage.scala 65:46]
    node _T_11 = or(inst_lh, inst_lhu) @[mem_stage.scala 66:34]
    node _T_12 = bits(io_daddr, 1, 0) @[mem_stage.scala 66:57]
    node _T_13 = eq(_T_12, UInt<1>("h0")) @[mem_stage.scala 66:63]
    node _T_14 = and(_T_11, _T_13) @[mem_stage.scala 66:46]
    node _T_15 = or(_T_10, _T_14) @[mem_stage.scala 65:77]
    node _T_16 = or(_T_15, inst_lw) @[mem_stage.scala 66:77]
    node _T_17 = or(inst_lb, inst_lbu) @[mem_stage.scala 69:30]
    node _T_18 = bits(io_daddr, 1, 0) @[mem_stage.scala 69:53]
    node _T_19 = eq(_T_18, UInt<1>("h1")) @[mem_stage.scala 69:59]
    node _T_20 = and(_T_17, _T_19) @[mem_stage.scala 69:42]
    node _T_21 = or(inst_lh, inst_lhu) @[mem_stage.scala 70:30]
    node _T_22 = bits(io_daddr, 1, 0) @[mem_stage.scala 70:53]
    node _T_23 = eq(_T_22, UInt<1>("h0")) @[mem_stage.scala 70:59]
    node _T_24 = and(_T_21, _T_23) @[mem_stage.scala 70:42]
    node _T_25 = or(_T_20, _T_24) @[mem_stage.scala 69:73]
    node _T_26 = or(_T_25, inst_lw) @[mem_stage.scala 70:73]
    node _T_27 = or(inst_lb, inst_lbu) @[mem_stage.scala 73:34]
    node _T_28 = bits(io_daddr, 1, 0) @[mem_stage.scala 73:57]
    node _T_29 = eq(_T_28, UInt<2>("h2")) @[mem_stage.scala 73:63]
    node _T_30 = and(_T_27, _T_29) @[mem_stage.scala 73:46]
    node _T_31 = or(inst_lh, inst_lhu) @[mem_stage.scala 74:34]
    node _T_32 = bits(io_daddr, 1, 0) @[mem_stage.scala 74:57]
    node _T_33 = eq(_T_32, UInt<2>("h2")) @[mem_stage.scala 74:63]
    node _T_34 = and(_T_31, _T_33) @[mem_stage.scala 74:46]
    node _T_35 = or(_T_30, _T_34) @[mem_stage.scala 73:77]
    node _T_36 = or(_T_35, inst_lw) @[mem_stage.scala 74:77]
    node _T_37 = or(inst_lb, inst_lbu) @[mem_stage.scala 76:34]
    node _T_38 = bits(io_daddr, 1, 0) @[mem_stage.scala 76:57]
    node _T_39 = eq(_T_38, UInt<2>("h3")) @[mem_stage.scala 76:63]
    node _T_40 = and(_T_37, _T_39) @[mem_stage.scala 76:46]
    node _T_41 = or(inst_lh, inst_lhu) @[mem_stage.scala 77:34]
    node _T_42 = bits(io_daddr, 1, 0) @[mem_stage.scala 77:57]
    node _T_43 = eq(_T_42, UInt<2>("h2")) @[mem_stage.scala 77:63]
    node _T_44 = and(_T_41, _T_43) @[mem_stage.scala 77:46]
    node _T_45 = or(_T_40, _T_44) @[mem_stage.scala 76:77]
    node _T_46 = or(_T_45, inst_lw) @[mem_stage.scala 77:77]
    node dre_temp_1 = _T_36 @[mem_stage.scala 63:28 mem_stage.scala 73:21]
    node dre_temp_0 = _T_46 @[mem_stage.scala 63:28 mem_stage.scala 76:21]
    node _T_47 = cat(dre_temp_1, dre_temp_0) @[mem_stage.scala 80:28]
    node dre_temp_3 = _T_16 @[mem_stage.scala 63:28 mem_stage.scala 65:21]
    node dre_temp_2 = _T_26 @[mem_stage.scala 63:28 mem_stage.scala 69:17]
    node _T_48 = cat(dre_temp_3, dre_temp_2) @[mem_stage.scala 80:28]
    node _T_49 = cat(_T_48, _T_47) @[mem_stage.scala 80:28]
    node _T_50 = or(inst_lbu, inst_lhu) @[mem_stage.scala 83:36]
    node _T_51 = bits(io_daddr, 1, 0) @[mem_stage.scala 88:44]
    node _T_52 = eq(_T_51, UInt<1>("h0")) @[mem_stage.scala 88:50]
    node _T_53 = and(inst_sb, _T_52) @[mem_stage.scala 88:33]
    node _T_54 = bits(io_daddr, 1, 0) @[mem_stage.scala 89:44]
    node _T_55 = eq(_T_54, UInt<1>("h0")) @[mem_stage.scala 89:50]
    node _T_56 = and(inst_sh, _T_55) @[mem_stage.scala 89:33]
    node _T_57 = or(_T_53, _T_56) @[mem_stage.scala 88:64]
    node _T_58 = or(_T_57, inst_sw) @[mem_stage.scala 89:64]
    node _T_59 = bits(io_daddr, 1, 0) @[mem_stage.scala 92:40]
    node _T_60 = eq(_T_59, UInt<1>("h1")) @[mem_stage.scala 92:46]
    node _T_61 = and(inst_sb, _T_60) @[mem_stage.scala 92:29]
    node _T_62 = bits(io_daddr, 1, 0) @[mem_stage.scala 93:40]
    node _T_63 = eq(_T_62, UInt<1>("h0")) @[mem_stage.scala 93:46]
    node _T_64 = and(inst_sh, _T_63) @[mem_stage.scala 93:29]
    node _T_65 = or(_T_61, _T_64) @[mem_stage.scala 92:60]
    node _T_66 = or(_T_65, inst_sw) @[mem_stage.scala 93:60]
    node _T_67 = bits(io_daddr, 1, 0) @[mem_stage.scala 96:44]
    node _T_68 = eq(_T_67, UInt<2>("h2")) @[mem_stage.scala 96:50]
    node _T_69 = and(inst_sb, _T_68) @[mem_stage.scala 96:33]
    node _T_70 = bits(io_daddr, 1, 0) @[mem_stage.scala 97:44]
    node _T_71 = eq(_T_70, UInt<2>("h2")) @[mem_stage.scala 97:50]
    node _T_72 = and(inst_sh, _T_71) @[mem_stage.scala 97:33]
    node _T_73 = or(_T_69, _T_72) @[mem_stage.scala 96:64]
    node _T_74 = or(_T_73, inst_sw) @[mem_stage.scala 97:64]
    node _T_75 = bits(io_daddr, 1, 0) @[mem_stage.scala 99:44]
    node _T_76 = eq(_T_75, UInt<2>("h3")) @[mem_stage.scala 99:50]
    node _T_77 = and(inst_sb, _T_76) @[mem_stage.scala 99:33]
    node _T_78 = bits(io_daddr, 1, 0) @[mem_stage.scala 100:44]
    node _T_79 = eq(_T_78, UInt<2>("h2")) @[mem_stage.scala 100:50]
    node _T_80 = and(inst_sh, _T_79) @[mem_stage.scala 100:33]
    node _T_81 = or(_T_77, _T_80) @[mem_stage.scala 99:64]
    node _T_82 = or(_T_81, inst_sw) @[mem_stage.scala 100:64]
    node dwe_temp_1 = _T_74 @[mem_stage.scala 86:28 mem_stage.scala 96:21]
    node dwe_temp_0 = _T_82 @[mem_stage.scala 86:28 mem_stage.scala 99:21]
    node _T_83 = cat(dwe_temp_1, dwe_temp_0) @[mem_stage.scala 103:28]
    node dwe_temp_3 = _T_58 @[mem_stage.scala 86:28 mem_stage.scala 88:21]
    node dwe_temp_2 = _T_66 @[mem_stage.scala 86:28 mem_stage.scala 92:17]
    node _T_84 = cat(dwe_temp_3, dwe_temp_2) @[mem_stage.scala 103:28]
    node _T_85 = cat(_T_84, _T_83) @[mem_stage.scala 103:28]
    node _T_86 = eq(io_dwe, UInt<4>("hf")) @[mem_stage.scala 107:21]
    node _T_87 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 107:55]
    node _T_88 = bits(io_mem_din_i, 15, 8) @[mem_stage.scala 107:74]
    node _T_89 = bits(io_mem_din_i, 23, 16) @[mem_stage.scala 107:93]
    node _T_90 = bits(io_mem_din_i, 31, 24) @[mem_stage.scala 107:113]
    node _T_91 = cat(_T_89, _T_90) @[Cat.scala 30:58]
    node _T_92 = cat(_T_87, _T_88) @[Cat.scala 30:58]
    node _T_93 = cat(_T_92, _T_91) @[Cat.scala 30:58]
    node _T_94 = eq(io_dwe, UInt<4>("h8")) @[mem_stage.scala 108:25]
    node _T_95 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 108:59]
    node _T_96 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 108:78]
    node _T_97 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 108:97]
    node _T_98 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 108:117]
    node _T_99 = cat(_T_97, _T_98) @[Cat.scala 30:58]
    node _T_100 = cat(_T_95, _T_96) @[Cat.scala 30:58]
    node _T_101 = cat(_T_100, _T_99) @[Cat.scala 30:58]
    node _T_102 = eq(io_dwe, UInt<3>("h4")) @[mem_stage.scala 109:25]
    node _T_103 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 109:59]
    node _T_104 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 109:78]
    node _T_105 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 109:97]
    node _T_106 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 109:117]
    node _T_107 = cat(_T_105, _T_106) @[Cat.scala 30:58]
    node _T_108 = cat(_T_103, _T_104) @[Cat.scala 30:58]
    node _T_109 = cat(_T_108, _T_107) @[Cat.scala 30:58]
    node _T_110 = eq(io_dwe, UInt<2>("h2")) @[mem_stage.scala 110:25]
    node _T_111 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 110:59]
    node _T_112 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 110:78]
    node _T_113 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 110:97]
    node _T_114 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 110:117]
    node _T_115 = cat(_T_113, _T_114) @[Cat.scala 30:58]
    node _T_116 = cat(_T_111, _T_112) @[Cat.scala 30:58]
    node _T_117 = cat(_T_116, _T_115) @[Cat.scala 30:58]
    node _T_118 = eq(io_dwe, UInt<1>("h1")) @[mem_stage.scala 111:25]
    node _T_119 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 111:59]
    node _T_120 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 111:78]
    node _T_121 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 111:97]
    node _T_122 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 111:117]
    node _T_123 = cat(_T_121, _T_122) @[Cat.scala 30:58]
    node _T_124 = cat(_T_119, _T_120) @[Cat.scala 30:58]
    node _T_125 = cat(_T_124, _T_123) @[Cat.scala 30:58]
    node _T_126 = eq(io_dwe, UInt<4>("hc")) @[mem_stage.scala 112:25]
    node _T_127 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 112:63]
    node _T_128 = bits(io_mem_din_i, 15, 8) @[mem_stage.scala 112:81]
    node _T_129 = cat(_T_127, _T_128) @[Cat.scala 30:58]
    node _T_130 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 112:105]
    node _T_131 = bits(io_mem_din_i, 15, 8) @[mem_stage.scala 112:123]
    node _T_132 = cat(_T_130, _T_131) @[Cat.scala 30:58]
    node _T_133 = cat(_T_129, _T_132) @[Cat.scala 30:58]
    node _T_134 = eq(io_dwe, UInt<2>("h3")) @[mem_stage.scala 113:25]
    node _T_135 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 113:63]
    node _T_136 = bits(io_mem_din_i, 15, 8) @[mem_stage.scala 113:81]
    node _T_137 = cat(_T_135, _T_136) @[Cat.scala 30:58]
    node _T_138 = bits(io_mem_din_i, 7, 0) @[mem_stage.scala 113:105]
    node _T_139 = bits(io_mem_din_i, 15, 8) @[mem_stage.scala 113:123]
    node _T_140 = cat(_T_138, _T_139) @[Cat.scala 30:58]
    node _T_141 = cat(_T_137, _T_140) @[Cat.scala 30:58]
    node _T_142 = mux(_T_134, _T_141, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_143 = mux(_T_126, _T_133, _T_142) @[Mux.scala 98:16]
    node _T_144 = mux(_T_118, _T_125, _T_143) @[Mux.scala 98:16]
    node _T_145 = mux(_T_110, _T_117, _T_144) @[Mux.scala 98:16]
    node _T_146 = mux(_T_102, _T_109, _T_145) @[Mux.scala 98:16]
    node _T_147 = mux(_T_94, _T_101, _T_146) @[Mux.scala 98:16]
    node _T_148 = mux(_T_86, _T_93, _T_147) @[Mux.scala 98:16]
    io_mem_wa_o <= io_mem_wa_i @[mem_stage.scala 40:20]
    io_mem_wreg_o <= io_mem_wreg_i @[mem_stage.scala 41:24]
    io_mem_dreg_o <= io_mem_wd_i @[mem_stage.scala 42:24]
    io_mem_mreg_o <= io_mem_mreg_i @[mem_stage.scala 43:24]
    io_dre <= _T_49 @[mem_stage.scala 80:16]
    io_load_unsign <= _T_50 @[mem_stage.scala 83:24]
    io_dce <= _T_6 @[mem_stage.scala 56:16]
    io_daddr <= io_mem_wd_i @[mem_stage.scala 60:14]
    io_dwe <= _T_85 @[mem_stage.scala 103:16]
    io_din <= _T_148 @[mem_stage.scala 106:16]

  module memwb_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_wa : UInt<5>
    input io_mem_wreg : UInt<1>
    input io_mem_dreg : UInt<32>
    input io_mem_mreg : UInt<1>
    input io_mem_dre : UInt<4>
    input io_mem_load_unsign : UInt<1>
    output io_wb_wa : UInt<5>
    output io_wb_wreg : UInt<1>
    output io_wb_dreg : UInt<32>
    output io_wb_mreg : UInt<1>
    output io_wb_dre : UInt<4>
    output io_wb_load_unsign : UInt<1>
  
    reg wa_reg : UInt<5>, clock with :
      reset => (UInt<1>("h0"), wa_reg) @[memwb_reg.scala 31:30]
    reg wreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wreg_reg) @[memwb_reg.scala 35:32]
    reg dreg_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), dreg_reg) @[memwb_reg.scala 39:32]
    reg mreg_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), mreg_reg) @[memwb_reg.scala 43:32]
    reg dre_reg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), dre_reg) @[memwb_reg.scala 47:27]
    reg unsign_reg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), unsign_reg) @[memwb_reg.scala 51:34]
    io_wb_wa <= wa_reg @[memwb_reg.scala 33:16]
    io_wb_wreg <= wreg_reg @[memwb_reg.scala 37:17]
    io_wb_dreg <= dreg_reg @[memwb_reg.scala 41:18]
    io_wb_mreg <= mreg_reg @[memwb_reg.scala 45:18]
    io_wb_dre <= dre_reg @[memwb_reg.scala 49:18]
    io_wb_load_unsign <= unsign_reg @[memwb_reg.scala 53:23]
    wa_reg <= mux(reset, UInt<5>("h0"), io_mem_wa) @[memwb_reg.scala 32:16]
    wreg_reg <= mux(reset, UInt<1>("h0"), io_mem_wreg) @[memwb_reg.scala 36:17]
    dreg_reg <= mux(reset, UInt<32>("h0"), io_mem_dreg) @[memwb_reg.scala 40:18]
    mreg_reg <= mux(reset, UInt<1>("h0"), io_mem_mreg) @[memwb_reg.scala 44:18]
    dre_reg <= mux(reset, UInt<4>("h0"), io_mem_dre) @[memwb_reg.scala 48:18]
    unsign_reg <= mux(reset, UInt<1>("h0"), io_mem_load_unsign) @[memwb_reg.scala 52:18]

  module wb_stage :
    input clock : Clock
    input reset : UInt<1>
    input io_wb_wa_i : UInt<5>
    input io_wb_wreg_i : UInt<1>
    input io_wb_dreg_i : UInt<32>
    input io_wb_mreg_i : UInt<1>
    input io_wb_dre_i : UInt<4>
    input io_wb_load_unsign : UInt<1>
    input io_dm : UInt<32>
    output io_wb_wa_o : UInt<5>
    output io_wb_wreg_o : UInt<1>
    output io_wb_wd_o : UInt<32>
  
    node _T = eq(io_wb_load_unsign, UInt<1>("h1")) @[wb_stage.scala 51:32]
    node _T_2 = eq(io_wb_dre_i, UInt<4>("h8")) @[wb_stage.scala 55:30]
    node _T_3 = bits(io_dm, 31, 24) @[wb_stage.scala 55:53]
    node _T_4 = eq(io_wb_dre_i, UInt<3>("h4")) @[wb_stage.scala 56:30]
    node _T_5 = bits(io_dm, 23, 16) @[wb_stage.scala 56:53]
    node _T_6 = eq(io_wb_dre_i, UInt<2>("h2")) @[wb_stage.scala 57:30]
    node _T_7 = bits(io_dm, 15, 8) @[wb_stage.scala 57:53]
    node _T_8 = eq(io_wb_dre_i, UInt<1>("h1")) @[wb_stage.scala 58:30]
    node _T_9 = bits(io_dm, 7, 0) @[wb_stage.scala 58:53]
    node _T_10 = eq(io_wb_dre_i, UInt<4>("hc")) @[wb_stage.scala 59:30]
    node _T_11 = bits(io_dm, 23, 16) @[wb_stage.scala 59:57]
    node _T_12 = bits(io_dm, 31, 24) @[wb_stage.scala 59:70]
    node _T_13 = cat(_T_11, _T_12) @[Cat.scala 30:58]
    node _T_14 = eq(io_wb_dre_i, UInt<2>("h3")) @[wb_stage.scala 60:30]
    node _T_15 = bits(io_dm, 7, 0) @[wb_stage.scala 60:57]
    node _T_16 = bits(io_dm, 15, 8) @[wb_stage.scala 60:68]
    node _T_17 = cat(_T_15, _T_16) @[Cat.scala 30:58]
    node _T_18 = mux(_T_14, _T_17, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_19 = mux(_T_10, _T_13, _T_18) @[Mux.scala 98:16]
    node _T_20 = mux(_T_8, _T_9, _T_19) @[Mux.scala 98:16]
    node _T_21 = mux(_T_6, _T_7, _T_20) @[Mux.scala 98:16]
    node _T_22 = mux(_T_4, _T_5, _T_21) @[Mux.scala 98:16]
    node _T_23 = mux(_T_2, _T_3, _T_22) @[Mux.scala 98:16]
    node _T_25 = eq(io_wb_dre_i, UInt<4>("hf")) @[wb_stage.scala 67:30]
    node _T_26 = bits(io_dm, 7, 0) @[wb_stage.scala 67:57]
    node _T_27 = bits(io_dm, 15, 8) @[wb_stage.scala 67:68]
    node _T_28 = bits(io_dm, 23, 16) @[wb_stage.scala 67:80]
    node _T_29 = bits(io_dm, 31, 24) @[wb_stage.scala 67:93]
    node _T_30 = cat(_T_28, _T_29) @[Cat.scala 30:58]
    node _T_31 = cat(_T_26, _T_27) @[Cat.scala 30:58]
    node _T_32 = cat(_T_31, _T_30) @[Cat.scala 30:58]
    node _T_33 = asSInt(_T_32) @[wb_stage.scala 67:108]
    node _T_34 = eq(io_wb_dre_i, UInt<4>("h8")) @[wb_stage.scala 68:30]
    node _T_35 = bits(io_dm, 31, 24) @[wb_stage.scala 68:53]
    node _T_36 = asSInt(_T_35) @[wb_stage.scala 68:67]
    node _T_37 = eq(io_wb_dre_i, UInt<3>("h4")) @[wb_stage.scala 69:30]
    node _T_38 = bits(io_dm, 23, 16) @[wb_stage.scala 69:53]
    node _T_39 = asSInt(_T_38) @[wb_stage.scala 69:67]
    node _T_40 = eq(io_wb_dre_i, UInt<2>("h2")) @[wb_stage.scala 70:30]
    node _T_41 = bits(io_dm, 15, 8) @[wb_stage.scala 70:53]
    node _T_42 = asSInt(_T_41) @[wb_stage.scala 70:67]
    node _T_43 = eq(io_wb_dre_i, UInt<1>("h1")) @[wb_stage.scala 71:30]
    node _T_44 = bits(io_dm, 7, 0) @[wb_stage.scala 71:53]
    node _T_45 = asSInt(_T_44) @[wb_stage.scala 71:67]
    node _T_46 = eq(io_wb_dre_i, UInt<4>("hc")) @[wb_stage.scala 72:26]
    node _T_47 = bits(io_dm, 23, 16) @[wb_stage.scala 72:53]
    node _T_48 = bits(io_dm, 31, 24) @[wb_stage.scala 72:66]
    node _T_49 = cat(_T_47, _T_48) @[Cat.scala 30:58]
    node _T_50 = asSInt(_T_49) @[wb_stage.scala 72:81]
    node _T_51 = eq(io_wb_dre_i, UInt<2>("h3")) @[wb_stage.scala 73:26]
    node _T_52 = bits(io_dm, 7, 0) @[wb_stage.scala 73:53]
    node _T_53 = bits(io_dm, 15, 8) @[wb_stage.scala 73:64]
    node _T_54 = cat(_T_52, _T_53) @[Cat.scala 30:58]
    node _T_55 = asSInt(_T_54) @[wb_stage.scala 73:78]
    node _T_56 = mux(_T_51, _T_55, asSInt(UInt<1>("h0"))) @[Mux.scala 98:16]
    node _T_57 = mux(_T_46, _T_50, _T_56) @[Mux.scala 98:16]
    node _T_58 = mux(_T_43, _T_45, _T_57) @[Mux.scala 98:16]
    node _T_59 = mux(_T_40, _T_42, _T_58) @[Mux.scala 98:16]
    node _T_60 = mux(_T_37, _T_39, _T_59) @[Mux.scala 98:16]
    node _T_61 = mux(_T_34, _T_36, _T_60) @[Mux.scala 98:16]
    node _T_62 = mux(_T_25, _T_33, _T_61) @[Mux.scala 98:16]
    node _T_24 = _T_62 @[wb_stage.scala 66:22]
    node _T_63 = asUInt(_T_24) @[wb_stage.scala 75:36]
    node _T_1 = pad(_T_23, 32) @[wb_stage.scala 54:25]
    node _GEN_0 = mux(_T, _T_1, _T_63) @[wb_stage.scala 51:40]
    node _T_64 = eq(io_wb_mreg_i, UInt<1>("h1")) @[wb_stage.scala 78:41]
    node data = _GEN_0 @[wb_stage.scala 62:14 wb_stage.scala 75:14]
    node _T_65 = mux(_T_64, data, io_wb_dreg_i) @[wb_stage.scala 78:26]
    io_wb_wa_o <= io_wb_wa_i @[wb_stage.scala 34:23]
    io_wb_wreg_o <= io_wb_wreg_i @[wb_stage.scala 35:23]
    io_wb_wd_o <= _T_65 @[wb_stage.scala 78:20]

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
    input io_dm : UInt<32>
    output io_daddr : UInt<32>
    output io_dce : UInt<1>
    output io_we : UInt<4>
    output io_din : UInt<32>
    output io_exe_aluop_o : UInt<8>
    output io_exe_wa_o : UInt<5>
    output io_exe_wreg_o : UInt<1>
    output io_exe_wd_o : UInt<32>
    output io_id_pc : UInt<32>
  
    inst if_stage of if_stage @[myc01_core.scala 32:32]
    inst ifid_reg of ifid_reg @[myc01_core.scala 33:32]
    inst id_stage of id_stage @[myc01_core.scala 34:32]
    inst idexe_reg of idexe_reg @[myc01_core.scala 35:32]
    inst exe_stage of exe_stage @[myc01_core.scala 36:32]
    inst exemem_reg of exemem_reg @[myc01_core.scala 37:32]
    inst mem_stage of mem_stage @[myc01_core.scala 38:32]
    inst memwb_reg of memwb_reg @[myc01_core.scala 39:32]
    inst wb_stage of wb_stage @[myc01_core.scala 40:32]
    inst regfile of regfile @[myc01_core.scala 41:32]
    io_iaddr <= if_stage.io_iaddr @[myc01_core.scala 128:18]
    io_ice <= if_stage.io_ice @[myc01_core.scala 127:18]
    io_daddr <= mem_stage.io_daddr @[myc01_core.scala 134:14]
    io_dce <= mem_stage.io_dce @[myc01_core.scala 135:18]
    io_we <= mem_stage.io_dwe @[myc01_core.scala 136:18]
    io_din <= mem_stage.io_din @[myc01_core.scala 137:18]
    io_exe_aluop_o <= exe_stage.io_exe_aluop_o @[myc01_core.scala 142:23]
    io_exe_wa_o <= exe_stage.io_exe_wa_o @[myc01_core.scala 143:19]
    io_exe_wreg_o <= exe_stage.io_exe_wreg_o @[myc01_core.scala 144:19]
    io_exe_wd_o <= exe_stage.io_exe_wd_o @[myc01_core.scala 145:19]
    io_id_pc <= ifid_reg.io_id_pc @[myc01_core.scala 146:23]
    if_stage.clock <= clock
    if_stage.reset <= reset
    ifid_reg.clock <= clock
    ifid_reg.reset <= reset
    ifid_reg.io_if_pc <= if_stage.io_pc @[myc01_core.scala 44:27]
    id_stage.clock <= clock
    id_stage.reset <= reset
    id_stage.io_id_pc_i <= ifid_reg.io_id_pc @[myc01_core.scala 47:25]
    id_stage.io_id_inst_i <= io_inst @[myc01_core.scala 131:31]
    id_stage.io_rd1 <= regfile.io_rd1 @[myc01_core.scala 74:25]
    id_stage.io_rd2 <= regfile.io_rd2 @[myc01_core.scala 75:25]
    id_stage.io_exe2id_wreg <= exe_stage.io_exe_wreg_o @[myc01_core.scala 50:30]
    id_stage.io_exe2id_wa <= exe_stage.io_exe_wa_o @[myc01_core.scala 51:34]
    id_stage.io_exe2id_wd <= exe_stage.io_exe_wd_o @[myc01_core.scala 52:34]
    id_stage.io_mem2id_wreg <= mem_stage.io_mem_wreg_o @[myc01_core.scala 53:34]
    id_stage.io_mem2id_wa <= mem_stage.io_mem_wa_o @[myc01_core.scala 54:34]
    id_stage.io_mem2id_wd <= mem_stage.io_mem_dreg_o @[myc01_core.scala 55:34]
    idexe_reg.clock <= clock
    idexe_reg.reset <= reset
    idexe_reg.io_id_alutype <= id_stage.io_id_alutype_o @[myc01_core.scala 59:29]
    idexe_reg.io_id_aluop <= id_stage.io_id_aluop_o @[myc01_core.scala 60:29]
    idexe_reg.io_id_src1 <= id_stage.io_id_src1_o @[myc01_core.scala 61:29]
    idexe_reg.io_id_src2 <= id_stage.io_id_src2_o @[myc01_core.scala 62:29]
    idexe_reg.io_id_wa <= id_stage.io_id_wa_o @[myc01_core.scala 63:29]
    idexe_reg.io_id_wreg <= id_stage.io_id_wreg_o @[myc01_core.scala 64:29]
    idexe_reg.io_id_mreg <= id_stage.io_id_mreg_o @[myc01_core.scala 65:33]
    idexe_reg.io_id_din <= id_stage.io_id_din_o @[myc01_core.scala 66:33]
    exe_stage.clock <= clock
    exe_stage.reset <= reset
    exe_stage.io_exe_alutype_i <= idexe_reg.io_exe_alutype @[myc01_core.scala 78:32]
    exe_stage.io_exe_aluop_i <= idexe_reg.io_exe_aluop @[myc01_core.scala 79:32]
    exe_stage.io_exe_src1_i <= idexe_reg.io_exe_src1 @[myc01_core.scala 80:32]
    exe_stage.io_exe_src2_i <= idexe_reg.io_exe_src2 @[myc01_core.scala 81:32]
    exe_stage.io_exe_wa_i <= idexe_reg.io_exe_wa @[myc01_core.scala 82:32]
    exe_stage.io_exe_wreg_i <= idexe_reg.io_exe_wreg @[myc01_core.scala 83:32]
    exe_stage.io_exe_mreg_i <= idexe_reg.io_exe_mreg @[myc01_core.scala 84:36]
    exe_stage.io_exe_din_i <= idexe_reg.io_exe_din @[myc01_core.scala 85:36]
    exemem_reg.clock <= clock
    exemem_reg.reset <= reset
    exemem_reg.io_exe_aluop <= exe_stage.io_exe_aluop_o @[myc01_core.scala 88:29]
    exemem_reg.io_exe_wa <= exe_stage.io_exe_wa_o @[myc01_core.scala 89:33]
    exemem_reg.io_exe_wreg <= exe_stage.io_exe_wreg_o @[myc01_core.scala 90:29]
    exemem_reg.io_exe_wd <= exe_stage.io_exe_wd_o @[myc01_core.scala 91:29]
    exemem_reg.io_exe_mreg <= exe_stage.io_exe_mreg_o @[myc01_core.scala 92:29]
    exemem_reg.io_exe_din <= exe_stage.io_exe_din_o @[myc01_core.scala 93:33]
    mem_stage.clock <= clock
    mem_stage.reset <= reset
    mem_stage.io_mem_aluop_i <= exemem_reg.io_mem_aluop @[myc01_core.scala 96:34]
    mem_stage.io_mem_wa_i <= exemem_reg.io_mem_wa @[myc01_core.scala 97:34]
    mem_stage.io_mem_wreg_i <= exemem_reg.io_mem_wreg @[myc01_core.scala 98:34]
    mem_stage.io_mem_wd_i <= exemem_reg.io_mem_wd @[myc01_core.scala 99:34]
    mem_stage.io_mem_mreg_i <= exemem_reg.io_mem_mreg @[myc01_core.scala 100:34]
    mem_stage.io_mem_din_i <= exemem_reg.io_mem_din @[myc01_core.scala 101:34]
    memwb_reg.clock <= clock
    memwb_reg.reset <= reset
    memwb_reg.io_mem_wa <= mem_stage.io_mem_wa_o @[myc01_core.scala 104:27]
    memwb_reg.io_mem_wreg <= mem_stage.io_mem_wreg_o @[myc01_core.scala 105:31]
    memwb_reg.io_mem_dreg <= mem_stage.io_mem_dreg_o @[myc01_core.scala 106:31]
    memwb_reg.io_mem_mreg <= mem_stage.io_mem_mreg_o @[myc01_core.scala 107:31]
    memwb_reg.io_mem_dre <= mem_stage.io_dre @[myc01_core.scala 108:31]
    memwb_reg.io_mem_load_unsign <= mem_stage.io_load_unsign @[myc01_core.scala 109:38]
    wb_stage.clock <= clock
    wb_stage.reset <= reset
    wb_stage.io_wb_wa_i <= memwb_reg.io_wb_wa @[myc01_core.scala 112:31]
    wb_stage.io_wb_wreg_i <= memwb_reg.io_wb_wreg @[myc01_core.scala 113:31]
    wb_stage.io_wb_dreg_i <= memwb_reg.io_wb_dreg @[myc01_core.scala 114:27]
    wb_stage.io_wb_mreg_i <= memwb_reg.io_wb_mreg @[myc01_core.scala 115:31]
    wb_stage.io_wb_dre_i <= memwb_reg.io_wb_dre @[myc01_core.scala 116:31]
    wb_stage.io_wb_load_unsign <= memwb_reg.io_wb_load_unsign @[myc01_core.scala 117:36]
    wb_stage.io_dm <= io_dm @[myc01_core.scala 140:24]
    regfile.clock <= clock
    regfile.reset <= reset
    regfile.io_wa <= wb_stage.io_wb_wa_o @[myc01_core.scala 120:23]
    regfile.io_wd <= wb_stage.io_wb_wd_o @[myc01_core.scala 121:23]
    regfile.io_we <= wb_stage.io_wb_wreg_o @[myc01_core.scala 122:23]
    regfile.io_ra1 <= id_stage.io_ra1 @[myc01_core.scala 69:24]
    regfile.io_ra2 <= id_stage.io_ra2 @[myc01_core.scala 70:24]
    regfile.io_re1 <= id_stage.io_rreg1 @[myc01_core.scala 71:24]
    regfile.io_re2 <= id_stage.io_rreg2 @[myc01_core.scala 72:24]
