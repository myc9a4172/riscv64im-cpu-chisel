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
    input io_exe2id_wreg : UInt<1>
    input io_exe2id_wa : UInt<5>
    input io_exe2id_wd : UInt<32>
    input io_mem2id_wreg : UInt<1>
    input io_mem2id_wa : UInt<5>
    input io_mem2id_wd : UInt<32>
  
    node _T = bits(io_id_inst_i, 7, 0) @[id_stage.scala 50:35]
    node _T_1 = bits(io_id_inst_i, 15, 8) @[id_stage.scala 51:39]
    node _T_2 = bits(io_id_inst_i, 23, 16) @[id_stage.scala 52:51]
    node _T_3 = bits(io_id_inst_i, 31, 24) @[id_stage.scala 53:51]
    node _T_4 = cat(_T_2, _T_3) @[Cat.scala 30:58]
    node _T_5 = cat(_T_1, _T_4) @[Cat.scala 30:58]
    node id_inst = cat(_T, _T_5) @[Cat.scala 30:58]
    node opcode = bits(id_inst, 6, 0) @[id_stage.scala 57:29]
    node rd = bits(id_inst, 11, 7) @[id_stage.scala 58:29]
    node func3 = bits(id_inst, 14, 12) @[id_stage.scala 59:25]
    node rs1 = bits(id_inst, 19, 15) @[id_stage.scala 60:25]
    node rs2 = bits(id_inst, 24, 20) @[id_stage.scala 61:29]
    node func7 = bits(id_inst, 31, 25) @[id_stage.scala 62:29]
    node imm_I = bits(id_inst, 31, 20) @[id_stage.scala 63:25]
    node shamt = bits(id_inst, 24, 20) @[id_stage.scala 64:29]
    node _T_6 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 69:30]
    node _T_7 = eq(func7, UInt<1>("h0")) @[id_stage.scala 69:58]
    node _T_8 = and(_T_6, _T_7) @[id_stage.scala 69:48]
    node _T_9 = eq(func3, UInt<1>("h0")) @[id_stage.scala 69:86]
    node inst_add = and(_T_8, _T_9) @[id_stage.scala 69:76]
    node _T_10 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 70:30]
    node _T_11 = eq(func7, UInt<6>("h20")) @[id_stage.scala 70:58]
    node _T_12 = and(_T_10, _T_11) @[id_stage.scala 70:48]
    node _T_13 = eq(func3, UInt<1>("h0")) @[id_stage.scala 70:86]
    node inst_sub = and(_T_12, _T_13) @[id_stage.scala 70:76]
    node _T_14 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 71:34]
    node _T_15 = eq(func7, UInt<1>("h0")) @[id_stage.scala 71:62]
    node _T_16 = and(_T_14, _T_15) @[id_stage.scala 71:52]
    node _T_17 = eq(func3, UInt<1>("h1")) @[id_stage.scala 71:90]
    node inst_sll = and(_T_16, _T_17) @[id_stage.scala 71:80]
    node _T_18 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 72:34]
    node _T_19 = eq(func7, UInt<1>("h0")) @[id_stage.scala 72:62]
    node _T_20 = and(_T_18, _T_19) @[id_stage.scala 72:52]
    node _T_21 = eq(func3, UInt<2>("h2")) @[id_stage.scala 72:90]
    node inst_slt = and(_T_20, _T_21) @[id_stage.scala 72:80]
    node _T_22 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 73:34]
    node _T_23 = eq(func7, UInt<1>("h0")) @[id_stage.scala 73:62]
    node _T_24 = and(_T_22, _T_23) @[id_stage.scala 73:52]
    node _T_25 = eq(func3, UInt<2>("h3")) @[id_stage.scala 73:90]
    node inst_sltu = and(_T_24, _T_25) @[id_stage.scala 73:80]
    node _T_26 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 74:34]
    node _T_27 = eq(func7, UInt<1>("h0")) @[id_stage.scala 74:62]
    node _T_28 = and(_T_26, _T_27) @[id_stage.scala 74:52]
    node _T_29 = eq(func3, UInt<3>("h4")) @[id_stage.scala 74:90]
    node inst_xor = and(_T_28, _T_29) @[id_stage.scala 74:80]
    node _T_30 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 75:34]
    node _T_31 = eq(func7, UInt<1>("h0")) @[id_stage.scala 75:62]
    node _T_32 = and(_T_30, _T_31) @[id_stage.scala 75:52]
    node _T_33 = eq(func3, UInt<3>("h5")) @[id_stage.scala 75:90]
    node inst_srl = and(_T_32, _T_33) @[id_stage.scala 75:80]
    node _T_34 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 76:34]
    node _T_35 = eq(func7, UInt<6>("h20")) @[id_stage.scala 76:62]
    node _T_36 = and(_T_34, _T_35) @[id_stage.scala 76:52]
    node _T_37 = eq(func3, UInt<3>("h5")) @[id_stage.scala 76:90]
    node inst_sra = and(_T_36, _T_37) @[id_stage.scala 76:80]
    node _T_38 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 77:34]
    node _T_39 = eq(func7, UInt<1>("h0")) @[id_stage.scala 77:62]
    node _T_40 = and(_T_38, _T_39) @[id_stage.scala 77:52]
    node _T_41 = eq(func3, UInt<3>("h6")) @[id_stage.scala 77:90]
    node inst_or = and(_T_40, _T_41) @[id_stage.scala 77:80]
    node _T_42 = eq(opcode, UInt<6>("h33")) @[id_stage.scala 78:34]
    node _T_43 = eq(func7, UInt<1>("h0")) @[id_stage.scala 78:62]
    node _T_44 = and(_T_42, _T_43) @[id_stage.scala 78:52]
    node _T_45 = eq(func3, UInt<3>("h7")) @[id_stage.scala 78:90]
    node inst_and = and(_T_44, _T_45) @[id_stage.scala 78:80]
    node _T_46 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 81:30]
    node _T_47 = eq(func3, UInt<1>("h0")) @[id_stage.scala 81:58]
    node inst_addi = and(_T_46, _T_47) @[id_stage.scala 81:48]
    node _T_48 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 82:34]
    node _T_49 = eq(func3, UInt<2>("h2")) @[id_stage.scala 82:62]
    node inst_slti = and(_T_48, _T_49) @[id_stage.scala 82:52]
    node _T_50 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 83:34]
    node _T_51 = eq(func3, UInt<2>("h3")) @[id_stage.scala 83:62]
    node inst_sltiu = and(_T_50, _T_51) @[id_stage.scala 83:52]
    node _T_52 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 84:34]
    node _T_53 = eq(func3, UInt<3>("h4")) @[id_stage.scala 84:62]
    node inst_xori = and(_T_52, _T_53) @[id_stage.scala 84:52]
    node _T_54 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 85:34]
    node _T_55 = eq(func3, UInt<3>("h6")) @[id_stage.scala 85:62]
    node inst_ori = and(_T_54, _T_55) @[id_stage.scala 85:52]
    node _T_56 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 86:34]
    node _T_57 = eq(func3, UInt<3>("h7")) @[id_stage.scala 86:62]
    node inst_andi = and(_T_56, _T_57) @[id_stage.scala 86:52]
    node _T_58 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 88:34]
    node _T_59 = eq(func7, UInt<1>("h0")) @[id_stage.scala 88:62]
    node _T_60 = and(_T_58, _T_59) @[id_stage.scala 88:52]
    node _T_61 = eq(func3, UInt<1>("h1")) @[id_stage.scala 88:90]
    node inst_slli = and(_T_60, _T_61) @[id_stage.scala 88:80]
    node _T_62 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 89:34]
    node _T_63 = eq(func7, UInt<1>("h0")) @[id_stage.scala 89:62]
    node _T_64 = and(_T_62, _T_63) @[id_stage.scala 89:52]
    node _T_65 = eq(func3, UInt<3>("h5")) @[id_stage.scala 89:90]
    node inst_srli = and(_T_64, _T_65) @[id_stage.scala 89:80]
    node _T_66 = eq(opcode, UInt<5>("h13")) @[id_stage.scala 90:34]
    node _T_67 = eq(func7, UInt<6>("h20")) @[id_stage.scala 90:62]
    node _T_68 = and(_T_66, _T_67) @[id_stage.scala 90:52]
    node _T_69 = eq(func3, UInt<3>("h5")) @[id_stage.scala 90:90]
    node inst_srai = and(_T_68, _T_69) @[id_stage.scala 90:80]
    node _T_70 = or(inst_sll, inst_srl) @[id_stage.scala 104:41]
    node _T_71 = or(_T_70, inst_sra) @[id_stage.scala 104:52]
    node _T_72 = or(_T_71, inst_slli) @[id_stage.scala 104:63]
    node _T_73 = or(_T_72, inst_srli) @[id_stage.scala 105:61]
    node _T_74 = or(_T_73, inst_srai) @[id_stage.scala 105:72]
    node _T_75 = or(inst_and, inst_or) @[id_stage.scala 107:41]
    node _T_76 = or(_T_75, inst_xor) @[id_stage.scala 107:52]
    node _T_77 = or(_T_76, inst_andi) @[id_stage.scala 107:63]
    node _T_78 = or(_T_77, inst_ori) @[id_stage.scala 108:41]
    node _T_79 = or(_T_78, inst_xori) @[id_stage.scala 108:52]
    node _T_80 = or(inst_add, inst_sub) @[id_stage.scala 110:41]
    node _T_81 = or(_T_80, inst_slt) @[id_stage.scala 110:52]
    node _T_82 = or(_T_81, inst_sltu) @[id_stage.scala 110:63]
    node _T_83 = or(_T_82, inst_addi) @[id_stage.scala 110:75]
    node _T_84 = or(_T_83, inst_slti) @[id_stage.scala 111:41]
    node _T_85 = or(_T_84, inst_sltiu) @[id_stage.scala 111:53]
    node id_alutype_temp_2 = _T_74 @[id_stage.scala 102:35 id_stage.scala 104:28]
    node id_alutype_temp_1 = _T_79 @[id_stage.scala 102:35 id_stage.scala 107:28]
    node _T_86 = cat(id_alutype_temp_2, id_alutype_temp_1) @[id_stage.scala 113:44]
    node id_alutype_temp_0 = _T_85 @[id_stage.scala 102:35 id_stage.scala 110:28]
    node _T_87 = cat(_T_86, id_alutype_temp_0) @[id_stage.scala 113:44]
    node _T_88 = eq(inst_add, UInt<1>("h1")) @[id_stage.scala 118:19]
    node _T_89 = eq(inst_sub, UInt<1>("h1")) @[id_stage.scala 119:19]
    node _T_90 = eq(inst_sll, UInt<1>("h1")) @[id_stage.scala 120:23]
    node _T_91 = eq(inst_slt, UInt<1>("h1")) @[id_stage.scala 121:23]
    node _T_92 = eq(inst_sltu, UInt<1>("h1")) @[id_stage.scala 122:23]
    node _T_93 = eq(inst_xor, UInt<1>("h1")) @[id_stage.scala 123:23]
    node _T_94 = eq(inst_srl, UInt<1>("h1")) @[id_stage.scala 124:23]
    node _T_95 = eq(inst_sra, UInt<1>("h1")) @[id_stage.scala 125:23]
    node _T_96 = eq(inst_or, UInt<1>("h1")) @[id_stage.scala 126:23]
    node _T_97 = eq(inst_and, UInt<1>("h1")) @[id_stage.scala 127:23]
    node _T_98 = eq(inst_addi, UInt<1>("h1")) @[id_stage.scala 129:23]
    node _T_99 = eq(inst_slti, UInt<1>("h1")) @[id_stage.scala 130:19]
    node _T_100 = eq(inst_sltiu, UInt<1>("h1")) @[id_stage.scala 131:23]
    node _T_101 = eq(inst_xori, UInt<1>("h1")) @[id_stage.scala 132:23]
    node _T_102 = eq(inst_ori, UInt<1>("h1")) @[id_stage.scala 133:23]
    node _T_103 = eq(inst_andi, UInt<1>("h1")) @[id_stage.scala 134:23]
    node _T_104 = eq(inst_slli, UInt<1>("h1")) @[id_stage.scala 136:23]
    node _T_105 = eq(inst_srli, UInt<1>("h1")) @[id_stage.scala 137:23]
    node _T_106 = eq(inst_srai, UInt<1>("h1")) @[id_stage.scala 138:23]
    node _T_107 = mux(_T_106, UInt<5>("h13"), UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_108 = mux(_T_105, UInt<5>("h12"), _T_107) @[Mux.scala 98:16]
    node _T_109 = mux(_T_104, UInt<5>("h11"), _T_108) @[Mux.scala 98:16]
    node _T_110 = mux(_T_103, UInt<5>("h10"), _T_109) @[Mux.scala 98:16]
    node _T_111 = mux(_T_102, UInt<4>("hf"), _T_110) @[Mux.scala 98:16]
    node _T_112 = mux(_T_101, UInt<4>("he"), _T_111) @[Mux.scala 98:16]
    node _T_113 = mux(_T_100, UInt<4>("hd"), _T_112) @[Mux.scala 98:16]
    node _T_114 = mux(_T_99, UInt<4>("hc"), _T_113) @[Mux.scala 98:16]
    node _T_115 = mux(_T_98, UInt<4>("hb"), _T_114) @[Mux.scala 98:16]
    node _T_116 = mux(_T_97, UInt<4>("ha"), _T_115) @[Mux.scala 98:16]
    node _T_117 = mux(_T_96, UInt<4>("h9"), _T_116) @[Mux.scala 98:16]
    node _T_118 = mux(_T_95, UInt<4>("h8"), _T_117) @[Mux.scala 98:16]
    node _T_119 = mux(_T_94, UInt<3>("h7"), _T_118) @[Mux.scala 98:16]
    node _T_120 = mux(_T_93, UInt<3>("h6"), _T_119) @[Mux.scala 98:16]
    node _T_121 = mux(_T_92, UInt<3>("h5"), _T_120) @[Mux.scala 98:16]
    node _T_122 = mux(_T_91, UInt<3>("h4"), _T_121) @[Mux.scala 98:16]
    node _T_123 = mux(_T_90, UInt<2>("h3"), _T_122) @[Mux.scala 98:16]
    node _T_124 = mux(_T_89, UInt<2>("h2"), _T_123) @[Mux.scala 98:16]
    node _T_125 = mux(_T_88, UInt<1>("h1"), _T_124) @[Mux.scala 98:16]
    node _T_126 = or(inst_add, inst_sub) @[id_stage.scala 143:35]
    node _T_127 = or(_T_126, inst_slt) @[id_stage.scala 143:48]
    node _T_128 = or(_T_127, inst_sltu) @[id_stage.scala 143:61]
    node _T_129 = or(_T_128, inst_and) @[id_stage.scala 143:75]
    node _T_130 = or(_T_129, inst_or) @[id_stage.scala 144:39]
    node _T_131 = or(_T_130, inst_xor) @[id_stage.scala 144:52]
    node _T_132 = or(_T_131, inst_sll) @[id_stage.scala 144:65]
    node _T_133 = or(_T_132, inst_srl) @[id_stage.scala 145:55]
    node _T_134 = or(_T_133, inst_sra) @[id_stage.scala 145:68]
    node _T_135 = or(_T_134, inst_addi) @[id_stage.scala 145:81]
    node _T_136 = or(_T_135, inst_slti) @[id_stage.scala 146:55]
    node _T_137 = or(_T_136, inst_sltiu) @[id_stage.scala 146:68]
    node _T_138 = or(_T_137, inst_andi) @[id_stage.scala 146:81]
    node _T_139 = or(_T_138, inst_ori) @[id_stage.scala 147:59]
    node _T_140 = or(_T_139, inst_xori) @[id_stage.scala 147:72]
    node _T_141 = or(_T_140, inst_slli) @[id_stage.scala 147:85]
    node _T_142 = or(_T_141, inst_srli) @[id_stage.scala 148:35]
    node _T_143 = or(_T_142, inst_srai) @[id_stage.scala 148:48]
    node _T_144 = or(inst_addi, inst_slti) @[id_stage.scala 151:34]
    node _T_145 = or(_T_144, inst_sltiu) @[id_stage.scala 151:47]
    node _T_146 = or(_T_145, inst_andi) @[id_stage.scala 151:61]
    node _T_147 = or(_T_146, inst_ori) @[id_stage.scala 152:34]
    node immsel = or(_T_147, inst_xori) @[id_stage.scala 152:47]
    node _T_148 = or(inst_slli, inst_srli) @[id_stage.scala 155:35]
    node imm_shamt = or(_T_148, inst_srai) @[id_stage.scala 155:47]
    node _T_149 = or(inst_add, inst_sub) @[id_stage.scala 167:29]
    node _T_150 = or(_T_149, inst_slt) @[id_stage.scala 167:42]
    node _T_151 = or(_T_150, inst_sltu) @[id_stage.scala 167:55]
    node _T_152 = or(_T_151, inst_and) @[id_stage.scala 167:69]
    node _T_153 = or(_T_152, inst_or) @[id_stage.scala 168:33]
    node _T_154 = or(_T_153, inst_xor) @[id_stage.scala 168:46]
    node _T_155 = or(_T_154, inst_sll) @[id_stage.scala 168:59]
    node _T_156 = or(_T_155, inst_srl) @[id_stage.scala 169:45]
    node _T_157 = or(_T_156, inst_sra) @[id_stage.scala 169:58]
    node _T_158 = or(_T_157, inst_addi) @[id_stage.scala 169:71]
    node _T_159 = or(_T_158, inst_slti) @[id_stage.scala 170:45]
    node _T_160 = or(_T_159, inst_sltiu) @[id_stage.scala 170:58]
    node _T_161 = or(_T_160, inst_andi) @[id_stage.scala 170:71]
    node _T_162 = or(_T_161, inst_ori) @[id_stage.scala 171:45]
    node _T_163 = or(_T_162, inst_xori) @[id_stage.scala 171:58]
    node _T_164 = or(_T_163, inst_slli) @[id_stage.scala 171:71]
    node _T_165 = or(_T_164, inst_srli) @[id_stage.scala 172:29]
    node _T_166 = or(_T_165, inst_srai) @[id_stage.scala 172:42]
    node _T_167 = or(inst_add, inst_sub) @[id_stage.scala 175:29]
    node _T_168 = or(_T_167, inst_slt) @[id_stage.scala 175:42]
    node _T_169 = or(_T_168, inst_sltu) @[id_stage.scala 175:54]
    node _T_170 = or(_T_169, inst_and) @[id_stage.scala 175:66]
    node _T_171 = or(_T_170, inst_or) @[id_stage.scala 176:33]
    node _T_172 = or(_T_171, inst_xor) @[id_stage.scala 176:46]
    node _T_173 = or(_T_172, inst_sll) @[id_stage.scala 176:58]
    node _T_174 = or(_T_173, inst_srl) @[id_stage.scala 177:33]
    node _T_175 = or(_T_174, inst_sra) @[id_stage.scala 177:46]
    node _T_176 = eq(io_exe2id_wreg, UInt<1>("h1")) @[id_stage.scala 183:37]
    node _T_177 = eq(io_exe2id_wa, io_ra1) @[id_stage.scala 183:61]
    node _T_178 = and(_T_176, _T_177) @[id_stage.scala 183:45]
    node _T_179 = eq(io_rreg1, UInt<1>("h1")) @[id_stage.scala 183:84]
    node _T_180 = and(_T_178, _T_179) @[id_stage.scala 183:72]
    node _T_181 = eq(io_mem2id_wreg, UInt<1>("h1")) @[id_stage.scala 184:49]
    node _T_182 = eq(io_mem2id_wa, io_ra1) @[id_stage.scala 184:73]
    node _T_183 = and(_T_181, _T_182) @[id_stage.scala 184:57]
    node _T_184 = eq(io_rreg1, UInt<1>("h1")) @[id_stage.scala 184:96]
    node _T_185 = and(_T_183, _T_184) @[id_stage.scala 184:84]
    node _T_186 = mux(_T_185, UInt<2>("h2"), UInt<1>("h0")) @[Mux.scala 98:16]
    node fwrd_reg1 = mux(_T_180, UInt<1>("h1"), _T_186) @[Mux.scala 98:16]
    node _T_187 = eq(io_exe2id_wreg, UInt<1>("h1")) @[id_stage.scala 188:37]
    node _T_188 = eq(io_exe2id_wa, io_ra2) @[id_stage.scala 188:61]
    node _T_189 = and(_T_187, _T_188) @[id_stage.scala 188:45]
    node _T_190 = eq(io_rreg2, UInt<1>("h1")) @[id_stage.scala 188:84]
    node _T_191 = and(_T_189, _T_190) @[id_stage.scala 188:72]
    node _T_192 = eq(io_mem2id_wreg, UInt<1>("h1")) @[id_stage.scala 189:49]
    node _T_193 = eq(io_mem2id_wa, io_ra2) @[id_stage.scala 189:73]
    node _T_194 = and(_T_192, _T_193) @[id_stage.scala 189:57]
    node _T_195 = eq(io_rreg2, UInt<1>("h1")) @[id_stage.scala 189:96]
    node _T_196 = and(_T_194, _T_195) @[id_stage.scala 189:84]
    node _T_197 = mux(_T_196, UInt<2>("h2"), UInt<1>("h0")) @[Mux.scala 98:16]
    node fwrd_reg2 = mux(_T_191, UInt<1>("h1"), _T_197) @[Mux.scala 98:16]
    node _T_199 = asSInt(imm_I) @[id_stage.scala 202:39]
    node _T_198 = pad(_T_199, 32) @[id_stage.scala 202:24]
    node imm_ext = asUInt(_T_198) @[id_stage.scala 203:30]
    node _T_200 = eq(fwrd_reg1, UInt<1>("h1")) @[id_stage.scala 214:28]
    node _T_201 = eq(fwrd_reg1, UInt<2>("h2")) @[id_stage.scala 215:44]
    node _T_202 = mux(_T_201, io_mem2id_wd, io_rd1) @[Mux.scala 98:16]
    node _T_203 = mux(_T_200, io_exe2id_wd, _T_202) @[Mux.scala 98:16]
    node _T_204 = eq(fwrd_reg2, UInt<1>("h1")) @[id_stage.scala 219:32]
    node _T_205 = eq(fwrd_reg2, UInt<2>("h2")) @[id_stage.scala 220:44]
    node _T_206 = eq(immsel, UInt<1>("h1")) @[id_stage.scala 221:32]
    node _T_207 = eq(imm_shamt, UInt<1>("h1")) @[id_stage.scala 222:44]
    node _T_208 = cat(UInt<27>("h0"), shamt) @[Cat.scala 30:58]
    node _T_209 = mux(_T_207, _T_208, io_rd2) @[Mux.scala 98:16]
    node _T_210 = mux(_T_206, imm_ext, _T_209) @[Mux.scala 98:16]
    node _T_211 = mux(_T_205, io_mem2id_wd, _T_210) @[Mux.scala 98:16]
    node _T_212 = mux(_T_204, io_exe2id_wd, _T_211) @[Mux.scala 98:16]
    io_id_alutype_o <= _T_87 @[id_stage.scala 113:25]
    io_id_aluop_o <= _T_125 @[id_stage.scala 117:23]
    io_id_wa_o <= rd @[id_stage.scala 207:20]
    io_id_wreg_o <= _T_143 @[id_stage.scala 143:19]
    io_id_src1_o <= _T_203 @[id_stage.scala 213:22]
    io_id_src2_o <= _T_212 @[id_stage.scala 218:22]
    io_rreg1 <= _T_166 @[id_stage.scala 167:15]
    io_ra1 <= rs1 @[id_stage.scala 196:16]
    io_rreg2 <= _T_175 @[id_stage.scala 175:15]
    io_ra2 <= rs2 @[id_stage.scala 197:16]

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
    node xorAns = xor(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 56:31]
    node _T = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 57:31]
    node addAns = tail(_T, 1) @[exe_stage.scala 57:31]
    node _T_1 = sub(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 58:31]
    node subAns = tail(_T_1, 1) @[exe_stage.scala 58:31]
    node _T_2 = asSInt(io_exe_src1_i) @[exe_stage.scala 59:42]
    node _T_3 = asSInt(io_exe_src2_i) @[exe_stage.scala 59:67]
    node _T_4 = lt(_T_2, _T_3) @[exe_stage.scala 59:45]
    node sltAns = mux(_T_4, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 59:20]
    node _T_5 = lt(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 60:45]
    node sltuAns = mux(_T_5, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 60:20]
    node _T_6 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 61:48]
    node _T_7 = dshl(io_exe_src1_i, _T_6) @[exe_stage.scala 61:32]
    node sllAns = bits(_T_7, 31, 0) @[exe_stage.scala 61:54]
    node _T_8 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 62:48]
    node srlAns = dshr(io_exe_src1_i, _T_8) @[exe_stage.scala 62:32]
    node _T_9 = asSInt(io_exe_src1_i) @[exe_stage.scala 63:38]
    node _T_10 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 63:57]
    node _T_11 = dshr(_T_9, _T_10) @[exe_stage.scala 63:41]
    node sraAns = asUInt(_T_11) @[exe_stage.scala 63:70]
    node _T_12 = add(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 66:32]
    node addiAns = tail(_T_12, 1) @[exe_stage.scala 66:32]
    node _T_13 = asSInt(io_exe_src1_i) @[exe_stage.scala 67:43]
    node _T_14 = asSInt(io_exe_src2_i) @[exe_stage.scala 67:68]
    node _T_15 = lt(_T_13, _T_14) @[exe_stage.scala 67:46]
    node sltiAns = mux(_T_15, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 67:21]
    node _T_16 = lt(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 68:46]
    node sltiuAns = mux(_T_16, UInt<32>("h1"), UInt<32>("h0")) @[exe_stage.scala 68:21]
    node xoriAns = xor(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 69:32]
    node oriAns = or(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 70:32]
    node andiAns = and(io_exe_src1_i, io_exe_src2_i) @[exe_stage.scala 71:32]
    node _T_17 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 73:49]
    node _T_18 = dshl(io_exe_src1_i, _T_17) @[exe_stage.scala 73:33]
    node slliAns = bits(_T_18, 31, 0) @[exe_stage.scala 73:55]
    node _T_19 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 74:49]
    node srliAns = dshr(io_exe_src1_i, _T_19) @[exe_stage.scala 74:33]
    node _T_20 = asSInt(io_exe_src1_i) @[exe_stage.scala 75:39]
    node _T_21 = bits(io_exe_src2_i, 4, 0) @[exe_stage.scala 75:58]
    node _T_22 = dshr(_T_20, _T_21) @[exe_stage.scala 75:42]
    node sraiAns = asUInt(_T_22) @[exe_stage.scala 75:71]
    node _T_23 = eq(io_exe_aluop_i, UInt<4>("ha")) @[exe_stage.scala 80:24]
    node _T_24 = eq(io_exe_aluop_i, UInt<4>("h9")) @[exe_stage.scala 81:28]
    node _T_25 = eq(io_exe_aluop_i, UInt<3>("h6")) @[exe_stage.scala 82:28]
    node _T_26 = eq(io_exe_aluop_i, UInt<5>("h10")) @[exe_stage.scala 83:28]
    node _T_27 = eq(io_exe_aluop_i, UInt<4>("hf")) @[exe_stage.scala 84:28]
    node _T_28 = eq(io_exe_aluop_i, UInt<4>("he")) @[exe_stage.scala 85:28]
    node _T_29 = mux(_T_28, xoriAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_30 = mux(_T_27, oriAns, _T_29) @[Mux.scala 98:16]
    node _T_31 = mux(_T_26, andiAns, _T_30) @[Mux.scala 98:16]
    node _T_32 = mux(_T_25, xorAns, _T_31) @[Mux.scala 98:16]
    node _T_33 = mux(_T_24, orAns, _T_32) @[Mux.scala 98:16]
    node logicres = mux(_T_23, andAns, _T_33) @[Mux.scala 98:16]
    node _T_34 = eq(io_exe_aluop_i, UInt<2>("h3")) @[exe_stage.scala 90:24]
    node _T_35 = eq(io_exe_aluop_i, UInt<3>("h7")) @[exe_stage.scala 91:28]
    node _T_36 = eq(io_exe_aluop_i, UInt<4>("h8")) @[exe_stage.scala 92:28]
    node _T_37 = eq(io_exe_aluop_i, UInt<5>("h11")) @[exe_stage.scala 94:28]
    node _T_38 = eq(io_exe_aluop_i, UInt<5>("h12")) @[exe_stage.scala 95:28]
    node _T_39 = eq(io_exe_aluop_i, UInt<5>("h13")) @[exe_stage.scala 96:28]
    node _T_40 = mux(_T_39, sraiAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_41 = mux(_T_38, srliAns, _T_40) @[Mux.scala 98:16]
    node _T_42 = mux(_T_37, slliAns, _T_41) @[Mux.scala 98:16]
    node _T_43 = mux(_T_36, sraAns, _T_42) @[Mux.scala 98:16]
    node _T_44 = mux(_T_35, srlAns, _T_43) @[Mux.scala 98:16]
    node shiftres = mux(_T_34, sllAns, _T_44) @[Mux.scala 98:16]
    node _T_45 = eq(io_exe_aluop_i, UInt<1>("h1")) @[exe_stage.scala 103:24]
    node _T_46 = eq(io_exe_aluop_i, UInt<2>("h2")) @[exe_stage.scala 104:28]
    node _T_47 = eq(io_exe_aluop_i, UInt<3>("h4")) @[exe_stage.scala 105:28]
    node _T_48 = eq(io_exe_aluop_i, UInt<3>("h5")) @[exe_stage.scala 106:28]
    node _T_49 = eq(io_exe_aluop_i, UInt<4>("hb")) @[exe_stage.scala 107:28]
    node _T_50 = eq(io_exe_aluop_i, UInt<4>("hc")) @[exe_stage.scala 108:28]
    node _T_51 = eq(io_exe_aluop_i, UInt<4>("hd")) @[exe_stage.scala 109:28]
    node _T_52 = mux(_T_51, sltiuAns, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_53 = mux(_T_50, sltiAns, _T_52) @[Mux.scala 98:16]
    node _T_54 = mux(_T_49, addiAns, _T_53) @[Mux.scala 98:16]
    node _T_55 = mux(_T_48, sltuAns, _T_54) @[Mux.scala 98:16]
    node _T_56 = mux(_T_47, sltAns, _T_55) @[Mux.scala 98:16]
    node _T_57 = mux(_T_46, subAns, _T_56) @[Mux.scala 98:16]
    node arithres = mux(_T_45, addAns, _T_57) @[Mux.scala 98:16]
    node _T_58 = eq(io_exe_alutype_i, UInt<1>("h1")) @[exe_stage.scala 116:28]
    node _T_59 = eq(io_exe_alutype_i, UInt<2>("h2")) @[exe_stage.scala 117:28]
    node _T_60 = eq(io_exe_alutype_i, UInt<3>("h4")) @[exe_stage.scala 119:24]
    node _T_61 = mux(_T_60, shiftres, UInt<1>("h0")) @[Mux.scala 98:16]
    node _T_62 = mux(_T_59, logicres, _T_61) @[Mux.scala 98:16]
    node _T_63 = mux(_T_58, arithres, _T_62) @[Mux.scala 98:16]
    io_exe_aluop_o <= io_exe_aluop_i @[exe_stage.scala 42:18]
    io_exe_wa_o <= io_exe_wa_i @[exe_stage.scala 47:17]
    io_exe_wreg_o <= io_exe_wreg_i @[exe_stage.scala 48:17]
    io_exe_wd_o <= _T_63 @[exe_stage.scala 115:15]

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
    io_iaddr <= if_stage.io_iaddr @[myc01_core.scala 113:18]
    io_ice <= if_stage.io_ice @[myc01_core.scala 112:18]
    io_exe_aluop_o <= exe_stage.io_exe_aluop_o @[myc01_core.scala 118:23]
    io_exe_wa_o <= exe_stage.io_exe_wa_o @[myc01_core.scala 119:19]
    io_exe_wreg_o <= exe_stage.io_exe_wreg_o @[myc01_core.scala 120:19]
    io_exe_wd_o <= exe_stage.io_exe_wd_o @[myc01_core.scala 121:19]
    io_id_pc <= ifid_reg.io_id_pc @[myc01_core.scala 123:23]
    if_stage.clock <= clock
    if_stage.reset <= reset
    ifid_reg.clock <= clock
    ifid_reg.reset <= reset
    ifid_reg.io_if_pc <= if_stage.io_pc @[myc01_core.scala 43:27]
    id_stage.clock <= clock
    id_stage.reset <= reset
    id_stage.io_id_pc_i <= ifid_reg.io_id_pc @[myc01_core.scala 46:25]
    id_stage.io_id_inst_i <= io_inst @[myc01_core.scala 116:31]
    id_stage.io_rd1 <= regfile.io_rd1 @[myc01_core.scala 71:25]
    id_stage.io_rd2 <= regfile.io_rd2 @[myc01_core.scala 72:25]
    id_stage.io_exe2id_wreg <= exe_stage.io_exe_wreg_o @[myc01_core.scala 49:30]
    id_stage.io_exe2id_wa <= exe_stage.io_exe_wa_o @[myc01_core.scala 50:34]
    id_stage.io_exe2id_wd <= exe_stage.io_exe_wd_o @[myc01_core.scala 51:34]
    id_stage.io_mem2id_wreg <= mem_stage.io_mem_wreg_o @[myc01_core.scala 52:34]
    id_stage.io_mem2id_wa <= mem_stage.io_mem_wa_o @[myc01_core.scala 53:34]
    id_stage.io_mem2id_wd <= mem_stage.io_mem_dreg_o @[myc01_core.scala 54:34]
    idexe_reg.clock <= clock
    idexe_reg.reset <= reset
    idexe_reg.io_id_alutype <= id_stage.io_id_alutype_o @[myc01_core.scala 58:29]
    idexe_reg.io_id_aluop <= id_stage.io_id_aluop_o @[myc01_core.scala 59:29]
    idexe_reg.io_id_src1 <= id_stage.io_id_src1_o @[myc01_core.scala 60:29]
    idexe_reg.io_id_src2 <= id_stage.io_id_src2_o @[myc01_core.scala 61:29]
    idexe_reg.io_id_wa <= id_stage.io_id_wa_o @[myc01_core.scala 62:29]
    idexe_reg.io_id_wreg <= id_stage.io_id_wreg_o @[myc01_core.scala 63:29]
    exe_stage.clock <= clock
    exe_stage.reset <= reset
    exe_stage.io_exe_alutype_i <= idexe_reg.io_exe_alutype @[myc01_core.scala 75:32]
    exe_stage.io_exe_aluop_i <= idexe_reg.io_exe_aluop @[myc01_core.scala 76:32]
    exe_stage.io_exe_src1_i <= idexe_reg.io_exe_src1 @[myc01_core.scala 77:32]
    exe_stage.io_exe_src2_i <= idexe_reg.io_exe_src2 @[myc01_core.scala 78:32]
    exe_stage.io_exe_wa_i <= idexe_reg.io_exe_wa @[myc01_core.scala 79:32]
    exe_stage.io_exe_wreg_i <= idexe_reg.io_exe_wreg @[myc01_core.scala 80:32]
    exemem_reg.clock <= clock
    exemem_reg.reset <= reset
    exemem_reg.io_exe_aluop <= exe_stage.io_exe_aluop_o @[myc01_core.scala 83:29]
    exemem_reg.io_exe_wa <= exe_stage.io_exe_wa_o @[myc01_core.scala 84:33]
    exemem_reg.io_exe_wreg <= exe_stage.io_exe_wreg_o @[myc01_core.scala 85:29]
    exemem_reg.io_exe_wd <= exe_stage.io_exe_wd_o @[myc01_core.scala 86:29]
    mem_stage.clock <= clock
    mem_stage.reset <= reset
    mem_stage.io_mem_aluop_i <= exemem_reg.io_mem_aluop @[myc01_core.scala 89:34]
    mem_stage.io_mem_wa_i <= exemem_reg.io_mem_wa @[myc01_core.scala 90:34]
    mem_stage.io_mem_wreg_i <= exemem_reg.io_mem_wreg @[myc01_core.scala 91:34]
    mem_stage.io_mem_wd_i <= exemem_reg.io_mem_wd @[myc01_core.scala 92:34]
    memwb_reg.clock <= clock
    memwb_reg.reset <= reset
    memwb_reg.io_mem_wa <= mem_stage.io_mem_wa_o @[myc01_core.scala 95:27]
    memwb_reg.io_mem_wreg <= mem_stage.io_mem_wreg_o @[myc01_core.scala 96:31]
    memwb_reg.io_mem_dreg <= mem_stage.io_mem_dreg_o @[myc01_core.scala 97:31]
    wb_stage.clock <= clock
    wb_stage.reset <= reset
    wb_stage.io_wb_wa_i <= memwb_reg.io_wb_wa @[myc01_core.scala 100:31]
    wb_stage.io_wb_wreg_i <= memwb_reg.io_wb_wreg @[myc01_core.scala 101:31]
    wb_stage.io_wb_dreg_i <= memwb_reg.io_wb_dreg @[myc01_core.scala 102:27]
    regfile.clock <= clock
    regfile.reset <= reset
    regfile.io_wa <= wb_stage.io_wb_wa_o @[myc01_core.scala 105:23]
    regfile.io_wd <= wb_stage.io_wb_wd_o @[myc01_core.scala 106:23]
    regfile.io_we <= wb_stage.io_wb_wreg_o @[myc01_core.scala 107:23]
    regfile.io_ra1 <= id_stage.io_ra1 @[myc01_core.scala 66:24]
    regfile.io_ra2 <= id_stage.io_ra2 @[myc01_core.scala 67:24]
    regfile.io_re1 <= id_stage.io_rreg1 @[myc01_core.scala 68:24]
    regfile.io_re2 <= id_stage.io_rreg2 @[myc01_core.scala 69:24]
