module if_stage(
  input         clock,
  input         reset,
  output [63:0] io_pc,
  output [31:0] io_inst_o,
  output [1:0]  io_BTB_hit_o,
  output        io_BTB_false_o,
  input  [63:0] io_jump_addr,
  input         io_jump_flag,
  input         io_jump_inst,
  input  [63:0] io_id_pc,
  input  [1:0]  io_id_BTB_hit,
  output        io_inst_req,
  output [63:0] io_iaddr,
  input  [63:0] io_inst_rdata,
  input         io_inst_data_ok,
  output        io_icache_invalid,
  input  [4:0]  io_stall,
  input         io_flush,
  input  [63:0] io_excaddr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [63:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [63:0] _RAND_70;
  reg [63:0] _RAND_71;
  reg [63:0] _RAND_72;
  reg [63:0] _RAND_73;
  reg [63:0] _RAND_74;
  reg [63:0] _RAND_75;
  reg [63:0] _RAND_76;
  reg [63:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [63:0] _RAND_79;
  reg [63:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [63:0] _RAND_82;
  reg [63:0] _RAND_83;
  reg [63:0] _RAND_84;
  reg [63:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [63:0] _RAND_88;
  reg [63:0] _RAND_89;
  reg [63:0] _RAND_90;
  reg [63:0] _RAND_91;
  reg [63:0] _RAND_92;
  reg [63:0] _RAND_93;
  reg [63:0] _RAND_94;
  reg [63:0] _RAND_95;
  reg [63:0] _RAND_96;
  reg [63:0] _RAND_97;
  reg [63:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [63:0] _RAND_132;
`endif // RANDOMIZE_REG_INIT
  reg  ice_reg; // @[if_stage.scala 40:24]
  reg [63:0] pc_reg; // @[if_stage.scala 44:23]
  wire  _T_3 = io_stall[1] | io_flush; // @[if_stage.scala 49:43]
  wire  _T_7 = io_inst_req & io_inst_data_ok; // @[if_stage.scala 53:39]
  wire  _T_8 = ~io_BTB_false_o; // @[if_stage.scala 53:84]
  wire  _T_9 = _T_7 & _T_8; // @[if_stage.scala 53:66]
  wire  _T_10 = ~io_flush; // @[if_stage.scala 53:122]
  wire  ready_go = _T_9 & _T_10; // @[if_stage.scala 53:92]
  wire  pc_stall = ~ready_go; // @[if_stage.scala 54:27]
  wire  _T_15 = io_iaddr[2:0] == 3'h0; // @[if_stage.scala 59:51]
  wire  _T_16 = ready_go & _T_15; // @[if_stage.scala 59:34]
  wire [31:0] _T_23 = {io_inst_rdata[39:32],io_inst_rdata[47:40],io_inst_rdata[55:48],io_inst_rdata[63:56]}; // @[Cat.scala 30:58]
  wire  _T_26 = io_iaddr[2:0] == 3'h4; // @[if_stage.scala 60:59]
  wire  _T_27 = ready_go & _T_26; // @[if_stage.scala 60:42]
  wire [31:0] _T_34 = {io_inst_rdata[7:0],io_inst_rdata[15:8],io_inst_rdata[23:16],io_inst_rdata[31:24]}; // @[Cat.scala 30:58]
  wire [31:0] _T_35 = _T_27 ? _T_34 : 32'h0; // @[Mux.scala 98:16]
  reg  flush_reg; // @[if_stage.scala 63:26]
  wire  _T_40 = flush_reg & io_inst_req; // @[if_stage.scala 66:32]
  wire  _T_42 = _T_40 & io_inst_data_ok; // @[if_stage.scala 66:55]
  wire  _GEN_0 = _T_42 ? 1'h0 : flush_reg; // @[if_stage.scala 66:82]
  wire  _GEN_1 = io_flush | _GEN_0; // @[if_stage.scala 64:25]
  reg  V_reg_0; // @[if_stage.scala 72:25]
  reg  V_reg_1; // @[if_stage.scala 72:25]
  reg  V_reg_2; // @[if_stage.scala 72:25]
  reg  V_reg_3; // @[if_stage.scala 72:25]
  reg  V_reg_4; // @[if_stage.scala 72:25]
  reg  V_reg_5; // @[if_stage.scala 72:25]
  reg  V_reg_6; // @[if_stage.scala 72:25]
  reg  V_reg_7; // @[if_stage.scala 72:25]
  reg  V_reg_8; // @[if_stage.scala 72:25]
  reg  V_reg_9; // @[if_stage.scala 72:25]
  reg  V_reg_10; // @[if_stage.scala 72:25]
  reg  V_reg_11; // @[if_stage.scala 72:25]
  reg  V_reg_12; // @[if_stage.scala 72:25]
  reg  V_reg_13; // @[if_stage.scala 72:25]
  reg  V_reg_14; // @[if_stage.scala 72:25]
  reg  V_reg_15; // @[if_stage.scala 72:25]
  reg  V_reg_16; // @[if_stage.scala 72:25]
  reg  V_reg_17; // @[if_stage.scala 72:25]
  reg  V_reg_18; // @[if_stage.scala 72:25]
  reg  V_reg_19; // @[if_stage.scala 72:25]
  reg  V_reg_20; // @[if_stage.scala 72:25]
  reg  V_reg_21; // @[if_stage.scala 72:25]
  reg  V_reg_22; // @[if_stage.scala 72:25]
  reg  V_reg_23; // @[if_stage.scala 72:25]
  reg  V_reg_24; // @[if_stage.scala 72:25]
  reg  V_reg_25; // @[if_stage.scala 72:25]
  reg  V_reg_26; // @[if_stage.scala 72:25]
  reg  V_reg_27; // @[if_stage.scala 72:25]
  reg  V_reg_28; // @[if_stage.scala 72:25]
  reg  V_reg_29; // @[if_stage.scala 72:25]
  reg  V_reg_30; // @[if_stage.scala 72:25]
  reg  V_reg_31; // @[if_stage.scala 72:25]
  reg [7:0] Tag_reg_0; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_1; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_2; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_3; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_4; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_5; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_6; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_7; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_8; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_9; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_10; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_11; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_12; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_13; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_14; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_15; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_16; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_17; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_18; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_19; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_20; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_21; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_22; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_23; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_24; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_25; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_26; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_27; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_28; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_29; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_30; // @[if_stage.scala 73:25]
  reg [7:0] Tag_reg_31; // @[if_stage.scala 73:25]
  reg [61:0] BTA_reg_0; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_1; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_2; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_3; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_4; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_5; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_6; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_7; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_8; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_9; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_10; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_11; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_12; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_13; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_14; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_15; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_16; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_17; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_18; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_19; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_20; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_21; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_22; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_23; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_24; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_25; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_26; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_27; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_28; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_29; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_30; // @[if_stage.scala 74:25]
  reg [61:0] BTA_reg_31; // @[if_stage.scala 74:25]
  reg [1:0] BHT_reg_0; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_1; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_2; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_3; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_4; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_5; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_6; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_7; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_8; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_9; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_10; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_11; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_12; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_13; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_14; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_15; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_16; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_17; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_18; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_19; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_20; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_21; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_22; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_23; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_24; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_25; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_26; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_27; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_28; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_29; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_30; // @[if_stage.scala 75:25]
  reg [1:0] BHT_reg_31; // @[if_stage.scala 75:25]
  reg  BTB_false_reg; // @[if_stage.scala 77:31]
  reg [63:0] correct_pc_reg; // @[if_stage.scala 78:32]
  wire [7:0] _GEN_3 = 5'h1 == pc_reg[6:2] ? Tag_reg_1 : Tag_reg_0; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_4 = 5'h2 == pc_reg[6:2] ? Tag_reg_2 : _GEN_3; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_5 = 5'h3 == pc_reg[6:2] ? Tag_reg_3 : _GEN_4; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_6 = 5'h4 == pc_reg[6:2] ? Tag_reg_4 : _GEN_5; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_7 = 5'h5 == pc_reg[6:2] ? Tag_reg_5 : _GEN_6; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_8 = 5'h6 == pc_reg[6:2] ? Tag_reg_6 : _GEN_7; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_9 = 5'h7 == pc_reg[6:2] ? Tag_reg_7 : _GEN_8; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_10 = 5'h8 == pc_reg[6:2] ? Tag_reg_8 : _GEN_9; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_11 = 5'h9 == pc_reg[6:2] ? Tag_reg_9 : _GEN_10; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_12 = 5'ha == pc_reg[6:2] ? Tag_reg_10 : _GEN_11; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_13 = 5'hb == pc_reg[6:2] ? Tag_reg_11 : _GEN_12; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_14 = 5'hc == pc_reg[6:2] ? Tag_reg_12 : _GEN_13; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_15 = 5'hd == pc_reg[6:2] ? Tag_reg_13 : _GEN_14; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_16 = 5'he == pc_reg[6:2] ? Tag_reg_14 : _GEN_15; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_17 = 5'hf == pc_reg[6:2] ? Tag_reg_15 : _GEN_16; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_18 = 5'h10 == pc_reg[6:2] ? Tag_reg_16 : _GEN_17; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_19 = 5'h11 == pc_reg[6:2] ? Tag_reg_17 : _GEN_18; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_20 = 5'h12 == pc_reg[6:2] ? Tag_reg_18 : _GEN_19; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_21 = 5'h13 == pc_reg[6:2] ? Tag_reg_19 : _GEN_20; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_22 = 5'h14 == pc_reg[6:2] ? Tag_reg_20 : _GEN_21; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_23 = 5'h15 == pc_reg[6:2] ? Tag_reg_21 : _GEN_22; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_24 = 5'h16 == pc_reg[6:2] ? Tag_reg_22 : _GEN_23; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_25 = 5'h17 == pc_reg[6:2] ? Tag_reg_23 : _GEN_24; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_26 = 5'h18 == pc_reg[6:2] ? Tag_reg_24 : _GEN_25; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_27 = 5'h19 == pc_reg[6:2] ? Tag_reg_25 : _GEN_26; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_28 = 5'h1a == pc_reg[6:2] ? Tag_reg_26 : _GEN_27; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_29 = 5'h1b == pc_reg[6:2] ? Tag_reg_27 : _GEN_28; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_30 = 5'h1c == pc_reg[6:2] ? Tag_reg_28 : _GEN_29; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_31 = 5'h1d == pc_reg[6:2] ? Tag_reg_29 : _GEN_30; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_32 = 5'h1e == pc_reg[6:2] ? Tag_reg_30 : _GEN_31; // @[if_stage.scala 87:30]
  wire [7:0] _GEN_33 = 5'h1f == pc_reg[6:2] ? Tag_reg_31 : _GEN_32; // @[if_stage.scala 87:30]
  wire  _T_49 = _GEN_33 == pc_reg[14:7]; // @[if_stage.scala 87:30]
  wire  _GEN_35 = 5'h1 == pc_reg[6:2] ? V_reg_1 : V_reg_0; // @[if_stage.scala 87:69]
  wire  _GEN_36 = 5'h2 == pc_reg[6:2] ? V_reg_2 : _GEN_35; // @[if_stage.scala 87:69]
  wire  _GEN_37 = 5'h3 == pc_reg[6:2] ? V_reg_3 : _GEN_36; // @[if_stage.scala 87:69]
  wire  _GEN_38 = 5'h4 == pc_reg[6:2] ? V_reg_4 : _GEN_37; // @[if_stage.scala 87:69]
  wire  _GEN_39 = 5'h5 == pc_reg[6:2] ? V_reg_5 : _GEN_38; // @[if_stage.scala 87:69]
  wire  _GEN_40 = 5'h6 == pc_reg[6:2] ? V_reg_6 : _GEN_39; // @[if_stage.scala 87:69]
  wire  _GEN_41 = 5'h7 == pc_reg[6:2] ? V_reg_7 : _GEN_40; // @[if_stage.scala 87:69]
  wire  _GEN_42 = 5'h8 == pc_reg[6:2] ? V_reg_8 : _GEN_41; // @[if_stage.scala 87:69]
  wire  _GEN_43 = 5'h9 == pc_reg[6:2] ? V_reg_9 : _GEN_42; // @[if_stage.scala 87:69]
  wire  _GEN_44 = 5'ha == pc_reg[6:2] ? V_reg_10 : _GEN_43; // @[if_stage.scala 87:69]
  wire  _GEN_45 = 5'hb == pc_reg[6:2] ? V_reg_11 : _GEN_44; // @[if_stage.scala 87:69]
  wire  _GEN_46 = 5'hc == pc_reg[6:2] ? V_reg_12 : _GEN_45; // @[if_stage.scala 87:69]
  wire  _GEN_47 = 5'hd == pc_reg[6:2] ? V_reg_13 : _GEN_46; // @[if_stage.scala 87:69]
  wire  _GEN_48 = 5'he == pc_reg[6:2] ? V_reg_14 : _GEN_47; // @[if_stage.scala 87:69]
  wire  _GEN_49 = 5'hf == pc_reg[6:2] ? V_reg_15 : _GEN_48; // @[if_stage.scala 87:69]
  wire  _GEN_50 = 5'h10 == pc_reg[6:2] ? V_reg_16 : _GEN_49; // @[if_stage.scala 87:69]
  wire  _GEN_51 = 5'h11 == pc_reg[6:2] ? V_reg_17 : _GEN_50; // @[if_stage.scala 87:69]
  wire  _GEN_52 = 5'h12 == pc_reg[6:2] ? V_reg_18 : _GEN_51; // @[if_stage.scala 87:69]
  wire  _GEN_53 = 5'h13 == pc_reg[6:2] ? V_reg_19 : _GEN_52; // @[if_stage.scala 87:69]
  wire  _GEN_54 = 5'h14 == pc_reg[6:2] ? V_reg_20 : _GEN_53; // @[if_stage.scala 87:69]
  wire  _GEN_55 = 5'h15 == pc_reg[6:2] ? V_reg_21 : _GEN_54; // @[if_stage.scala 87:69]
  wire  _GEN_56 = 5'h16 == pc_reg[6:2] ? V_reg_22 : _GEN_55; // @[if_stage.scala 87:69]
  wire  _GEN_57 = 5'h17 == pc_reg[6:2] ? V_reg_23 : _GEN_56; // @[if_stage.scala 87:69]
  wire  _GEN_58 = 5'h18 == pc_reg[6:2] ? V_reg_24 : _GEN_57; // @[if_stage.scala 87:69]
  wire  _GEN_59 = 5'h19 == pc_reg[6:2] ? V_reg_25 : _GEN_58; // @[if_stage.scala 87:69]
  wire  _GEN_60 = 5'h1a == pc_reg[6:2] ? V_reg_26 : _GEN_59; // @[if_stage.scala 87:69]
  wire  _GEN_61 = 5'h1b == pc_reg[6:2] ? V_reg_27 : _GEN_60; // @[if_stage.scala 87:69]
  wire  _GEN_62 = 5'h1c == pc_reg[6:2] ? V_reg_28 : _GEN_61; // @[if_stage.scala 87:69]
  wire  _GEN_63 = 5'h1d == pc_reg[6:2] ? V_reg_29 : _GEN_62; // @[if_stage.scala 87:69]
  wire  _GEN_64 = 5'h1e == pc_reg[6:2] ? V_reg_30 : _GEN_63; // @[if_stage.scala 87:69]
  wire  _GEN_65 = 5'h1f == pc_reg[6:2] ? V_reg_31 : _GEN_64; // @[if_stage.scala 87:69]
  wire  _T_52 = _T_49 & _GEN_65; // @[if_stage.scala 87:47]
  wire [61:0] _GEN_67 = 5'h1 == pc_reg[6:2] ? BTA_reg_1 : BTA_reg_0; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_68 = 5'h2 == pc_reg[6:2] ? BTA_reg_2 : _GEN_67; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_69 = 5'h3 == pc_reg[6:2] ? BTA_reg_3 : _GEN_68; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_70 = 5'h4 == pc_reg[6:2] ? BTA_reg_4 : _GEN_69; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_71 = 5'h5 == pc_reg[6:2] ? BTA_reg_5 : _GEN_70; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_72 = 5'h6 == pc_reg[6:2] ? BTA_reg_6 : _GEN_71; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_73 = 5'h7 == pc_reg[6:2] ? BTA_reg_7 : _GEN_72; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_74 = 5'h8 == pc_reg[6:2] ? BTA_reg_8 : _GEN_73; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_75 = 5'h9 == pc_reg[6:2] ? BTA_reg_9 : _GEN_74; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_76 = 5'ha == pc_reg[6:2] ? BTA_reg_10 : _GEN_75; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_77 = 5'hb == pc_reg[6:2] ? BTA_reg_11 : _GEN_76; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_78 = 5'hc == pc_reg[6:2] ? BTA_reg_12 : _GEN_77; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_79 = 5'hd == pc_reg[6:2] ? BTA_reg_13 : _GEN_78; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_80 = 5'he == pc_reg[6:2] ? BTA_reg_14 : _GEN_79; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_81 = 5'hf == pc_reg[6:2] ? BTA_reg_15 : _GEN_80; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_82 = 5'h10 == pc_reg[6:2] ? BTA_reg_16 : _GEN_81; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_83 = 5'h11 == pc_reg[6:2] ? BTA_reg_17 : _GEN_82; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_84 = 5'h12 == pc_reg[6:2] ? BTA_reg_18 : _GEN_83; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_85 = 5'h13 == pc_reg[6:2] ? BTA_reg_19 : _GEN_84; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_86 = 5'h14 == pc_reg[6:2] ? BTA_reg_20 : _GEN_85; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_87 = 5'h15 == pc_reg[6:2] ? BTA_reg_21 : _GEN_86; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_88 = 5'h16 == pc_reg[6:2] ? BTA_reg_22 : _GEN_87; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_89 = 5'h17 == pc_reg[6:2] ? BTA_reg_23 : _GEN_88; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_90 = 5'h18 == pc_reg[6:2] ? BTA_reg_24 : _GEN_89; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_91 = 5'h19 == pc_reg[6:2] ? BTA_reg_25 : _GEN_90; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_92 = 5'h1a == pc_reg[6:2] ? BTA_reg_26 : _GEN_91; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_93 = 5'h1b == pc_reg[6:2] ? BTA_reg_27 : _GEN_92; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_94 = 5'h1c == pc_reg[6:2] ? BTA_reg_28 : _GEN_93; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_95 = 5'h1d == pc_reg[6:2] ? BTA_reg_29 : _GEN_94; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_96 = 5'h1e == pc_reg[6:2] ? BTA_reg_30 : _GEN_95; // @[if_stage.scala 89:39]
  wire [61:0] _GEN_97 = 5'h1f == pc_reg[6:2] ? BTA_reg_31 : _GEN_96; // @[if_stage.scala 89:39]
  wire [63:0] _GEN_1339 = {_GEN_97, 2'h0}; // @[if_stage.scala 89:39]
  wire [64:0] _T_54 = {{1'd0}, _GEN_1339}; // @[if_stage.scala 89:39]
  wire [1:0] _GEN_99 = 5'h1 == pc_reg[6:2] ? BHT_reg_1 : BHT_reg_0; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_100 = 5'h2 == pc_reg[6:2] ? BHT_reg_2 : _GEN_99; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_101 = 5'h3 == pc_reg[6:2] ? BHT_reg_3 : _GEN_100; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_102 = 5'h4 == pc_reg[6:2] ? BHT_reg_4 : _GEN_101; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_103 = 5'h5 == pc_reg[6:2] ? BHT_reg_5 : _GEN_102; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_104 = 5'h6 == pc_reg[6:2] ? BHT_reg_6 : _GEN_103; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_105 = 5'h7 == pc_reg[6:2] ? BHT_reg_7 : _GEN_104; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_106 = 5'h8 == pc_reg[6:2] ? BHT_reg_8 : _GEN_105; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_107 = 5'h9 == pc_reg[6:2] ? BHT_reg_9 : _GEN_106; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_108 = 5'ha == pc_reg[6:2] ? BHT_reg_10 : _GEN_107; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_109 = 5'hb == pc_reg[6:2] ? BHT_reg_11 : _GEN_108; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_110 = 5'hc == pc_reg[6:2] ? BHT_reg_12 : _GEN_109; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_111 = 5'hd == pc_reg[6:2] ? BHT_reg_13 : _GEN_110; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_112 = 5'he == pc_reg[6:2] ? BHT_reg_14 : _GEN_111; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_113 = 5'hf == pc_reg[6:2] ? BHT_reg_15 : _GEN_112; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_114 = 5'h10 == pc_reg[6:2] ? BHT_reg_16 : _GEN_113; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_115 = 5'h11 == pc_reg[6:2] ? BHT_reg_17 : _GEN_114; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_116 = 5'h12 == pc_reg[6:2] ? BHT_reg_18 : _GEN_115; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_117 = 5'h13 == pc_reg[6:2] ? BHT_reg_19 : _GEN_116; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_118 = 5'h14 == pc_reg[6:2] ? BHT_reg_20 : _GEN_117; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_119 = 5'h15 == pc_reg[6:2] ? BHT_reg_21 : _GEN_118; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_120 = 5'h16 == pc_reg[6:2] ? BHT_reg_22 : _GEN_119; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_121 = 5'h17 == pc_reg[6:2] ? BHT_reg_23 : _GEN_120; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_122 = 5'h18 == pc_reg[6:2] ? BHT_reg_24 : _GEN_121; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_123 = 5'h19 == pc_reg[6:2] ? BHT_reg_25 : _GEN_122; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_124 = 5'h1a == pc_reg[6:2] ? BHT_reg_26 : _GEN_123; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_125 = 5'h1b == pc_reg[6:2] ? BHT_reg_27 : _GEN_124; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_126 = 5'h1c == pc_reg[6:2] ? BHT_reg_28 : _GEN_125; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_127 = 5'h1d == pc_reg[6:2] ? BHT_reg_29 : _GEN_126; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_128 = 5'h1e == pc_reg[6:2] ? BHT_reg_30 : _GEN_127; // @[if_stage.scala 90:36]
  wire [1:0] _GEN_129 = 5'h1f == pc_reg[6:2] ? BHT_reg_31 : _GEN_128; // @[if_stage.scala 90:36]
  wire  _T_60 = ~_GEN_129[1]; // @[if_stage.scala 93:46]
  wire [63:0] _T_62 = pc_reg + 64'h4; // @[if_stage.scala 94:40]
  wire [63:0] _GEN_162 = _T_60 ? _T_62 : 64'h0; // @[if_stage.scala 93:54]
  wire [64:0] BTA = _T_52 ? _T_54 : 65'h0; // @[if_stage.scala 88:4]
  wire [64:0] _GEN_164 = _GEN_129[1] ? BTA : {{1'd0}, _GEN_162}; // @[if_stage.scala 90:48]
  wire [1:0] _GEN_165 = _GEN_129[1] ? 2'h3 : {{1'd0}, _T_60}; // @[if_stage.scala 90:48]
  wire [64:0] predicted_pc = _T_52 ? _GEN_164 : {{1'd0}, _T_62}; // @[if_stage.scala 88:4]
  wire  _T_65 = io_id_BTB_hit == 2'h3; // @[if_stage.scala 105:23]
  wire  _T_67 = _T_65 & io_jump_flag; // @[if_stage.scala 105:35]
  wire  _T_70 = io_stall[1] | io_stall[0]; // @[if_stage.scala 105:75]
  wire  _T_71 = ~_T_70; // @[if_stage.scala 105:89]
  wire  _T_72 = _T_67 & _T_71; // @[if_stage.scala 105:59]
  wire  _T_73 = io_flush | flush_reg; // @[if_stage.scala 105:111]
  wire  _T_74 = ~_T_73; // @[if_stage.scala 105:124]
  wire  _T_75 = _T_72 & _T_74; // @[if_stage.scala 105:98]
  wire [1:0] _GEN_170 = 5'h1 == io_id_pc[6:2] ? BHT_reg_1 : BHT_reg_0; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_171 = 5'h2 == io_id_pc[6:2] ? BHT_reg_2 : _GEN_170; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_172 = 5'h3 == io_id_pc[6:2] ? BHT_reg_3 : _GEN_171; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_173 = 5'h4 == io_id_pc[6:2] ? BHT_reg_4 : _GEN_172; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_174 = 5'h5 == io_id_pc[6:2] ? BHT_reg_5 : _GEN_173; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_175 = 5'h6 == io_id_pc[6:2] ? BHT_reg_6 : _GEN_174; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_176 = 5'h7 == io_id_pc[6:2] ? BHT_reg_7 : _GEN_175; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_177 = 5'h8 == io_id_pc[6:2] ? BHT_reg_8 : _GEN_176; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_178 = 5'h9 == io_id_pc[6:2] ? BHT_reg_9 : _GEN_177; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_179 = 5'ha == io_id_pc[6:2] ? BHT_reg_10 : _GEN_178; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_180 = 5'hb == io_id_pc[6:2] ? BHT_reg_11 : _GEN_179; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_181 = 5'hc == io_id_pc[6:2] ? BHT_reg_12 : _GEN_180; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_182 = 5'hd == io_id_pc[6:2] ? BHT_reg_13 : _GEN_181; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_183 = 5'he == io_id_pc[6:2] ? BHT_reg_14 : _GEN_182; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_184 = 5'hf == io_id_pc[6:2] ? BHT_reg_15 : _GEN_183; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_185 = 5'h10 == io_id_pc[6:2] ? BHT_reg_16 : _GEN_184; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_186 = 5'h11 == io_id_pc[6:2] ? BHT_reg_17 : _GEN_185; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_187 = 5'h12 == io_id_pc[6:2] ? BHT_reg_18 : _GEN_186; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_188 = 5'h13 == io_id_pc[6:2] ? BHT_reg_19 : _GEN_187; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_189 = 5'h14 == io_id_pc[6:2] ? BHT_reg_20 : _GEN_188; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_190 = 5'h15 == io_id_pc[6:2] ? BHT_reg_21 : _GEN_189; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_191 = 5'h16 == io_id_pc[6:2] ? BHT_reg_22 : _GEN_190; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_192 = 5'h17 == io_id_pc[6:2] ? BHT_reg_23 : _GEN_191; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_193 = 5'h18 == io_id_pc[6:2] ? BHT_reg_24 : _GEN_192; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_194 = 5'h19 == io_id_pc[6:2] ? BHT_reg_25 : _GEN_193; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_195 = 5'h1a == io_id_pc[6:2] ? BHT_reg_26 : _GEN_194; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_196 = 5'h1b == io_id_pc[6:2] ? BHT_reg_27 : _GEN_195; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_197 = 5'h1c == io_id_pc[6:2] ? BHT_reg_28 : _GEN_196; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_198 = 5'h1d == io_id_pc[6:2] ? BHT_reg_29 : _GEN_197; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_199 = 5'h1e == io_id_pc[6:2] ? BHT_reg_30 : _GEN_198; // @[if_stage.scala 110:39]
  wire [1:0] _GEN_200 = 5'h1f == io_id_pc[6:2] ? BHT_reg_31 : _GEN_199; // @[if_stage.scala 110:39]
  wire  _T_78 = _GEN_200 == 2'h3; // @[if_stage.scala 110:39]
  wire  _T_80 = _GEN_200 == 2'h2; // @[if_stage.scala 111:43]
  wire [1:0] _T_81 = _T_80 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_82 = _T_78 ? 2'h3 : _T_81; // @[Mux.scala 98:16]
  wire  _T_84 = ~io_jump_flag; // @[if_stage.scala 113:57]
  wire  _T_85 = _T_65 & _T_84; // @[if_stage.scala 113:41]
  wire  _T_90 = _T_85 & _T_71; // @[if_stage.scala 113:65]
  wire  _T_93 = _T_90 & _T_74; // @[if_stage.scala 113:104]
  wire [63:0] _T_95 = io_id_pc + 64'h4; // @[if_stage.scala 116:34]
  wire [1:0] _T_102 = _T_78 ? 2'h2 : {{1'd0}, _T_80}; // @[Mux.scala 98:16]
  wire  _T_103 = io_id_BTB_hit == 2'h1; // @[if_stage.scala 121:29]
  wire  _T_105 = _T_103 & _T_84; // @[if_stage.scala 121:41]
  wire  _T_110 = _T_105 & _T_71; // @[if_stage.scala 121:65]
  wire  _T_113 = _T_110 & _T_74; // @[if_stage.scala 121:104]
  wire  _T_116 = _GEN_200 == 2'h1; // @[if_stage.scala 126:39]
  wire  _T_118 = _GEN_200 == 2'h0; // @[if_stage.scala 127:43]
  wire  _T_123 = _T_103 & io_jump_flag; // @[if_stage.scala 129:41]
  wire  _T_128 = _T_123 & _T_71; // @[if_stage.scala 129:65]
  wire  _T_131 = _T_128 & _T_74; // @[if_stage.scala 129:104]
  wire [1:0] _T_138 = _T_116 ? 2'h2 : {{1'd0}, _T_118}; // @[Mux.scala 98:16]
  wire  _T_139 = io_id_BTB_hit == 2'h0; // @[if_stage.scala 137:29]
  wire  _T_141 = _T_139 & io_jump_inst; // @[if_stage.scala 137:41]
  wire  _T_146 = _T_141 & _T_71; // @[if_stage.scala 137:65]
  wire  _T_149 = _T_146 & _T_74; // @[if_stage.scala 137:104]
  wire  _GEN_1340 = 5'h0 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_553 = _GEN_1340 | V_reg_0; // @[if_stage.scala 140:32]
  wire  _GEN_1341 = 5'h1 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_554 = _GEN_1341 | V_reg_1; // @[if_stage.scala 140:32]
  wire  _GEN_1342 = 5'h2 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_555 = _GEN_1342 | V_reg_2; // @[if_stage.scala 140:32]
  wire  _GEN_1343 = 5'h3 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_556 = _GEN_1343 | V_reg_3; // @[if_stage.scala 140:32]
  wire  _GEN_1344 = 5'h4 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_557 = _GEN_1344 | V_reg_4; // @[if_stage.scala 140:32]
  wire  _GEN_1345 = 5'h5 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_558 = _GEN_1345 | V_reg_5; // @[if_stage.scala 140:32]
  wire  _GEN_1346 = 5'h6 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_559 = _GEN_1346 | V_reg_6; // @[if_stage.scala 140:32]
  wire  _GEN_1347 = 5'h7 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_560 = _GEN_1347 | V_reg_7; // @[if_stage.scala 140:32]
  wire  _GEN_1348 = 5'h8 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_561 = _GEN_1348 | V_reg_8; // @[if_stage.scala 140:32]
  wire  _GEN_1349 = 5'h9 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_562 = _GEN_1349 | V_reg_9; // @[if_stage.scala 140:32]
  wire  _GEN_1350 = 5'ha == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_563 = _GEN_1350 | V_reg_10; // @[if_stage.scala 140:32]
  wire  _GEN_1351 = 5'hb == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_564 = _GEN_1351 | V_reg_11; // @[if_stage.scala 140:32]
  wire  _GEN_1352 = 5'hc == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_565 = _GEN_1352 | V_reg_12; // @[if_stage.scala 140:32]
  wire  _GEN_1353 = 5'hd == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_566 = _GEN_1353 | V_reg_13; // @[if_stage.scala 140:32]
  wire  _GEN_1354 = 5'he == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_567 = _GEN_1354 | V_reg_14; // @[if_stage.scala 140:32]
  wire  _GEN_1355 = 5'hf == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_568 = _GEN_1355 | V_reg_15; // @[if_stage.scala 140:32]
  wire  _GEN_1356 = 5'h10 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_569 = _GEN_1356 | V_reg_16; // @[if_stage.scala 140:32]
  wire  _GEN_1357 = 5'h11 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_570 = _GEN_1357 | V_reg_17; // @[if_stage.scala 140:32]
  wire  _GEN_1358 = 5'h12 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_571 = _GEN_1358 | V_reg_18; // @[if_stage.scala 140:32]
  wire  _GEN_1359 = 5'h13 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_572 = _GEN_1359 | V_reg_19; // @[if_stage.scala 140:32]
  wire  _GEN_1360 = 5'h14 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_573 = _GEN_1360 | V_reg_20; // @[if_stage.scala 140:32]
  wire  _GEN_1361 = 5'h15 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_574 = _GEN_1361 | V_reg_21; // @[if_stage.scala 140:32]
  wire  _GEN_1362 = 5'h16 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_575 = _GEN_1362 | V_reg_22; // @[if_stage.scala 140:32]
  wire  _GEN_1363 = 5'h17 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_576 = _GEN_1363 | V_reg_23; // @[if_stage.scala 140:32]
  wire  _GEN_1364 = 5'h18 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_577 = _GEN_1364 | V_reg_24; // @[if_stage.scala 140:32]
  wire  _GEN_1365 = 5'h19 == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_578 = _GEN_1365 | V_reg_25; // @[if_stage.scala 140:32]
  wire  _GEN_1366 = 5'h1a == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_579 = _GEN_1366 | V_reg_26; // @[if_stage.scala 140:32]
  wire  _GEN_1367 = 5'h1b == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_580 = _GEN_1367 | V_reg_27; // @[if_stage.scala 140:32]
  wire  _GEN_1368 = 5'h1c == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_581 = _GEN_1368 | V_reg_28; // @[if_stage.scala 140:32]
  wire  _GEN_1369 = 5'h1d == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_582 = _GEN_1369 | V_reg_29; // @[if_stage.scala 140:32]
  wire  _GEN_1370 = 5'h1e == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_583 = _GEN_1370 | V_reg_30; // @[if_stage.scala 140:32]
  wire  _GEN_1371 = 5'h1f == io_id_pc[6:2]; // @[if_stage.scala 140:32]
  wire  _GEN_584 = _GEN_1371 | V_reg_31; // @[if_stage.scala 140:32]
  wire [63:0] _GEN_682 = io_jump_flag ? io_jump_addr : 64'h0; // @[if_stage.scala 144:37]
  wire  _GEN_811 = _T_149 & io_jump_flag; // @[if_stage.scala 137:138]
  wire [63:0] _GEN_812 = _T_149 ? _GEN_682 : 64'h0; // @[if_stage.scala 137:138]
  wire  _GEN_813 = _T_131 | _GEN_811; // @[if_stage.scala 129:138]
  wire [63:0] _GEN_814 = _T_131 ? io_jump_addr : _GEN_812; // @[if_stage.scala 129:138]
  wire  _GEN_943 = _T_113 ? 1'h0 : _GEN_813; // @[if_stage.scala 121:138]
  wire [63:0] _GEN_944 = _T_113 ? 64'h0 : _GEN_814; // @[if_stage.scala 121:138]
  wire  _GEN_1073 = _T_93 | _GEN_943; // @[if_stage.scala 113:138]
  wire [63:0] _GEN_1074 = _T_93 ? _T_95 : _GEN_944; // @[if_stage.scala 113:138]
  wire  BTB_false = _T_75 ? 1'h0 : _GEN_1073; // @[if_stage.scala 105:132]
  wire [63:0] correct_pc = _T_75 ? 64'h0 : _GEN_1074; // @[if_stage.scala 105:132]
  wire  _T_163 = BTB_false_reg & io_inst_req; // @[if_stage.scala 153:37]
  wire  _T_165 = _T_163 & io_inst_data_ok; // @[if_stage.scala 153:60]
  wire  _T_167 = _T_165 | io_flush; // @[if_stage.scala 153:87]
  wire  _GEN_1333 = _T_167 ? 1'h0 : BTB_false_reg; // @[if_stage.scala 153:107]
  wire  _GEN_1334 = BTB_false | _GEN_1333; // @[if_stage.scala 151:26]
  wire [64:0] _T_171 = BTB_false_reg ? {{1'd0}, correct_pc_reg} : predicted_pc; // @[Mux.scala 98:16]
  wire [64:0] pc_next = BTB_false ? {{1'd0}, correct_pc} : _T_171; // @[Mux.scala 98:16]
  wire  _T_172 = ~ice_reg; // @[if_stage.scala 175:16]
  wire  _T_178 = pc_stall & _T_8; // @[if_stage.scala 179:55]
  wire  _T_179 = io_stall[0] | _T_178; // @[if_stage.scala 179:34]
  wire [64:0] _GEN_1336 = _T_179 ? {{1'd0}, pc_reg} : pc_next; // @[if_stage.scala 179:99]
  wire [64:0] _GEN_1337 = io_flush ? {{1'd0}, io_excaddr} : _GEN_1336; // @[if_stage.scala 177:31]
  wire [64:0] _GEN_1338 = _T_172 ? 65'h0 : _GEN_1337; // @[if_stage.scala 175:24]
  wire  _T_181 = io_inst_o[6:0] == 7'hf; // @[if_stage.scala 188:37]
  wire  _T_183 = io_inst_o[14:12] == 3'h1; // @[if_stage.scala 188:76]
  wire  _T_184 = _T_181 & _T_183; // @[if_stage.scala 188:55]
  wire  _T_186 = io_inst_o[31:25] == 7'h0; // @[if_stage.scala 188:111]
  assign io_pc = ready_go ? pc_reg : 64'h0; // @[if_stage.scala 56:9]
  assign io_inst_o = _T_16 ? _T_23 : _T_35; // @[if_stage.scala 58:13]
  assign io_BTB_hit_o = _T_52 ? _GEN_165 : 2'h0; // @[if_stage.scala 102:17]
  assign io_BTB_false_o = BTB_false_reg | BTB_false; // @[if_stage.scala 149:18]
  assign io_inst_req = _T_3 ? 1'h0 : ice_reg; // @[if_stage.scala 49:15]
  assign io_iaddr = pc_reg; // @[if_stage.scala 51:12]
  assign io_icache_invalid = _T_184 & _T_186; // @[if_stage.scala 189:21]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ice_reg = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  pc_reg = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  flush_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  V_reg_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  V_reg_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  V_reg_2 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  V_reg_3 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  V_reg_4 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  V_reg_5 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  V_reg_6 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  V_reg_7 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  V_reg_8 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  V_reg_9 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  V_reg_10 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  V_reg_11 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  V_reg_12 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  V_reg_13 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  V_reg_14 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  V_reg_15 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  V_reg_16 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  V_reg_17 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  V_reg_18 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  V_reg_19 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  V_reg_20 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  V_reg_21 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  V_reg_22 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  V_reg_23 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  V_reg_24 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  V_reg_25 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  V_reg_26 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  V_reg_27 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  V_reg_28 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  V_reg_29 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  V_reg_30 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  V_reg_31 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  Tag_reg_0 = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  Tag_reg_1 = _RAND_36[7:0];
  _RAND_37 = {1{`RANDOM}};
  Tag_reg_2 = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  Tag_reg_3 = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  Tag_reg_4 = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  Tag_reg_5 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  Tag_reg_6 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  Tag_reg_7 = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  Tag_reg_8 = _RAND_43[7:0];
  _RAND_44 = {1{`RANDOM}};
  Tag_reg_9 = _RAND_44[7:0];
  _RAND_45 = {1{`RANDOM}};
  Tag_reg_10 = _RAND_45[7:0];
  _RAND_46 = {1{`RANDOM}};
  Tag_reg_11 = _RAND_46[7:0];
  _RAND_47 = {1{`RANDOM}};
  Tag_reg_12 = _RAND_47[7:0];
  _RAND_48 = {1{`RANDOM}};
  Tag_reg_13 = _RAND_48[7:0];
  _RAND_49 = {1{`RANDOM}};
  Tag_reg_14 = _RAND_49[7:0];
  _RAND_50 = {1{`RANDOM}};
  Tag_reg_15 = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  Tag_reg_16 = _RAND_51[7:0];
  _RAND_52 = {1{`RANDOM}};
  Tag_reg_17 = _RAND_52[7:0];
  _RAND_53 = {1{`RANDOM}};
  Tag_reg_18 = _RAND_53[7:0];
  _RAND_54 = {1{`RANDOM}};
  Tag_reg_19 = _RAND_54[7:0];
  _RAND_55 = {1{`RANDOM}};
  Tag_reg_20 = _RAND_55[7:0];
  _RAND_56 = {1{`RANDOM}};
  Tag_reg_21 = _RAND_56[7:0];
  _RAND_57 = {1{`RANDOM}};
  Tag_reg_22 = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  Tag_reg_23 = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  Tag_reg_24 = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  Tag_reg_25 = _RAND_60[7:0];
  _RAND_61 = {1{`RANDOM}};
  Tag_reg_26 = _RAND_61[7:0];
  _RAND_62 = {1{`RANDOM}};
  Tag_reg_27 = _RAND_62[7:0];
  _RAND_63 = {1{`RANDOM}};
  Tag_reg_28 = _RAND_63[7:0];
  _RAND_64 = {1{`RANDOM}};
  Tag_reg_29 = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  Tag_reg_30 = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  Tag_reg_31 = _RAND_66[7:0];
  _RAND_67 = {2{`RANDOM}};
  BTA_reg_0 = _RAND_67[61:0];
  _RAND_68 = {2{`RANDOM}};
  BTA_reg_1 = _RAND_68[61:0];
  _RAND_69 = {2{`RANDOM}};
  BTA_reg_2 = _RAND_69[61:0];
  _RAND_70 = {2{`RANDOM}};
  BTA_reg_3 = _RAND_70[61:0];
  _RAND_71 = {2{`RANDOM}};
  BTA_reg_4 = _RAND_71[61:0];
  _RAND_72 = {2{`RANDOM}};
  BTA_reg_5 = _RAND_72[61:0];
  _RAND_73 = {2{`RANDOM}};
  BTA_reg_6 = _RAND_73[61:0];
  _RAND_74 = {2{`RANDOM}};
  BTA_reg_7 = _RAND_74[61:0];
  _RAND_75 = {2{`RANDOM}};
  BTA_reg_8 = _RAND_75[61:0];
  _RAND_76 = {2{`RANDOM}};
  BTA_reg_9 = _RAND_76[61:0];
  _RAND_77 = {2{`RANDOM}};
  BTA_reg_10 = _RAND_77[61:0];
  _RAND_78 = {2{`RANDOM}};
  BTA_reg_11 = _RAND_78[61:0];
  _RAND_79 = {2{`RANDOM}};
  BTA_reg_12 = _RAND_79[61:0];
  _RAND_80 = {2{`RANDOM}};
  BTA_reg_13 = _RAND_80[61:0];
  _RAND_81 = {2{`RANDOM}};
  BTA_reg_14 = _RAND_81[61:0];
  _RAND_82 = {2{`RANDOM}};
  BTA_reg_15 = _RAND_82[61:0];
  _RAND_83 = {2{`RANDOM}};
  BTA_reg_16 = _RAND_83[61:0];
  _RAND_84 = {2{`RANDOM}};
  BTA_reg_17 = _RAND_84[61:0];
  _RAND_85 = {2{`RANDOM}};
  BTA_reg_18 = _RAND_85[61:0];
  _RAND_86 = {2{`RANDOM}};
  BTA_reg_19 = _RAND_86[61:0];
  _RAND_87 = {2{`RANDOM}};
  BTA_reg_20 = _RAND_87[61:0];
  _RAND_88 = {2{`RANDOM}};
  BTA_reg_21 = _RAND_88[61:0];
  _RAND_89 = {2{`RANDOM}};
  BTA_reg_22 = _RAND_89[61:0];
  _RAND_90 = {2{`RANDOM}};
  BTA_reg_23 = _RAND_90[61:0];
  _RAND_91 = {2{`RANDOM}};
  BTA_reg_24 = _RAND_91[61:0];
  _RAND_92 = {2{`RANDOM}};
  BTA_reg_25 = _RAND_92[61:0];
  _RAND_93 = {2{`RANDOM}};
  BTA_reg_26 = _RAND_93[61:0];
  _RAND_94 = {2{`RANDOM}};
  BTA_reg_27 = _RAND_94[61:0];
  _RAND_95 = {2{`RANDOM}};
  BTA_reg_28 = _RAND_95[61:0];
  _RAND_96 = {2{`RANDOM}};
  BTA_reg_29 = _RAND_96[61:0];
  _RAND_97 = {2{`RANDOM}};
  BTA_reg_30 = _RAND_97[61:0];
  _RAND_98 = {2{`RANDOM}};
  BTA_reg_31 = _RAND_98[61:0];
  _RAND_99 = {1{`RANDOM}};
  BHT_reg_0 = _RAND_99[1:0];
  _RAND_100 = {1{`RANDOM}};
  BHT_reg_1 = _RAND_100[1:0];
  _RAND_101 = {1{`RANDOM}};
  BHT_reg_2 = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  BHT_reg_3 = _RAND_102[1:0];
  _RAND_103 = {1{`RANDOM}};
  BHT_reg_4 = _RAND_103[1:0];
  _RAND_104 = {1{`RANDOM}};
  BHT_reg_5 = _RAND_104[1:0];
  _RAND_105 = {1{`RANDOM}};
  BHT_reg_6 = _RAND_105[1:0];
  _RAND_106 = {1{`RANDOM}};
  BHT_reg_7 = _RAND_106[1:0];
  _RAND_107 = {1{`RANDOM}};
  BHT_reg_8 = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  BHT_reg_9 = _RAND_108[1:0];
  _RAND_109 = {1{`RANDOM}};
  BHT_reg_10 = _RAND_109[1:0];
  _RAND_110 = {1{`RANDOM}};
  BHT_reg_11 = _RAND_110[1:0];
  _RAND_111 = {1{`RANDOM}};
  BHT_reg_12 = _RAND_111[1:0];
  _RAND_112 = {1{`RANDOM}};
  BHT_reg_13 = _RAND_112[1:0];
  _RAND_113 = {1{`RANDOM}};
  BHT_reg_14 = _RAND_113[1:0];
  _RAND_114 = {1{`RANDOM}};
  BHT_reg_15 = _RAND_114[1:0];
  _RAND_115 = {1{`RANDOM}};
  BHT_reg_16 = _RAND_115[1:0];
  _RAND_116 = {1{`RANDOM}};
  BHT_reg_17 = _RAND_116[1:0];
  _RAND_117 = {1{`RANDOM}};
  BHT_reg_18 = _RAND_117[1:0];
  _RAND_118 = {1{`RANDOM}};
  BHT_reg_19 = _RAND_118[1:0];
  _RAND_119 = {1{`RANDOM}};
  BHT_reg_20 = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  BHT_reg_21 = _RAND_120[1:0];
  _RAND_121 = {1{`RANDOM}};
  BHT_reg_22 = _RAND_121[1:0];
  _RAND_122 = {1{`RANDOM}};
  BHT_reg_23 = _RAND_122[1:0];
  _RAND_123 = {1{`RANDOM}};
  BHT_reg_24 = _RAND_123[1:0];
  _RAND_124 = {1{`RANDOM}};
  BHT_reg_25 = _RAND_124[1:0];
  _RAND_125 = {1{`RANDOM}};
  BHT_reg_26 = _RAND_125[1:0];
  _RAND_126 = {1{`RANDOM}};
  BHT_reg_27 = _RAND_126[1:0];
  _RAND_127 = {1{`RANDOM}};
  BHT_reg_28 = _RAND_127[1:0];
  _RAND_128 = {1{`RANDOM}};
  BHT_reg_29 = _RAND_128[1:0];
  _RAND_129 = {1{`RANDOM}};
  BHT_reg_30 = _RAND_129[1:0];
  _RAND_130 = {1{`RANDOM}};
  BHT_reg_31 = _RAND_130[1:0];
  _RAND_131 = {1{`RANDOM}};
  BTB_false_reg = _RAND_131[0:0];
  _RAND_132 = {2{`RANDOM}};
  correct_pc_reg = _RAND_132[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      ice_reg <= 1'h0;
    end else begin
      ice_reg <= 1'h1;
    end
    if (reset) begin
      pc_reg <= 64'h0;
    end else begin
      pc_reg <= _GEN_1338[63:0];
    end
    if (reset) begin
      flush_reg <= 1'h0;
    end else begin
      flush_reg <= _GEN_1;
    end
    if (reset) begin
      V_reg_0 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_0 <= _GEN_553;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_1 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_1 <= _GEN_554;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_2 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_2 <= _GEN_555;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_3 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_3 <= _GEN_556;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_4 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_4 <= _GEN_557;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_5 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_5 <= _GEN_558;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_6 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_6 <= _GEN_559;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_7 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_7 <= _GEN_560;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_8 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_8 <= _GEN_561;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_9 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_9 <= _GEN_562;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_10 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_10 <= _GEN_563;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_11 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_11 <= _GEN_564;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_12 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_12 <= _GEN_565;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_13 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_13 <= _GEN_566;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_14 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_14 <= _GEN_567;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_15 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_15 <= _GEN_568;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_16 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_16 <= _GEN_569;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_17 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_17 <= _GEN_570;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_18 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_18 <= _GEN_571;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_19 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_19 <= _GEN_572;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_20 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_20 <= _GEN_573;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_21 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_21 <= _GEN_574;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_22 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_22 <= _GEN_575;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_23 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_23 <= _GEN_576;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_24 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_24 <= _GEN_577;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_25 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_25 <= _GEN_578;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_26 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_26 <= _GEN_579;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_27 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_27 <= _GEN_580;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_28 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_28 <= _GEN_581;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_29 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_29 <= _GEN_582;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_30 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_30 <= _GEN_583;
            end
          end
        end
      end
    end
    if (reset) begin
      V_reg_31 <= 1'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              V_reg_31 <= _GEN_584;
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_0 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h0 == io_id_pc[6:2]) begin
                Tag_reg_0 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_1 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1 == io_id_pc[6:2]) begin
                Tag_reg_1 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_2 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h2 == io_id_pc[6:2]) begin
                Tag_reg_2 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_3 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h3 == io_id_pc[6:2]) begin
                Tag_reg_3 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_4 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h4 == io_id_pc[6:2]) begin
                Tag_reg_4 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_5 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h5 == io_id_pc[6:2]) begin
                Tag_reg_5 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_6 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h6 == io_id_pc[6:2]) begin
                Tag_reg_6 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_7 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h7 == io_id_pc[6:2]) begin
                Tag_reg_7 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_8 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h8 == io_id_pc[6:2]) begin
                Tag_reg_8 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_9 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h9 == io_id_pc[6:2]) begin
                Tag_reg_9 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_10 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'ha == io_id_pc[6:2]) begin
                Tag_reg_10 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_11 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'hb == io_id_pc[6:2]) begin
                Tag_reg_11 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_12 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'hc == io_id_pc[6:2]) begin
                Tag_reg_12 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_13 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'hd == io_id_pc[6:2]) begin
                Tag_reg_13 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_14 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'he == io_id_pc[6:2]) begin
                Tag_reg_14 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_15 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'hf == io_id_pc[6:2]) begin
                Tag_reg_15 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_16 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h10 == io_id_pc[6:2]) begin
                Tag_reg_16 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_17 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h11 == io_id_pc[6:2]) begin
                Tag_reg_17 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_18 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h12 == io_id_pc[6:2]) begin
                Tag_reg_18 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_19 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h13 == io_id_pc[6:2]) begin
                Tag_reg_19 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_20 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h14 == io_id_pc[6:2]) begin
                Tag_reg_20 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_21 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h15 == io_id_pc[6:2]) begin
                Tag_reg_21 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_22 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h16 == io_id_pc[6:2]) begin
                Tag_reg_22 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_23 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h17 == io_id_pc[6:2]) begin
                Tag_reg_23 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_24 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h18 == io_id_pc[6:2]) begin
                Tag_reg_24 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_25 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h19 == io_id_pc[6:2]) begin
                Tag_reg_25 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_26 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1a == io_id_pc[6:2]) begin
                Tag_reg_26 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_27 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1b == io_id_pc[6:2]) begin
                Tag_reg_27 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_28 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1c == io_id_pc[6:2]) begin
                Tag_reg_28 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_29 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1d == io_id_pc[6:2]) begin
                Tag_reg_29 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_30 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1e == io_id_pc[6:2]) begin
                Tag_reg_30 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      Tag_reg_31 <= 8'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1f == io_id_pc[6:2]) begin
                Tag_reg_31 <= io_id_pc[14:7];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_0 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h0 == io_id_pc[6:2]) begin
                BTA_reg_0 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_1 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1 == io_id_pc[6:2]) begin
                BTA_reg_1 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_2 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h2 == io_id_pc[6:2]) begin
                BTA_reg_2 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_3 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h3 == io_id_pc[6:2]) begin
                BTA_reg_3 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_4 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h4 == io_id_pc[6:2]) begin
                BTA_reg_4 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_5 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h5 == io_id_pc[6:2]) begin
                BTA_reg_5 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_6 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h6 == io_id_pc[6:2]) begin
                BTA_reg_6 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_7 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h7 == io_id_pc[6:2]) begin
                BTA_reg_7 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_8 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h8 == io_id_pc[6:2]) begin
                BTA_reg_8 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_9 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h9 == io_id_pc[6:2]) begin
                BTA_reg_9 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_10 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'ha == io_id_pc[6:2]) begin
                BTA_reg_10 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_11 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'hb == io_id_pc[6:2]) begin
                BTA_reg_11 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_12 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'hc == io_id_pc[6:2]) begin
                BTA_reg_12 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_13 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'hd == io_id_pc[6:2]) begin
                BTA_reg_13 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_14 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'he == io_id_pc[6:2]) begin
                BTA_reg_14 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_15 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'hf == io_id_pc[6:2]) begin
                BTA_reg_15 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_16 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h10 == io_id_pc[6:2]) begin
                BTA_reg_16 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_17 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h11 == io_id_pc[6:2]) begin
                BTA_reg_17 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_18 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h12 == io_id_pc[6:2]) begin
                BTA_reg_18 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_19 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h13 == io_id_pc[6:2]) begin
                BTA_reg_19 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_20 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h14 == io_id_pc[6:2]) begin
                BTA_reg_20 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_21 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h15 == io_id_pc[6:2]) begin
                BTA_reg_21 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_22 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h16 == io_id_pc[6:2]) begin
                BTA_reg_22 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_23 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h17 == io_id_pc[6:2]) begin
                BTA_reg_23 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_24 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h18 == io_id_pc[6:2]) begin
                BTA_reg_24 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_25 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h19 == io_id_pc[6:2]) begin
                BTA_reg_25 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_26 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1a == io_id_pc[6:2]) begin
                BTA_reg_26 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_27 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1b == io_id_pc[6:2]) begin
                BTA_reg_27 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_28 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1c == io_id_pc[6:2]) begin
                BTA_reg_28 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_29 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1d == io_id_pc[6:2]) begin
                BTA_reg_29 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_30 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1e == io_id_pc[6:2]) begin
                BTA_reg_30 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BTA_reg_31 <= 62'h0;
    end else if (!(_T_75)) begin
      if (!(_T_93)) begin
        if (!(_T_113)) begin
          if (!(_T_131)) begin
            if (_T_149) begin
              if (5'h1f == io_id_pc[6:2]) begin
                BTA_reg_31 <= io_jump_addr[63:2];
              end
            end
          end
        end
      end
    end
    if (reset) begin
      BHT_reg_0 <= 2'h0;
    end else if (_T_75) begin
      if (5'h0 == io_id_pc[6:2]) begin
        if (_T_78) begin
          BHT_reg_0 <= 2'h3;
        end else if (_T_80) begin
          BHT_reg_0 <= 2'h3;
        end else begin
          BHT_reg_0 <= 2'h0;
        end
      end
    end else if (_T_93) begin
      if (5'h0 == io_id_pc[6:2]) begin
        if (_T_78) begin
          BHT_reg_0 <= 2'h2;
        end else begin
          BHT_reg_0 <= {{1'd0}, _T_80};
        end
      end
    end else if (_T_113) begin
      if (5'h0 == io_id_pc[6:2]) begin
        BHT_reg_0 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h0 == io_id_pc[6:2]) begin
        if (_T_116) begin
          BHT_reg_0 <= 2'h2;
        end else begin
          BHT_reg_0 <= {{1'd0}, _T_118};
        end
      end
    end else if (_T_149) begin
      if (5'h0 == io_id_pc[6:2]) begin
        BHT_reg_0 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_1 <= 2'h0;
    end else if (_T_75) begin
      if (5'h1 == io_id_pc[6:2]) begin
        if (_T_78) begin
          BHT_reg_1 <= 2'h3;
        end else if (_T_80) begin
          BHT_reg_1 <= 2'h3;
        end else begin
          BHT_reg_1 <= 2'h0;
        end
      end
    end else if (_T_93) begin
      if (5'h1 == io_id_pc[6:2]) begin
        if (_T_78) begin
          BHT_reg_1 <= 2'h2;
        end else begin
          BHT_reg_1 <= {{1'd0}, _T_80};
        end
      end
    end else if (_T_113) begin
      if (5'h1 == io_id_pc[6:2]) begin
        BHT_reg_1 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h1 == io_id_pc[6:2]) begin
        if (_T_116) begin
          BHT_reg_1 <= 2'h2;
        end else begin
          BHT_reg_1 <= {{1'd0}, _T_118};
        end
      end
    end else if (_T_149) begin
      if (5'h1 == io_id_pc[6:2]) begin
        BHT_reg_1 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_2 <= 2'h0;
    end else if (_T_75) begin
      if (5'h2 == io_id_pc[6:2]) begin
        if (_T_78) begin
          BHT_reg_2 <= 2'h3;
        end else if (_T_80) begin
          BHT_reg_2 <= 2'h3;
        end else begin
          BHT_reg_2 <= 2'h0;
        end
      end
    end else if (_T_93) begin
      if (5'h2 == io_id_pc[6:2]) begin
        if (_T_78) begin
          BHT_reg_2 <= 2'h2;
        end else begin
          BHT_reg_2 <= {{1'd0}, _T_80};
        end
      end
    end else if (_T_113) begin
      if (5'h2 == io_id_pc[6:2]) begin
        BHT_reg_2 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h2 == io_id_pc[6:2]) begin
        if (_T_116) begin
          BHT_reg_2 <= 2'h2;
        end else begin
          BHT_reg_2 <= {{1'd0}, _T_118};
        end
      end
    end else if (_T_149) begin
      if (5'h2 == io_id_pc[6:2]) begin
        BHT_reg_2 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_3 <= 2'h0;
    end else if (_T_75) begin
      if (5'h3 == io_id_pc[6:2]) begin
        if (_T_78) begin
          BHT_reg_3 <= 2'h3;
        end else if (_T_80) begin
          BHT_reg_3 <= 2'h3;
        end else begin
          BHT_reg_3 <= 2'h0;
        end
      end
    end else if (_T_93) begin
      if (5'h3 == io_id_pc[6:2]) begin
        if (_T_78) begin
          BHT_reg_3 <= 2'h2;
        end else begin
          BHT_reg_3 <= {{1'd0}, _T_80};
        end
      end
    end else if (_T_113) begin
      if (5'h3 == io_id_pc[6:2]) begin
        BHT_reg_3 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h3 == io_id_pc[6:2]) begin
        if (_T_116) begin
          BHT_reg_3 <= 2'h2;
        end else begin
          BHT_reg_3 <= {{1'd0}, _T_118};
        end
      end
    end else if (_T_149) begin
      if (5'h3 == io_id_pc[6:2]) begin
        BHT_reg_3 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_4 <= 2'h0;
    end else if (_T_75) begin
      if (5'h4 == io_id_pc[6:2]) begin
        BHT_reg_4 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h4 == io_id_pc[6:2]) begin
        BHT_reg_4 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h4 == io_id_pc[6:2]) begin
        BHT_reg_4 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h4 == io_id_pc[6:2]) begin
        BHT_reg_4 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h4 == io_id_pc[6:2]) begin
        BHT_reg_4 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_5 <= 2'h0;
    end else if (_T_75) begin
      if (5'h5 == io_id_pc[6:2]) begin
        BHT_reg_5 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h5 == io_id_pc[6:2]) begin
        BHT_reg_5 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h5 == io_id_pc[6:2]) begin
        BHT_reg_5 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h5 == io_id_pc[6:2]) begin
        BHT_reg_5 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h5 == io_id_pc[6:2]) begin
        BHT_reg_5 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_6 <= 2'h0;
    end else if (_T_75) begin
      if (5'h6 == io_id_pc[6:2]) begin
        BHT_reg_6 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h6 == io_id_pc[6:2]) begin
        BHT_reg_6 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h6 == io_id_pc[6:2]) begin
        BHT_reg_6 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h6 == io_id_pc[6:2]) begin
        BHT_reg_6 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h6 == io_id_pc[6:2]) begin
        BHT_reg_6 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_7 <= 2'h0;
    end else if (_T_75) begin
      if (5'h7 == io_id_pc[6:2]) begin
        BHT_reg_7 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h7 == io_id_pc[6:2]) begin
        BHT_reg_7 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h7 == io_id_pc[6:2]) begin
        BHT_reg_7 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h7 == io_id_pc[6:2]) begin
        BHT_reg_7 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h7 == io_id_pc[6:2]) begin
        BHT_reg_7 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_8 <= 2'h0;
    end else if (_T_75) begin
      if (5'h8 == io_id_pc[6:2]) begin
        BHT_reg_8 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h8 == io_id_pc[6:2]) begin
        BHT_reg_8 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h8 == io_id_pc[6:2]) begin
        BHT_reg_8 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h8 == io_id_pc[6:2]) begin
        BHT_reg_8 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h8 == io_id_pc[6:2]) begin
        BHT_reg_8 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_9 <= 2'h0;
    end else if (_T_75) begin
      if (5'h9 == io_id_pc[6:2]) begin
        BHT_reg_9 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h9 == io_id_pc[6:2]) begin
        BHT_reg_9 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h9 == io_id_pc[6:2]) begin
        BHT_reg_9 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h9 == io_id_pc[6:2]) begin
        BHT_reg_9 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h9 == io_id_pc[6:2]) begin
        BHT_reg_9 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_10 <= 2'h0;
    end else if (_T_75) begin
      if (5'ha == io_id_pc[6:2]) begin
        BHT_reg_10 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'ha == io_id_pc[6:2]) begin
        BHT_reg_10 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'ha == io_id_pc[6:2]) begin
        BHT_reg_10 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'ha == io_id_pc[6:2]) begin
        BHT_reg_10 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'ha == io_id_pc[6:2]) begin
        BHT_reg_10 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_11 <= 2'h0;
    end else if (_T_75) begin
      if (5'hb == io_id_pc[6:2]) begin
        BHT_reg_11 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'hb == io_id_pc[6:2]) begin
        BHT_reg_11 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'hb == io_id_pc[6:2]) begin
        BHT_reg_11 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'hb == io_id_pc[6:2]) begin
        BHT_reg_11 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'hb == io_id_pc[6:2]) begin
        BHT_reg_11 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_12 <= 2'h0;
    end else if (_T_75) begin
      if (5'hc == io_id_pc[6:2]) begin
        BHT_reg_12 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'hc == io_id_pc[6:2]) begin
        BHT_reg_12 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'hc == io_id_pc[6:2]) begin
        BHT_reg_12 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'hc == io_id_pc[6:2]) begin
        BHT_reg_12 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'hc == io_id_pc[6:2]) begin
        BHT_reg_12 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_13 <= 2'h0;
    end else if (_T_75) begin
      if (5'hd == io_id_pc[6:2]) begin
        BHT_reg_13 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'hd == io_id_pc[6:2]) begin
        BHT_reg_13 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'hd == io_id_pc[6:2]) begin
        BHT_reg_13 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'hd == io_id_pc[6:2]) begin
        BHT_reg_13 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'hd == io_id_pc[6:2]) begin
        BHT_reg_13 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_14 <= 2'h0;
    end else if (_T_75) begin
      if (5'he == io_id_pc[6:2]) begin
        BHT_reg_14 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'he == io_id_pc[6:2]) begin
        BHT_reg_14 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'he == io_id_pc[6:2]) begin
        BHT_reg_14 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'he == io_id_pc[6:2]) begin
        BHT_reg_14 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'he == io_id_pc[6:2]) begin
        BHT_reg_14 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_15 <= 2'h0;
    end else if (_T_75) begin
      if (5'hf == io_id_pc[6:2]) begin
        BHT_reg_15 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'hf == io_id_pc[6:2]) begin
        BHT_reg_15 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'hf == io_id_pc[6:2]) begin
        BHT_reg_15 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'hf == io_id_pc[6:2]) begin
        BHT_reg_15 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'hf == io_id_pc[6:2]) begin
        BHT_reg_15 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_16 <= 2'h0;
    end else if (_T_75) begin
      if (5'h10 == io_id_pc[6:2]) begin
        BHT_reg_16 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h10 == io_id_pc[6:2]) begin
        BHT_reg_16 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h10 == io_id_pc[6:2]) begin
        BHT_reg_16 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h10 == io_id_pc[6:2]) begin
        BHT_reg_16 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h10 == io_id_pc[6:2]) begin
        BHT_reg_16 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_17 <= 2'h0;
    end else if (_T_75) begin
      if (5'h11 == io_id_pc[6:2]) begin
        BHT_reg_17 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h11 == io_id_pc[6:2]) begin
        BHT_reg_17 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h11 == io_id_pc[6:2]) begin
        BHT_reg_17 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h11 == io_id_pc[6:2]) begin
        BHT_reg_17 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h11 == io_id_pc[6:2]) begin
        BHT_reg_17 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_18 <= 2'h0;
    end else if (_T_75) begin
      if (5'h12 == io_id_pc[6:2]) begin
        BHT_reg_18 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h12 == io_id_pc[6:2]) begin
        BHT_reg_18 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h12 == io_id_pc[6:2]) begin
        BHT_reg_18 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h12 == io_id_pc[6:2]) begin
        BHT_reg_18 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h12 == io_id_pc[6:2]) begin
        BHT_reg_18 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_19 <= 2'h0;
    end else if (_T_75) begin
      if (5'h13 == io_id_pc[6:2]) begin
        BHT_reg_19 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h13 == io_id_pc[6:2]) begin
        BHT_reg_19 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h13 == io_id_pc[6:2]) begin
        BHT_reg_19 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h13 == io_id_pc[6:2]) begin
        BHT_reg_19 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h13 == io_id_pc[6:2]) begin
        BHT_reg_19 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_20 <= 2'h0;
    end else if (_T_75) begin
      if (5'h14 == io_id_pc[6:2]) begin
        BHT_reg_20 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h14 == io_id_pc[6:2]) begin
        BHT_reg_20 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h14 == io_id_pc[6:2]) begin
        BHT_reg_20 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h14 == io_id_pc[6:2]) begin
        BHT_reg_20 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h14 == io_id_pc[6:2]) begin
        BHT_reg_20 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_21 <= 2'h0;
    end else if (_T_75) begin
      if (5'h15 == io_id_pc[6:2]) begin
        BHT_reg_21 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h15 == io_id_pc[6:2]) begin
        BHT_reg_21 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h15 == io_id_pc[6:2]) begin
        BHT_reg_21 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h15 == io_id_pc[6:2]) begin
        BHT_reg_21 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h15 == io_id_pc[6:2]) begin
        BHT_reg_21 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_22 <= 2'h0;
    end else if (_T_75) begin
      if (5'h16 == io_id_pc[6:2]) begin
        BHT_reg_22 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h16 == io_id_pc[6:2]) begin
        BHT_reg_22 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h16 == io_id_pc[6:2]) begin
        BHT_reg_22 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h16 == io_id_pc[6:2]) begin
        BHT_reg_22 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h16 == io_id_pc[6:2]) begin
        BHT_reg_22 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_23 <= 2'h0;
    end else if (_T_75) begin
      if (5'h17 == io_id_pc[6:2]) begin
        BHT_reg_23 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h17 == io_id_pc[6:2]) begin
        BHT_reg_23 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h17 == io_id_pc[6:2]) begin
        BHT_reg_23 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h17 == io_id_pc[6:2]) begin
        BHT_reg_23 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h17 == io_id_pc[6:2]) begin
        BHT_reg_23 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_24 <= 2'h0;
    end else if (_T_75) begin
      if (5'h18 == io_id_pc[6:2]) begin
        BHT_reg_24 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h18 == io_id_pc[6:2]) begin
        BHT_reg_24 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h18 == io_id_pc[6:2]) begin
        BHT_reg_24 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h18 == io_id_pc[6:2]) begin
        BHT_reg_24 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h18 == io_id_pc[6:2]) begin
        BHT_reg_24 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_25 <= 2'h0;
    end else if (_T_75) begin
      if (5'h19 == io_id_pc[6:2]) begin
        BHT_reg_25 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h19 == io_id_pc[6:2]) begin
        BHT_reg_25 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h19 == io_id_pc[6:2]) begin
        BHT_reg_25 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h19 == io_id_pc[6:2]) begin
        BHT_reg_25 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h19 == io_id_pc[6:2]) begin
        BHT_reg_25 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_26 <= 2'h0;
    end else if (_T_75) begin
      if (5'h1a == io_id_pc[6:2]) begin
        BHT_reg_26 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h1a == io_id_pc[6:2]) begin
        BHT_reg_26 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h1a == io_id_pc[6:2]) begin
        BHT_reg_26 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h1a == io_id_pc[6:2]) begin
        BHT_reg_26 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h1a == io_id_pc[6:2]) begin
        BHT_reg_26 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_27 <= 2'h0;
    end else if (_T_75) begin
      if (5'h1b == io_id_pc[6:2]) begin
        BHT_reg_27 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h1b == io_id_pc[6:2]) begin
        BHT_reg_27 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h1b == io_id_pc[6:2]) begin
        BHT_reg_27 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h1b == io_id_pc[6:2]) begin
        BHT_reg_27 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h1b == io_id_pc[6:2]) begin
        BHT_reg_27 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_28 <= 2'h0;
    end else if (_T_75) begin
      if (5'h1c == io_id_pc[6:2]) begin
        BHT_reg_28 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h1c == io_id_pc[6:2]) begin
        BHT_reg_28 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h1c == io_id_pc[6:2]) begin
        BHT_reg_28 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h1c == io_id_pc[6:2]) begin
        BHT_reg_28 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h1c == io_id_pc[6:2]) begin
        BHT_reg_28 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_29 <= 2'h0;
    end else if (_T_75) begin
      if (5'h1d == io_id_pc[6:2]) begin
        BHT_reg_29 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h1d == io_id_pc[6:2]) begin
        BHT_reg_29 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h1d == io_id_pc[6:2]) begin
        BHT_reg_29 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h1d == io_id_pc[6:2]) begin
        BHT_reg_29 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h1d == io_id_pc[6:2]) begin
        BHT_reg_29 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_30 <= 2'h0;
    end else if (_T_75) begin
      if (5'h1e == io_id_pc[6:2]) begin
        BHT_reg_30 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h1e == io_id_pc[6:2]) begin
        BHT_reg_30 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h1e == io_id_pc[6:2]) begin
        BHT_reg_30 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h1e == io_id_pc[6:2]) begin
        BHT_reg_30 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h1e == io_id_pc[6:2]) begin
        BHT_reg_30 <= 2'h1;
      end
    end
    if (reset) begin
      BHT_reg_31 <= 2'h0;
    end else if (_T_75) begin
      if (5'h1f == io_id_pc[6:2]) begin
        BHT_reg_31 <= _T_82;
      end
    end else if (_T_93) begin
      if (5'h1f == io_id_pc[6:2]) begin
        BHT_reg_31 <= _T_102;
      end
    end else if (_T_113) begin
      if (5'h1f == io_id_pc[6:2]) begin
        BHT_reg_31 <= 2'h0;
      end
    end else if (_T_131) begin
      if (5'h1f == io_id_pc[6:2]) begin
        BHT_reg_31 <= _T_138;
      end
    end else if (_T_149) begin
      if (5'h1f == io_id_pc[6:2]) begin
        BHT_reg_31 <= 2'h1;
      end
    end
    if (reset) begin
      BTB_false_reg <= 1'h0;
    end else begin
      BTB_false_reg <= _GEN_1334;
    end
    if (reset) begin
      correct_pc_reg <= 64'h0;
    end else if (!(BTB_false_reg)) begin
      if (_T_75) begin
        correct_pc_reg <= 64'h0;
      end else if (_T_93) begin
        correct_pc_reg <= _T_95;
      end else if (_T_113) begin
        correct_pc_reg <= 64'h0;
      end else if (_T_131) begin
        correct_pc_reg <= io_jump_addr;
      end else if (_T_149) begin
        if (io_jump_flag) begin
          correct_pc_reg <= io_jump_addr;
        end else begin
          correct_pc_reg <= 64'h0;
        end
      end else begin
        correct_pc_reg <= 64'h0;
      end
    end
  end
endmodule
module ifid_reg(
  input         clock,
  input         reset,
  input  [63:0] io_if_pc,
  input         io_if_BTB_false,
  input  [1:0]  io_if_BTB_hit,
  input  [31:0] io_if_inst,
  output [63:0] io_id_pc,
  output [31:0] io_id_inst,
  output        io_id_BTB_false,
  output [1:0]  io_id_BTB_hit,
  input  [4:0]  io_stall,
  input         io_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pc_reg; // @[ifid_reg.scala 30:30]
  reg [31:0] inst_reg; // @[ifid_reg.scala 31:30]
  reg [1:0] BTB_hit_reg; // @[ifid_reg.scala 32:30]
  reg  BTB_false_reg; // @[ifid_reg.scala 33:30]
  wire  _T_4 = ~io_stall[2]; // @[ifid_reg.scala 40:49]
  wire  _T_5 = io_stall[1] & _T_4; // @[ifid_reg.scala 40:34]
  wire  _T_7 = ~io_stall[1]; // @[ifid_reg.scala 45:26]
  assign io_id_pc = pc_reg; // @[ifid_reg.scala 56:19]
  assign io_id_inst = inst_reg; // @[ifid_reg.scala 59:19]
  assign io_id_BTB_false = BTB_false_reg; // @[ifid_reg.scala 58:19]
  assign io_id_BTB_hit = BTB_hit_reg; // @[ifid_reg.scala 57:19]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pc_reg = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  inst_reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  BTB_hit_reg = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  BTB_false_reg = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pc_reg <= 64'h0;
    end else if (io_flush) begin
      pc_reg <= 64'h0;
    end else if (_T_5) begin
      pc_reg <= 64'h0;
    end else if (_T_7) begin
      pc_reg <= io_if_pc;
    end
    if (reset) begin
      inst_reg <= 32'h0;
    end else if (io_flush) begin
      inst_reg <= 32'h0;
    end else if (_T_5) begin
      inst_reg <= 32'h0;
    end else if (_T_7) begin
      inst_reg <= io_if_inst;
    end
    if (reset) begin
      BTB_hit_reg <= 2'h0;
    end else if (io_flush) begin
      BTB_hit_reg <= 2'h0;
    end else if (_T_5) begin
      BTB_hit_reg <= 2'h0;
    end else if (_T_7) begin
      BTB_hit_reg <= io_if_BTB_hit;
    end
    if (reset) begin
      BTB_false_reg <= 1'h0;
    end else if (io_flush) begin
      BTB_false_reg <= 1'h0;
    end else if (_T_5) begin
      BTB_false_reg <= 1'h0;
    end else if (_T_7) begin
      BTB_false_reg <= io_if_BTB_false;
    end
  end
endmodule
module id_stage(
  input  [63:0] io_id_pc_i,
  input         io_BTB_false_i,
  input  [31:0] io_id_inst_i,
  output        io_rreg1,
  output [4:0]  io_ra1,
  output        io_rreg2,
  output [4:0]  io_ra2,
  input  [63:0] io_rd1,
  input  [63:0] io_rd2,
  output [63:0] io_id_pc_o,
  output [2:0]  io_id_alutype_o,
  output [7:0]  io_id_aluop_o,
  output [4:0]  io_id_wa_o,
  output        io_id_wreg_o,
  output        io_id_mreg_o,
  output [63:0] io_id_din_o,
  output [63:0] io_id_src1_o,
  output [63:0] io_id_src2_o,
  input         io_exe2id_wreg,
  input  [4:0]  io_exe2id_wa,
  input  [63:0] io_exe2id_wd,
  input         io_mem2id_wreg,
  input  [4:0]  io_mem2id_wa,
  input  [63:0] io_mem2id_wd,
  input         io_exe2id_mreg,
  input         io_mem2id_mreg,
  output [63:0] io_jump_addr,
  output        io_jump_flag,
  output        io_jump_inst,
  output        io_stallreq_id,
  input  [1:0]  io_BTB_hit_i,
  output [1:0]  io_BTB_hit_o,
  output [11:0] io_csr_addr_o,
  output [4:0]  io_id_exccode_o,
  input         io_flush
);
  wire  _T_2 = io_id_inst_i != 32'h0; // @[id_stage.scala 74:42]
  wire  _T_6 = io_BTB_false_i | io_flush; // @[id_stage.scala 77:45]
  wire [31:0] id_inst = _T_6 ? 32'h13 : io_id_inst_i; // @[id_stage.scala 77:22]
  wire [6:0] opcode = id_inst[6:0]; // @[id_stage.scala 80:29]
  wire [4:0] rd = id_inst[11:7]; // @[id_stage.scala 81:29]
  wire [2:0] func3 = id_inst[14:12]; // @[id_stage.scala 82:25]
  wire [4:0] rs1 = id_inst[19:15]; // @[id_stage.scala 83:25]
  wire [6:0] func7 = id_inst[31:25]; // @[id_stage.scala 85:29]
  wire [11:0] imm_I = id_inst[31:20]; // @[id_stage.scala 86:25]
  wire [5:0] shamt = id_inst[25:20]; // @[id_stage.scala 87:29]
  wire  _T_23 = opcode == 7'h33; // @[id_stage.scala 98:30]
  wire  _T_24 = func3 == 3'h0; // @[id_stage.scala 98:58]
  wire  _T_25 = _T_23 & _T_24; // @[id_stage.scala 98:48]
  wire  _T_26 = func7 == 7'h0; // @[id_stage.scala 98:82]
  wire  inst_add = _T_25 & _T_26; // @[id_stage.scala 98:72]
  wire  _T_30 = func7 == 7'h20; // @[id_stage.scala 99:82]
  wire  inst_sub = _T_25 & _T_30; // @[id_stage.scala 99:72]
  wire  _T_32 = func3 == 3'h1; // @[id_stage.scala 100:62]
  wire  _T_33 = _T_23 & _T_32; // @[id_stage.scala 100:52]
  wire  inst_sll = _T_33 & _T_26; // @[id_stage.scala 100:76]
  wire  _T_36 = func3 == 3'h2; // @[id_stage.scala 101:62]
  wire  _T_37 = _T_23 & _T_36; // @[id_stage.scala 101:52]
  wire  inst_slt = _T_37 & _T_26; // @[id_stage.scala 101:76]
  wire  _T_40 = func3 == 3'h3; // @[id_stage.scala 102:62]
  wire  _T_41 = _T_23 & _T_40; // @[id_stage.scala 102:52]
  wire  inst_sltu = _T_41 & _T_26; // @[id_stage.scala 102:76]
  wire  _T_44 = func3 == 3'h4; // @[id_stage.scala 103:62]
  wire  _T_45 = _T_23 & _T_44; // @[id_stage.scala 103:52]
  wire  inst_xor = _T_45 & _T_26; // @[id_stage.scala 103:76]
  wire  _T_48 = func3 == 3'h5; // @[id_stage.scala 104:62]
  wire  _T_49 = _T_23 & _T_48; // @[id_stage.scala 104:52]
  wire  inst_srl = _T_49 & _T_26; // @[id_stage.scala 104:76]
  wire  inst_sra = _T_49 & _T_30; // @[id_stage.scala 105:76]
  wire  _T_56 = func3 == 3'h6; // @[id_stage.scala 106:62]
  wire  _T_57 = _T_23 & _T_56; // @[id_stage.scala 106:52]
  wire  inst_or = _T_57 & _T_26; // @[id_stage.scala 106:76]
  wire  _T_60 = func3 == 3'h7; // @[id_stage.scala 107:62]
  wire  _T_61 = _T_23 & _T_60; // @[id_stage.scala 107:52]
  wire  inst_and = _T_61 & _T_26; // @[id_stage.scala 107:76]
  wire  _T_63 = opcode == 7'h13; // @[id_stage.scala 110:30]
  wire  inst_addi = _T_63 & _T_24; // @[id_stage.scala 110:48]
  wire  inst_slti = _T_63 & _T_36; // @[id_stage.scala 111:52]
  wire  inst_sltiu = _T_63 & _T_40; // @[id_stage.scala 112:52]
  wire  inst_xori = _T_63 & _T_44; // @[id_stage.scala 113:52]
  wire  inst_ori = _T_63 & _T_56; // @[id_stage.scala 114:52]
  wire  inst_andi = _T_63 & _T_60; // @[id_stage.scala 115:52]
  wire  _T_77 = _T_63 & _T_32; // @[id_stage.scala 116:52]
  wire  _T_79 = func7[6:1] == 6'h0; // @[id_stage.scala 116:91]
  wire  inst_slli = _T_77 & _T_79; // @[id_stage.scala 116:76]
  wire  _T_82 = _T_63 & _T_48; // @[id_stage.scala 117:52]
  wire  inst_srli = _T_82 & _T_79; // @[id_stage.scala 117:76]
  wire  _T_89 = func7[6:1] == 6'h10; // @[id_stage.scala 118:91]
  wire  inst_srai = _T_82 & _T_89; // @[id_stage.scala 118:76]
  wire  _T_90 = opcode == 7'h3; // @[id_stage.scala 119:34]
  wire  inst_lb = _T_90 & _T_24; // @[id_stage.scala 119:52]
  wire  inst_lh = _T_90 & _T_32; // @[id_stage.scala 120:52]
  wire  inst_lw = _T_90 & _T_36; // @[id_stage.scala 121:52]
  wire  inst_lbu = _T_90 & _T_44; // @[id_stage.scala 122:52]
  wire  inst_lhu = _T_90 & _T_48; // @[id_stage.scala 123:52]
  wire  _T_100 = opcode == 7'h67; // @[id_stage.scala 124:34]
  wire  inst_jalr = _T_100 & _T_24; // @[id_stage.scala 124:52]
  wire  _T_102 = opcode == 7'h23; // @[id_stage.scala 127:34]
  wire  inst_sb = _T_102 & _T_24; // @[id_stage.scala 127:52]
  wire  inst_sh = _T_102 & _T_32; // @[id_stage.scala 128:52]
  wire  inst_sw = _T_102 & _T_36; // @[id_stage.scala 129:52]
  wire  inst_lui = opcode == 7'h37; // @[id_stage.scala 132:34]
  wire  inst_auipc = opcode == 7'h17; // @[id_stage.scala 133:34]
  wire  imm_Jtype = opcode == 7'h6f; // @[id_stage.scala 136:34]
  wire  _T_108 = opcode == 7'h63; // @[id_stage.scala 139:30]
  wire  inst_beq = _T_108 & _T_24; // @[id_stage.scala 139:48]
  wire  inst_bne = _T_108 & _T_32; // @[id_stage.scala 140:48]
  wire  inst_blt = _T_108 & _T_44; // @[id_stage.scala 141:48]
  wire  inst_bge = _T_108 & _T_48; // @[id_stage.scala 142:48]
  wire  inst_bltu = _T_108 & _T_56; // @[id_stage.scala 143:48]
  wire  inst_bgeu = _T_108 & _T_60; // @[id_stage.scala 144:48]
  wire  _T_120 = opcode == 7'h73; // @[id_stage.scala 147:35]
  wire  inst_csrrw = _T_120 & _T_32; // @[id_stage.scala 147:53]
  wire  inst_csrrs = _T_120 & _T_36; // @[id_stage.scala 148:53]
  wire  inst_csrrc = _T_120 & _T_40; // @[id_stage.scala 149:53]
  wire  inst_csrrwi = _T_120 & _T_48; // @[id_stage.scala 150:53]
  wire  inst_csrrsi = _T_120 & _T_56; // @[id_stage.scala 151:53]
  wire  inst_csrrci = _T_120 & _T_60; // @[id_stage.scala 152:53]
  wire  _T_134 = _T_120 & _T_24; // @[id_stage.scala 155:53]
  wire  _T_135 = imm_I == 12'h0; // @[id_stage.scala 155:85]
  wire  inst_ecall = _T_134 & _T_135; // @[id_stage.scala 155:77]
  wire  _T_139 = imm_I == 12'h1; // @[id_stage.scala 156:85]
  wire  inst_ebreak = _T_134 & _T_139; // @[id_stage.scala 156:77]
  wire  _T_143 = imm_I == 12'h302; // @[id_stage.scala 157:85]
  wire  inst_mret = _T_134 & _T_143; // @[id_stage.scala 157:77]
  wire  _T_151 = func7 == 7'h1; // @[id_stage.scala 164:87]
  wire  inst_mul = _T_25 & _T_151; // @[id_stage.scala 164:77]
  wire  inst_mulh = _T_33 & _T_151; // @[id_stage.scala 165:77]
  wire  inst_mulhsu = _T_37 & _T_151; // @[id_stage.scala 166:77]
  wire  inst_mulhu = _T_41 & _T_151; // @[id_stage.scala 167:77]
  wire  inst_div = _T_45 & _T_151; // @[id_stage.scala 170:76]
  wire  inst_divu = _T_49 & _T_151; // @[id_stage.scala 171:76]
  wire  inst_rem = _T_57 & _T_151; // @[id_stage.scala 172:76]
  wire  inst_remu = _T_61 & _T_151; // @[id_stage.scala 173:76]
  wire  inst_lwu = _T_90 & _T_56; // @[id_stage.scala 176:48]
  wire  inst_ld = _T_90 & _T_40; // @[id_stage.scala 177:52]
  wire  inst_sd = _T_102 & _T_40; // @[id_stage.scala 178:52]
  wire  _T_186 = opcode == 7'h1b; // @[id_stage.scala 180:34]
  wire  inst_addiw = _T_186 & _T_24; // @[id_stage.scala 180:52]
  wire  _T_190 = _T_186 & _T_32; // @[id_stage.scala 181:52]
  wire  inst_slliw = _T_190 & _T_26; // @[id_stage.scala 181:76]
  wire  _T_194 = _T_186 & _T_48; // @[id_stage.scala 182:52]
  wire  inst_srliw = _T_194 & _T_26; // @[id_stage.scala 182:76]
  wire  inst_sraiw = _T_194 & _T_30; // @[id_stage.scala 183:76]
  wire  _T_200 = opcode == 7'h3b; // @[id_stage.scala 184:34]
  wire  _T_202 = _T_200 & _T_24; // @[id_stage.scala 184:52]
  wire  inst_addw = _T_202 & _T_26; // @[id_stage.scala 184:76]
  wire  inst_subw = _T_202 & _T_30; // @[id_stage.scala 185:76]
  wire  _T_210 = _T_200 & _T_32; // @[id_stage.scala 186:52]
  wire  inst_sllw = _T_210 & _T_26; // @[id_stage.scala 186:76]
  wire  _T_214 = _T_200 & _T_48; // @[id_stage.scala 187:52]
  wire  inst_srlw = _T_214 & _T_26; // @[id_stage.scala 187:76]
  wire  inst_sraw = _T_214 & _T_30; // @[id_stage.scala 188:76]
  wire  inst_mulw = _T_202 & _T_151; // @[id_stage.scala 190:76]
  wire  _T_226 = _T_200 & _T_44; // @[id_stage.scala 191:52]
  wire  inst_divw = _T_226 & _T_151; // @[id_stage.scala 191:76]
  wire  inst_divuw = _T_214 & _T_151; // @[id_stage.scala 192:76]
  wire  _T_234 = _T_200 & _T_56; // @[id_stage.scala 193:52]
  wire  inst_remw = _T_234 & _T_151; // @[id_stage.scala 193:76]
  wire  _T_238 = _T_200 & _T_60; // @[id_stage.scala 194:52]
  wire  inst_remuw = _T_238 & _T_151; // @[id_stage.scala 194:76]
  wire  _T_240 = inst_sll | inst_srl; // @[id_stage.scala 208:43]
  wire  _T_241 = _T_240 | inst_sra; // @[id_stage.scala 208:56]
  wire  _T_242 = _T_241 | inst_slli; // @[id_stage.scala 208:67]
  wire  _T_243 = _T_242 | inst_srli; // @[id_stage.scala 209:63]
  wire  _T_244 = _T_243 | inst_srai; // @[id_stage.scala 209:76]
  wire  _T_245 = _T_244 | imm_Jtype; // @[id_stage.scala 209:87]
  wire  _T_246 = _T_245 | inst_jalr; // @[id_stage.scala 210:63]
  wire  _T_247 = _T_246 | inst_csrrw; // @[id_stage.scala 210:76]
  wire  _T_248 = _T_247 | inst_csrrs; // @[id_stage.scala 211:63]
  wire  _T_249 = _T_248 | inst_csrrc; // @[id_stage.scala 211:76]
  wire  _T_250 = _T_249 | inst_csrrwi; // @[id_stage.scala 211:89]
  wire  _T_251 = _T_250 | inst_csrrsi; // @[id_stage.scala 211:103]
  wire  _T_252 = _T_251 | inst_csrrci; // @[id_stage.scala 211:117]
  wire  _T_253 = _T_252 | inst_sllw; // @[id_stage.scala 211:131]
  wire  _T_254 = _T_253 | inst_srlw; // @[id_stage.scala 212:63]
  wire  _T_255 = _T_254 | inst_sraw; // @[id_stage.scala 212:76]
  wire  _T_256 = _T_255 | inst_slliw; // @[id_stage.scala 212:89]
  wire  _T_257 = _T_256 | inst_srliw; // @[id_stage.scala 212:103]
  wire  id_alutype_temp_2 = _T_257 | inst_sraiw; // @[id_stage.scala 212:117]
  wire  _T_259 = inst_and | inst_or; // @[id_stage.scala 214:43]
  wire  _T_260 = _T_259 | inst_xor; // @[id_stage.scala 214:56]
  wire  _T_261 = _T_260 | inst_andi; // @[id_stage.scala 214:69]
  wire  _T_262 = _T_261 | inst_ori; // @[id_stage.scala 215:43]
  wire  _T_263 = _T_262 | inst_xori; // @[id_stage.scala 215:56]
  wire  _T_264 = _T_263 | inst_csrrw; // @[id_stage.scala 215:69]
  wire  _T_265 = _T_264 | inst_csrrs; // @[id_stage.scala 216:63]
  wire  _T_266 = _T_265 | inst_csrrc; // @[id_stage.scala 216:76]
  wire  _T_267 = _T_266 | inst_csrrwi; // @[id_stage.scala 216:89]
  wire  _T_268 = _T_267 | inst_csrrsi; // @[id_stage.scala 216:103]
  wire  id_alutype_temp_1 = _T_268 | inst_csrrci; // @[id_stage.scala 216:117]
  wire  _T_270 = inst_add | inst_sub; // @[id_stage.scala 218:43]
  wire  _T_271 = _T_270 | inst_slt; // @[id_stage.scala 218:56]
  wire  _T_272 = _T_271 | inst_sltu; // @[id_stage.scala 218:69]
  wire  _T_273 = _T_272 | inst_addi; // @[id_stage.scala 218:81]
  wire  _T_274 = _T_273 | inst_slti; // @[id_stage.scala 219:43]
  wire  _T_275 = _T_274 | inst_sltiu; // @[id_stage.scala 219:56]
  wire  _T_276 = _T_275 | inst_lb; // @[id_stage.scala 219:69]
  wire  _T_277 = _T_276 | inst_lh; // @[id_stage.scala 220:63]
  wire  _T_278 = _T_277 | inst_lw; // @[id_stage.scala 220:76]
  wire  _T_279 = _T_278 | inst_lbu; // @[id_stage.scala 220:89]
  wire  _T_280 = _T_279 | inst_lhu; // @[id_stage.scala 220:101]
  wire  _T_281 = _T_280 | inst_lwu; // @[id_stage.scala 220:112]
  wire  _T_282 = _T_281 | inst_ld; // @[id_stage.scala 220:123]
  wire  _T_283 = _T_282 | inst_sb; // @[id_stage.scala 220:133]
  wire  _T_284 = _T_283 | inst_sh; // @[id_stage.scala 221:43]
  wire  _T_285 = _T_284 | inst_sw; // @[id_stage.scala 221:56]
  wire  _T_286 = _T_285 | inst_sd; // @[id_stage.scala 221:69]
  wire  _T_287 = _T_286 | inst_lui; // @[id_stage.scala 221:81]
  wire  _T_288 = _T_287 | inst_auipc; // @[id_stage.scala 222:43]
  wire  _T_289 = _T_288 | imm_Jtype; // @[id_stage.scala 222:56]
  wire  _T_290 = _T_289 | inst_jalr; // @[id_stage.scala 223:43]
  wire  _T_291 = _T_290 | inst_mul; // @[id_stage.scala 223:56]
  wire  _T_292 = _T_291 | inst_mulh; // @[id_stage.scala 224:63]
  wire  _T_293 = _T_292 | inst_mulhsu; // @[id_stage.scala 224:76]
  wire  _T_294 = _T_293 | inst_mulhu; // @[id_stage.scala 224:90]
  wire  _T_295 = _T_294 | inst_mulw; // @[id_stage.scala 224:103]
  wire  _T_296 = _T_295 | inst_div; // @[id_stage.scala 224:115]
  wire  _T_297 = _T_296 | inst_divu; // @[id_stage.scala 225:59]
  wire  _T_298 = _T_297 | inst_rem; // @[id_stage.scala 225:72]
  wire  _T_299 = _T_298 | inst_remu; // @[id_stage.scala 225:86]
  wire  _T_300 = _T_299 | inst_divw; // @[id_stage.scala 225:99]
  wire  _T_301 = _T_300 | inst_divuw; // @[id_stage.scala 226:63]
  wire  _T_302 = _T_301 | inst_remw; // @[id_stage.scala 226:76]
  wire  _T_303 = _T_302 | inst_remuw; // @[id_stage.scala 226:90]
  wire  _T_304 = _T_303 | inst_addiw; // @[id_stage.scala 226:103]
  wire  _T_305 = _T_304 | inst_addw; // @[id_stage.scala 226:116]
  wire  id_alutype_temp_0 = _T_305 | inst_subw; // @[id_stage.scala 226:129]
  wire [1:0] _T_307 = {id_alutype_temp_2,id_alutype_temp_1}; // @[id_stage.scala 228:50]
  wire  _T_309 = id_inst != 32'h0; // @[id_stage.scala 231:44]
  wire  _T_310 = io_id_aluop_o == 8'h0; // @[id_stage.scala 231:71]
  wire  _T_311 = _T_309 & _T_310; // @[id_stage.scala 231:53]
  wire  _T_312 = ~io_jump_inst; // @[id_stage.scala 232:49]
  wire  _T_313 = _T_311 & _T_312; // @[id_stage.scala 231:80]
  wire  _T_314 = inst_ecall | inst_ebreak; // @[id_stage.scala 232:73]
  wire  _T_315 = _T_314 | inst_mret; // @[id_stage.scala 232:85]
  wire  _T_316 = ~_T_315; // @[id_stage.scala 232:97]
  wire  illegal_instruction = _T_313 & _T_316; // @[id_stage.scala 232:58]
  wire [6:0] _T_385 = inst_remuw ? 7'h47 : 7'h0; // @[Mux.scala 98:16]
  wire [6:0] _T_386 = inst_remw ? 7'h46 : _T_385; // @[Mux.scala 98:16]
  wire [6:0] _T_387 = inst_divuw ? 7'h45 : _T_386; // @[Mux.scala 98:16]
  wire [6:0] _T_388 = inst_divw ? 7'h44 : _T_387; // @[Mux.scala 98:16]
  wire [6:0] _T_389 = inst_mulw ? 7'h43 : _T_388; // @[Mux.scala 98:16]
  wire [6:0] _T_390 = inst_sraiw ? 7'h3d : _T_389; // @[Mux.scala 98:16]
  wire [6:0] _T_391 = inst_srliw ? 7'h3c : _T_390; // @[Mux.scala 98:16]
  wire [6:0] _T_392 = inst_slliw ? 7'h3b : _T_391; // @[Mux.scala 98:16]
  wire [6:0] _T_393 = inst_sraw ? 7'h42 : _T_392; // @[Mux.scala 98:16]
  wire [6:0] _T_394 = inst_srlw ? 7'h41 : _T_393; // @[Mux.scala 98:16]
  wire [6:0] _T_395 = inst_sllw ? 7'h40 : _T_394; // @[Mux.scala 98:16]
  wire [6:0] _T_396 = inst_subw ? 7'h3f : _T_395; // @[Mux.scala 98:16]
  wire [6:0] _T_397 = inst_addw ? 7'h3e : _T_396; // @[Mux.scala 98:16]
  wire [6:0] _T_398 = inst_addiw ? 7'h3a : _T_397; // @[Mux.scala 98:16]
  wire [6:0] _T_399 = inst_sd ? 7'h39 : _T_398; // @[Mux.scala 98:16]
  wire [6:0] _T_400 = inst_ld ? 7'h38 : _T_399; // @[Mux.scala 98:16]
  wire [6:0] _T_401 = inst_lwu ? 7'h37 : _T_400; // @[Mux.scala 98:16]
  wire [6:0] _T_402 = inst_csrrci ? 7'h33 : _T_401; // @[Mux.scala 98:16]
  wire [6:0] _T_403 = inst_csrrsi ? 7'h32 : _T_402; // @[Mux.scala 98:16]
  wire [6:0] _T_404 = inst_csrrwi ? 7'h31 : _T_403; // @[Mux.scala 98:16]
  wire [6:0] _T_405 = inst_csrrc ? 7'h30 : _T_404; // @[Mux.scala 98:16]
  wire [6:0] _T_406 = inst_csrrs ? 7'h2f : _T_405; // @[Mux.scala 98:16]
  wire [6:0] _T_407 = inst_csrrw ? 7'h2e : _T_406; // @[Mux.scala 98:16]
  wire [6:0] _T_408 = inst_remu ? 7'h2d : _T_407; // @[Mux.scala 98:16]
  wire [6:0] _T_409 = inst_rem ? 7'h2c : _T_408; // @[Mux.scala 98:16]
  wire [6:0] _T_410 = inst_divu ? 7'h2b : _T_409; // @[Mux.scala 98:16]
  wire [6:0] _T_411 = inst_div ? 7'h2a : _T_410; // @[Mux.scala 98:16]
  wire [6:0] _T_412 = inst_mulhu ? 7'h29 : _T_411; // @[Mux.scala 98:16]
  wire [6:0] _T_413 = inst_mulhsu ? 7'h28 : _T_412; // @[Mux.scala 98:16]
  wire [6:0] _T_414 = inst_mulh ? 7'h27 : _T_413; // @[Mux.scala 98:16]
  wire [6:0] _T_415 = inst_mul ? 7'h26 : _T_414; // @[Mux.scala 98:16]
  wire [6:0] _T_416 = inst_bgeu ? 7'h24 : _T_415; // @[Mux.scala 98:16]
  wire [6:0] _T_417 = inst_bltu ? 7'h23 : _T_416; // @[Mux.scala 98:16]
  wire [6:0] _T_418 = inst_bge ? 7'h22 : _T_417; // @[Mux.scala 98:16]
  wire [6:0] _T_419 = inst_blt ? 7'h21 : _T_418; // @[Mux.scala 98:16]
  wire [6:0] _T_420 = inst_bne ? 7'h20 : _T_419; // @[Mux.scala 98:16]
  wire [6:0] _T_421 = inst_beq ? 7'h1f : _T_420; // @[Mux.scala 98:16]
  wire [6:0] _T_422 = inst_jalr ? 7'h25 : _T_421; // @[Mux.scala 98:16]
  wire [6:0] _T_423 = imm_Jtype ? 7'h1e : _T_422; // @[Mux.scala 98:16]
  wire [6:0] _T_424 = inst_auipc ? 7'h1d : _T_423; // @[Mux.scala 98:16]
  wire [6:0] _T_425 = inst_lui ? 7'h1c : _T_424; // @[Mux.scala 98:16]
  wire [6:0] _T_426 = inst_sw ? 7'h1b : _T_425; // @[Mux.scala 98:16]
  wire [6:0] _T_427 = inst_sh ? 7'h1a : _T_426; // @[Mux.scala 98:16]
  wire [6:0] _T_428 = inst_sb ? 7'h19 : _T_427; // @[Mux.scala 98:16]
  wire [6:0] _T_429 = inst_lhu ? 7'h18 : _T_428; // @[Mux.scala 98:16]
  wire [6:0] _T_430 = inst_lbu ? 7'h17 : _T_429; // @[Mux.scala 98:16]
  wire [6:0] _T_431 = inst_lw ? 7'h16 : _T_430; // @[Mux.scala 98:16]
  wire [6:0] _T_432 = inst_lh ? 7'h15 : _T_431; // @[Mux.scala 98:16]
  wire [6:0] _T_433 = inst_lb ? 7'h14 : _T_432; // @[Mux.scala 98:16]
  wire [6:0] _T_434 = inst_srai ? 7'h13 : _T_433; // @[Mux.scala 98:16]
  wire [6:0] _T_435 = inst_srli ? 7'h12 : _T_434; // @[Mux.scala 98:16]
  wire [6:0] _T_436 = inst_slli ? 7'h11 : _T_435; // @[Mux.scala 98:16]
  wire [6:0] _T_437 = inst_andi ? 7'h10 : _T_436; // @[Mux.scala 98:16]
  wire [6:0] _T_438 = inst_ori ? 7'hf : _T_437; // @[Mux.scala 98:16]
  wire [6:0] _T_439 = inst_xori ? 7'he : _T_438; // @[Mux.scala 98:16]
  wire [6:0] _T_440 = inst_sltiu ? 7'hd : _T_439; // @[Mux.scala 98:16]
  wire [6:0] _T_441 = inst_slti ? 7'hc : _T_440; // @[Mux.scala 98:16]
  wire [6:0] _T_442 = inst_addi ? 7'hb : _T_441; // @[Mux.scala 98:16]
  wire [6:0] _T_443 = inst_and ? 7'ha : _T_442; // @[Mux.scala 98:16]
  wire [6:0] _T_444 = inst_or ? 7'h9 : _T_443; // @[Mux.scala 98:16]
  wire [6:0] _T_445 = inst_sra ? 7'h8 : _T_444; // @[Mux.scala 98:16]
  wire [6:0] _T_446 = inst_srl ? 7'h7 : _T_445; // @[Mux.scala 98:16]
  wire [6:0] _T_447 = inst_xor ? 7'h6 : _T_446; // @[Mux.scala 98:16]
  wire [6:0] _T_448 = inst_sltu ? 7'h5 : _T_447; // @[Mux.scala 98:16]
  wire [6:0] _T_449 = inst_slt ? 7'h4 : _T_448; // @[Mux.scala 98:16]
  wire [6:0] _T_450 = inst_sll ? 7'h3 : _T_449; // @[Mux.scala 98:16]
  wire [6:0] _T_451 = inst_sub ? 7'h2 : _T_450; // @[Mux.scala 98:16]
  wire [6:0] _T_452 = inst_add ? 7'h1 : _T_451; // @[Mux.scala 98:16]
  wire  _T_453 = inst_addi | inst_slti; // @[id_stage.scala 308:37]
  wire  _T_454 = _T_453 | inst_sltiu; // @[id_stage.scala 308:49]
  wire  _T_455 = _T_454 | inst_andi; // @[id_stage.scala 308:62]
  wire  _T_456 = _T_455 | inst_ori; // @[id_stage.scala 308:74]
  wire  _T_457 = _T_456 | inst_xori; // @[id_stage.scala 308:86]
  wire  _T_458 = _T_457 | inst_lb; // @[id_stage.scala 308:99]
  wire  _T_459 = _T_458 | inst_lh; // @[id_stage.scala 309:49]
  wire  _T_460 = _T_459 | inst_lw; // @[id_stage.scala 309:61]
  wire  _T_461 = _T_460 | inst_lbu; // @[id_stage.scala 309:74]
  wire  _T_462 = _T_461 | inst_lhu; // @[id_stage.scala 309:86]
  wire  _T_463 = _T_462 | inst_lwu; // @[id_stage.scala 309:97]
  wire  _T_464 = _T_463 | inst_ld; // @[id_stage.scala 309:109]
  wire  _T_465 = _T_464 | inst_jalr; // @[id_stage.scala 309:119]
  wire  imm_Itype = _T_465 | inst_addiw; // @[id_stage.scala 310:33]
  wire  _T_466 = inst_slli | inst_srli; // @[id_stage.scala 313:37]
  wire  _T_467 = _T_466 | inst_srai; // @[id_stage.scala 313:49]
  wire  _T_468 = _T_467 | inst_slliw; // @[id_stage.scala 313:61]
  wire  _T_469 = _T_468 | inst_srliw; // @[id_stage.scala 313:74]
  wire  imm_shamt = _T_469 | inst_sraiw; // @[id_stage.scala 313:87]
  wire  _T_470 = inst_sb | inst_sh; // @[id_stage.scala 316:37]
  wire  _T_471 = _T_470 | inst_sw; // @[id_stage.scala 316:49]
  wire  imm_Stype = _T_471 | inst_sd; // @[id_stage.scala 316:60]
  wire  imm_Utype = inst_lui | inst_auipc; // @[id_stage.scala 319:41]
  wire  _T_472 = inst_beq | inst_bne; // @[id_stage.scala 325:36]
  wire  _T_473 = _T_472 | inst_blt; // @[id_stage.scala 325:47]
  wire  _T_474 = _T_473 | inst_bge; // @[id_stage.scala 325:58]
  wire  _T_475 = _T_474 | inst_bltu; // @[id_stage.scala 325:69]
  wire  imm_Btype = _T_475 | inst_bgeu; // @[id_stage.scala 325:81]
  wire [11:0] _T_478 = id_inst[31:20]; // @[id_stage.scala 331:62]
  wire [11:0] _T_480 = {func7,rd}; // @[id_stage.scala 332:70]
  wire [63:0] _T_483 = {58'h0,shamt}; // @[id_stage.scala 333:86]
  wire [19:0] _T_485 = id_inst[31:12]; // @[id_stage.scala 334:54]
  wire [20:0] _T_487 = {id_inst[31],id_inst[19:12],id_inst[20],id_inst[30:21],1'h0}; // @[id_stage.scala 335:70]
  wire [12:0] _T_489 = {id_inst[31],id_inst[7],id_inst[30:25],id_inst[11:8],1'h0}; // @[id_stage.scala 336:70]
  wire [12:0] _T_490 = imm_Btype ? $signed(_T_489) : $signed(13'sh0); // @[Mux.scala 98:16]
  wire [20:0] _T_491 = imm_Jtype ? $signed(_T_487) : $signed({{8{_T_490[12]}},_T_490}); // @[Mux.scala 98:16]
  wire [20:0] _T_492 = imm_Utype ? $signed({{1{_T_485[19]}},_T_485}) : $signed(_T_491); // @[Mux.scala 98:16]
  wire [63:0] _T_493 = imm_shamt ? $signed(_T_483) : $signed({{43{_T_492[20]}},_T_492}); // @[Mux.scala 98:16]
  wire [63:0] _T_494 = imm_Stype ? $signed({{52{_T_480[11]}},_T_480}) : $signed(_T_493); // @[Mux.scala 98:16]
  wire [63:0] imm_ext = imm_Itype ? $signed({{52{_T_478[11]}},_T_478}) : $signed(_T_494); // @[id_stage.scala 338:30]
  wire  _T_499 = _T_272 | inst_and; // @[id_stage.scala 342:76]
  wire  _T_500 = _T_499 | inst_or; // @[id_stage.scala 343:40]
  wire  _T_501 = _T_500 | inst_xor; // @[id_stage.scala 343:54]
  wire  _T_502 = _T_501 | inst_sll; // @[id_stage.scala 343:68]
  wire  _T_503 = _T_502 | inst_srl; // @[id_stage.scala 344:56]
  wire  _T_504 = _T_503 | inst_sra; // @[id_stage.scala 344:70]
  wire  _T_505 = _T_504 | inst_addi; // @[id_stage.scala 344:84]
  wire  _T_506 = _T_505 | inst_slti; // @[id_stage.scala 345:56]
  wire  _T_507 = _T_506 | inst_sltiu; // @[id_stage.scala 345:70]
  wire  _T_508 = _T_507 | inst_andi; // @[id_stage.scala 345:84]
  wire  _T_509 = _T_508 | inst_ori; // @[id_stage.scala 346:56]
  wire  _T_510 = _T_509 | inst_xori; // @[id_stage.scala 346:70]
  wire  _T_511 = _T_510 | inst_slli; // @[id_stage.scala 346:84]
  wire  _T_512 = _T_511 | inst_srli; // @[id_stage.scala 347:36]
  wire  _T_513 = _T_512 | inst_srai; // @[id_stage.scala 347:50]
  wire  _T_514 = _T_513 | inst_lb; // @[id_stage.scala 347:64]
  wire  _T_515 = _T_514 | inst_lh; // @[id_stage.scala 348:56]
  wire  _T_516 = _T_515 | inst_lw; // @[id_stage.scala 348:70]
  wire  _T_517 = _T_516 | inst_lbu; // @[id_stage.scala 348:84]
  wire  _T_518 = _T_517 | inst_lhu; // @[id_stage.scala 348:97]
  wire  _T_519 = _T_518 | inst_lwu; // @[id_stage.scala 348:108]
  wire  _T_520 = _T_519 | inst_ld; // @[id_stage.scala 348:119]
  wire  _T_521 = _T_520 | inst_lui; // @[id_stage.scala 348:129]
  wire  _T_522 = _T_521 | inst_auipc; // @[id_stage.scala 349:60]
  wire  _T_523 = _T_522 | imm_Jtype; // @[id_stage.scala 349:74]
  wire  _T_524 = _T_523 | inst_jalr; // @[id_stage.scala 350:56]
  wire  _T_525 = _T_524 | inst_mul; // @[id_stage.scala 350:70]
  wire  _T_526 = _T_525 | inst_mulh; // @[id_stage.scala 351:56]
  wire  _T_527 = _T_526 | inst_mulhsu; // @[id_stage.scala 351:70]
  wire  _T_528 = _T_527 | inst_mulhu; // @[id_stage.scala 351:84]
  wire  _T_529 = _T_528 | inst_mulw; // @[id_stage.scala 351:97]
  wire  _T_530 = _T_529 | inst_div; // @[id_stage.scala 351:108]
  wire  _T_531 = _T_530 | inst_divu; // @[id_stage.scala 352:56]
  wire  _T_532 = _T_531 | inst_rem; // @[id_stage.scala 352:70]
  wire  _T_533 = _T_532 | inst_remu; // @[id_stage.scala 352:84]
  wire  _T_534 = _T_533 | inst_divw; // @[id_stage.scala 352:97]
  wire  _T_535 = _T_534 | inst_divuw; // @[id_stage.scala 353:56]
  wire  _T_536 = _T_535 | inst_remw; // @[id_stage.scala 353:70]
  wire  _T_537 = _T_536 | inst_remuw; // @[id_stage.scala 353:84]
  wire  _T_538 = _T_537 | inst_csrrw; // @[id_stage.scala 353:97]
  wire  _T_539 = _T_538 | inst_csrrs; // @[id_stage.scala 354:56]
  wire  _T_540 = _T_539 | inst_csrrc; // @[id_stage.scala 354:70]
  wire  _T_541 = _T_540 | inst_csrrwi; // @[id_stage.scala 354:84]
  wire  _T_542 = _T_541 | inst_csrrsi; // @[id_stage.scala 355:56]
  wire  _T_543 = _T_542 | inst_csrrci; // @[id_stage.scala 355:70]
  wire  _T_544 = _T_543 | inst_addiw; // @[id_stage.scala 355:84]
  wire  _T_545 = _T_544 | inst_addw; // @[id_stage.scala 356:55]
  wire  _T_546 = _T_545 | inst_subw; // @[id_stage.scala 356:67]
  wire  _T_547 = _T_546 | inst_sllw; // @[id_stage.scala 356:79]
  wire  _T_548 = _T_547 | inst_srlw; // @[id_stage.scala 356:91]
  wire  _T_549 = _T_548 | inst_sraw; // @[id_stage.scala 356:103]
  wire  _T_550 = _T_549 | inst_slliw; // @[id_stage.scala 356:114]
  wire  _T_551 = _T_550 | inst_srliw; // @[id_stage.scala 356:127]
  wire  _T_552 = _T_551 | inst_sraiw; // @[id_stage.scala 356:140]
  wire  _T_553 = io_id_wa_o != 5'h0; // @[id_stage.scala 357:61]
  wire  _T_555 = inst_lb | inst_lh; // @[id_stage.scala 360:30]
  wire  _T_556 = _T_555 | inst_lw; // @[id_stage.scala 360:41]
  wire  _T_557 = _T_556 | inst_lbu; // @[id_stage.scala 360:52]
  wire  _T_558 = _T_557 | inst_lhu; // @[id_stage.scala 360:64]
  wire  _T_559 = _T_558 | inst_lwu; // @[id_stage.scala 360:75]
  wire  _T_586 = _T_520 | inst_sb; // @[id_stage.scala 369:102]
  wire  _T_587 = _T_586 | inst_sh; // @[id_stage.scala 370:34]
  wire  _T_588 = _T_587 | inst_sw; // @[id_stage.scala 370:47]
  wire  _T_589 = _T_588 | inst_sd; // @[id_stage.scala 370:61]
  wire  _T_590 = _T_589 | inst_beq; // @[id_stage.scala 370:73]
  wire  _T_591 = _T_590 | inst_bne; // @[id_stage.scala 371:30]
  wire  _T_592 = _T_591 | inst_blt; // @[id_stage.scala 371:43]
  wire  _T_593 = _T_592 | inst_bge; // @[id_stage.scala 371:57]
  wire  _T_594 = _T_593 | inst_bltu; // @[id_stage.scala 371:69]
  wire  _T_595 = _T_594 | inst_bgeu; // @[id_stage.scala 371:81]
  wire  _T_596 = _T_595 | inst_jalr; // @[id_stage.scala 371:93]
  wire  _T_597 = _T_596 | inst_mul; // @[id_stage.scala 372:30]
  wire  _T_598 = _T_597 | inst_mulh; // @[id_stage.scala 373:30]
  wire  _T_599 = _T_598 | inst_mulhsu; // @[id_stage.scala 373:43]
  wire  _T_600 = _T_599 | inst_mulhu; // @[id_stage.scala 373:57]
  wire  _T_601 = _T_600 | inst_mulw; // @[id_stage.scala 373:70]
  wire  _T_602 = _T_601 | inst_div; // @[id_stage.scala 373:82]
  wire  _T_603 = _T_602 | inst_divu; // @[id_stage.scala 374:30]
  wire  _T_604 = _T_603 | inst_rem; // @[id_stage.scala 374:43]
  wire  _T_605 = _T_604 | inst_remu; // @[id_stage.scala 374:57]
  wire  _T_606 = _T_605 | inst_divw; // @[id_stage.scala 374:70]
  wire  _T_607 = _T_606 | inst_divuw; // @[id_stage.scala 375:46]
  wire  _T_608 = _T_607 | inst_remw; // @[id_stage.scala 375:59]
  wire  _T_609 = _T_608 | inst_remuw; // @[id_stage.scala 375:73]
  wire  _T_610 = _T_609 | inst_csrrw; // @[id_stage.scala 375:86]
  wire  _T_611 = _T_610 | inst_csrrs; // @[id_stage.scala 376:30]
  wire  _T_612 = _T_611 | inst_csrrc; // @[id_stage.scala 376:43]
  wire  _T_613 = _T_612 | inst_addiw; // @[id_stage.scala 376:57]
  wire  _T_614 = _T_613 | inst_addw; // @[id_stage.scala 377:30]
  wire  _T_615 = _T_614 | inst_subw; // @[id_stage.scala 377:43]
  wire  _T_616 = _T_615 | inst_sllw; // @[id_stage.scala 377:57]
  wire  _T_617 = _T_616 | inst_srlw; // @[id_stage.scala 377:69]
  wire  _T_618 = _T_617 | inst_sraw; // @[id_stage.scala 377:81]
  wire  _T_619 = _T_618 | inst_slliw; // @[id_stage.scala 377:92]
  wire  _T_620 = _T_619 | inst_srliw; // @[id_stage.scala 377:105]
  wire  _T_631 = _T_504 | inst_sb; // @[id_stage.scala 383:57]
  wire  _T_632 = _T_631 | inst_sh; // @[id_stage.scala 384:45]
  wire  _T_633 = _T_632 | inst_sw; // @[id_stage.scala 384:57]
  wire  _T_634 = _T_633 | inst_sd; // @[id_stage.scala 384:69]
  wire  _T_635 = _T_634 | inst_beq; // @[id_stage.scala 384:79]
  wire  _T_636 = _T_635 | inst_bne; // @[id_stage.scala 385:45]
  wire  _T_637 = _T_636 | inst_blt; // @[id_stage.scala 385:57]
  wire  _T_638 = _T_637 | inst_bge; // @[id_stage.scala 385:69]
  wire  _T_639 = _T_638 | inst_bltu; // @[id_stage.scala 385:81]
  wire  _T_640 = _T_639 | inst_bgeu; // @[id_stage.scala 385:93]
  wire  _T_641 = _T_640 | inst_mul; // @[id_stage.scala 385:105]
  wire  _T_642 = _T_641 | inst_mulh; // @[id_stage.scala 386:45]
  wire  _T_643 = _T_642 | inst_mulhsu; // @[id_stage.scala 386:57]
  wire  _T_644 = _T_643 | inst_mulhu; // @[id_stage.scala 386:71]
  wire  _T_645 = _T_644 | inst_mulw; // @[id_stage.scala 386:84]
  wire  _T_646 = _T_645 | inst_div; // @[id_stage.scala 386:96]
  wire  _T_647 = _T_646 | inst_divu; // @[id_stage.scala 387:45]
  wire  _T_648 = _T_647 | inst_rem; // @[id_stage.scala 387:57]
  wire  _T_649 = _T_648 | inst_remu; // @[id_stage.scala 387:71]
  wire  _T_650 = _T_649 | inst_divw; // @[id_stage.scala 387:83]
  wire  _T_651 = _T_650 | inst_divuw; // @[id_stage.scala 388:45]
  wire  _T_652 = _T_651 | inst_remw; // @[id_stage.scala 388:58]
  wire  _T_653 = _T_652 | inst_remuw; // @[id_stage.scala 388:70]
  wire  _T_654 = _T_653 | inst_addw; // @[id_stage.scala 388:83]
  wire  _T_655 = _T_654 | inst_subw; // @[id_stage.scala 389:45]
  wire  _T_656 = _T_655 | inst_sllw; // @[id_stage.scala 389:57]
  wire  _T_657 = _T_656 | inst_srlw; // @[id_stage.scala 389:69]
  wire  _T_660 = io_exe2id_wa == io_ra1; // @[id_stage.scala 394:61]
  wire  _T_661 = io_exe2id_wreg & _T_660; // @[id_stage.scala 394:45]
  wire  _T_663 = _T_661 & io_rreg1; // @[id_stage.scala 394:72]
  wire  _T_665 = io_mem2id_wa == io_ra1; // @[id_stage.scala 395:73]
  wire  _T_666 = io_mem2id_wreg & _T_665; // @[id_stage.scala 395:57]
  wire  _T_668 = _T_666 & io_rreg1; // @[id_stage.scala 395:84]
  wire [1:0] _T_670 = io_rreg1 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_671 = _T_668 ? 2'h2 : _T_670; // @[Mux.scala 98:16]
  wire [1:0] fwrd_reg1 = _T_663 ? 2'h1 : _T_671; // @[Mux.scala 98:16]
  wire  _T_673 = io_exe2id_wa == io_ra2; // @[id_stage.scala 400:61]
  wire  _T_674 = io_exe2id_wreg & _T_673; // @[id_stage.scala 400:45]
  wire  _T_676 = _T_674 & io_rreg2; // @[id_stage.scala 400:72]
  wire  _T_678 = io_mem2id_wa == io_ra2; // @[id_stage.scala 401:73]
  wire  _T_679 = io_mem2id_wreg & _T_678; // @[id_stage.scala 401:57]
  wire  _T_681 = _T_679 & io_rreg2; // @[id_stage.scala 401:84]
  wire [1:0] _T_683 = io_rreg2 ? 2'h3 : 2'h0; // @[Mux.scala 98:16]
  wire [1:0] _T_684 = _T_681 ? 2'h2 : _T_683; // @[Mux.scala 98:16]
  wire [1:0] fwrd_reg2 = _T_676 ? 2'h1 : _T_684; // @[Mux.scala 98:16]
  wire  _T_685 = fwrd_reg2 == 2'h1; // @[id_stage.scala 414:32]
  wire  _T_686 = fwrd_reg2 == 2'h2; // @[id_stage.scala 415:44]
  wire  _T_687 = fwrd_reg2 == 2'h3; // @[id_stage.scala 416:40]
  wire [63:0] _T_688 = _T_687 ? io_rd2 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_689 = _T_686 ? io_mem2id_wd : _T_688; // @[Mux.scala 98:16]
  wire [63:0] _T_690 = _T_685 ? io_exe2id_wd : _T_689; // @[Mux.scala 98:16]
  wire  _T_691 = inst_csrrwi | inst_csrrsi; // @[id_stage.scala 421:34]
  wire  _T_693 = _T_691 | inst_csrrci; // @[id_stage.scala 421:48]
  wire [31:0] _T_694 = {27'h0,rs1}; // @[Cat.scala 30:58]
  wire  _T_695 = fwrd_reg1 == 2'h1; // @[id_stage.scala 422:28]
  wire  _T_696 = fwrd_reg1 == 2'h2; // @[id_stage.scala 423:44]
  wire  _T_697 = fwrd_reg1 == 2'h3; // @[id_stage.scala 424:36]
  wire [63:0] _T_698 = _T_697 ? io_rd1 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_699 = _T_696 ? io_mem2id_wd : _T_698; // @[Mux.scala 98:16]
  wire [63:0] _T_700 = _T_695 ? io_exe2id_wd : _T_699; // @[Mux.scala 98:16]
  wire  _T_704 = imm_Itype | imm_shamt; // @[id_stage.scala 428:40]
  wire  _T_706 = _T_704 | imm_Stype; // @[id_stage.scala 428:61]
  wire  _T_708 = _T_706 | imm_Utype; // @[id_stage.scala 428:82]
  wire  _T_716 = inst_csrrw | inst_csrrs; // @[id_stage.scala 436:35]
  wire  _T_717 = _T_716 | inst_csrrc; // @[id_stage.scala 436:48]
  wire  _T_718 = _T_717 | inst_csrrwi; // @[id_stage.scala 436:61]
  wire  _T_719 = _T_718 | inst_csrrsi; // @[id_stage.scala 436:75]
  wire  csr_init = _T_719 | inst_csrrci; // @[id_stage.scala 436:89]
  wire  _T_722 = imm_Jtype | inst_jalr; // @[id_stage.scala 440:30]
  wire  _T_723 = _T_722 | inst_beq; // @[id_stage.scala 440:42]
  wire  _T_724 = _T_723 | inst_bne; // @[id_stage.scala 440:54]
  wire  _T_725 = _T_724 | inst_blt; // @[id_stage.scala 440:66]
  wire  _T_726 = _T_725 | inst_bge; // @[id_stage.scala 440:78]
  wire  _T_727 = _T_726 | inst_bltu; // @[id_stage.scala 440:90]
  wire [63:0] _T_731 = io_id_src1_o + imm_ext; // @[id_stage.scala 442:62]
  wire [63:0] _T_732 = _T_731 & 64'hfffffffffffffffe; // @[id_stage.scala 442:72]
  wire [63:0] _T_734 = io_id_pc_i + imm_ext; // @[id_stage.scala 442:107]
  wire  _T_739 = io_id_src1_o == io_id_src2_o; // @[id_stage.scala 447:58]
  wire  _T_742 = io_id_src1_o != io_id_src2_o; // @[id_stage.scala 448:54]
  wire  _T_747 = $signed(io_id_src1_o) < $signed(io_id_src2_o); // @[id_stage.scala 449:63]
  wire  _T_750 = io_id_src1_o < io_id_src2_o; // @[id_stage.scala 450:63]
  wire  _T_755 = $signed(io_id_src1_o) >= $signed(io_id_src2_o); // @[id_stage.scala 451:63]
  wire  _T_758 = io_id_src1_o >= io_id_src2_o; // @[id_stage.scala 452:63]
  wire  _T_760 = inst_bgeu & _T_758; // @[Mux.scala 98:16]
  wire  _T_761 = inst_bge ? _T_755 : _T_760; // @[Mux.scala 98:16]
  wire  _T_762 = inst_bltu ? _T_750 : _T_761; // @[Mux.scala 98:16]
  wire  _T_763 = inst_blt ? _T_747 : _T_762; // @[Mux.scala 98:16]
  wire  _T_764 = inst_bne ? _T_742 : _T_763; // @[Mux.scala 98:16]
  wire  _T_765 = inst_beq ? _T_739 : _T_764; // @[Mux.scala 98:16]
  wire  _T_766 = inst_jalr | _T_765; // @[Mux.scala 98:16]
  wire  _T_767 = imm_Jtype | _T_766; // @[Mux.scala 98:16]
  wire [63:0] _T_769 = io_id_pc_i + 64'h4; // @[id_stage.scala 453:41]
  wire  _T_770 = io_jump_addr != _T_769; // @[id_stage.scala 453:26]
  wire  _T_782 = _T_663 | _T_676; // @[id_stage.scala 457:93]
  wire  _T_784 = _T_782 & io_exe2id_mreg; // @[id_stage.scala 459:20]
  wire  _T_795 = _T_668 | _T_681; // @[id_stage.scala 460:97]
  wire  _T_797 = _T_795 & io_mem2id_mreg; // @[id_stage.scala 462:20]
  wire [4:0] _T_804 = inst_mret ? 5'h1e : 5'h1f; // @[Mux.scala 98:16]
  wire [4:0] _T_805 = inst_ebreak ? 5'h3 : _T_804; // @[Mux.scala 98:16]
  wire [4:0] _T_806 = inst_ecall ? 5'hb : _T_805; // @[Mux.scala 98:16]
  assign io_rreg1 = _T_620 | inst_sraiw; // @[id_stage.scala 363:15]
  assign io_ra1 = id_inst[19:15]; // @[id_stage.scala 406:16]
  assign io_rreg2 = _T_657 | inst_sraw; // @[id_stage.scala 381:15]
  assign io_ra2 = id_inst[24:20]; // @[id_stage.scala 407:16]
  assign io_id_pc_o = io_BTB_false_i ? 64'h0 : io_id_pc_i; // @[id_stage.scala 73:18]
  assign io_id_alutype_o = {_T_307,id_alutype_temp_0}; // @[id_stage.scala 228:25]
  assign io_id_aluop_o = {{1'd0}, _T_452}; // @[id_stage.scala 235:23]
  assign io_id_wa_o = id_inst[11:7]; // @[id_stage.scala 410:20]
  assign io_id_wreg_o = _T_552 & _T_553; // @[id_stage.scala 342:19]
  assign io_id_mreg_o = _T_559 | inst_ld; // @[id_stage.scala 360:18]
  assign io_id_din_o = _T_685 ? io_exe2id_wd : _T_689; // @[id_stage.scala 413:21]
  assign io_id_src1_o = _T_693 ? {{32'd0}, _T_694} : _T_700; // @[id_stage.scala 420:22]
  assign io_id_src2_o = _T_708 ? imm_ext : _T_690; // @[id_stage.scala 427:22]
  assign io_jump_addr = inst_jalr ? _T_732 : _T_734; // @[id_stage.scala 442:22]
  assign io_jump_flag = _T_767 & _T_770; // @[id_stage.scala 444:22]
  assign io_jump_inst = _T_727 | inst_bgeu; // @[id_stage.scala 440:18]
  assign io_stallreq_id = _T_784 | _T_797; // @[id_stage.scala 456:24]
  assign io_BTB_hit_o = _T_2 ? io_BTB_hit_i : 2'h2; // @[id_stage.scala 74:22]
  assign io_csr_addr_o = csr_init ? imm_I : 12'h0; // @[id_stage.scala 437:23]
  assign io_id_exccode_o = illegal_instruction ? 5'h2 : _T_806; // @[id_stage.scala 465:25]
endmodule
module idexe_reg(
  input         clock,
  input         reset,
  input  [63:0] io_id_pc,
  input  [2:0]  io_id_alutype,
  input  [7:0]  io_id_aluop,
  input  [63:0] io_id_src1,
  input  [63:0] io_id_src2,
  input  [4:0]  io_id_wa,
  input         io_id_wreg,
  input         io_id_mreg,
  input  [63:0] io_id_din,
  input  [11:0] io_id_csr_addr,
  input  [4:0]  io_id_exccode,
  input  [63:0] io_id_jump_addr,
  output [63:0] io_exe_pc,
  output [2:0]  io_exe_alutype,
  output [7:0]  io_exe_aluop,
  output [63:0] io_exe_src1,
  output [63:0] io_exe_src2,
  output [4:0]  io_exe_wa,
  output        io_exe_wreg,
  output        io_exe_mreg,
  output [63:0] io_exe_din,
  output [11:0] io_exe_csr_addr,
  output [4:0]  io_exe_exccode,
  output [63:0] io_exe_jump_addr,
  input  [4:0]  io_stall,
  input         io_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pc_reg; // @[idexe_reg.scala 48:35]
  reg [2:0] alutype_reg; // @[idexe_reg.scala 49:35]
  reg [7:0] aluop_reg; // @[idexe_reg.scala 50:35]
  reg [63:0] src1_reg; // @[idexe_reg.scala 51:35]
  reg [63:0] src2_reg; // @[idexe_reg.scala 52:35]
  reg [4:0] wa_reg; // @[idexe_reg.scala 53:35]
  reg  wreg_reg; // @[idexe_reg.scala 54:35]
  reg  mreg_reg; // @[idexe_reg.scala 55:35]
  reg [63:0] din_reg; // @[idexe_reg.scala 56:35]
  reg [11:0] csr_addr_reg; // @[idexe_reg.scala 57:35]
  reg [4:0] exccode_reg; // @[idexe_reg.scala 58:35]
  reg [63:0] jump_addr_reg; // @[idexe_reg.scala 59:36]
  wire  _T_4 = ~io_stall[3]; // @[idexe_reg.scala 74:55]
  wire  _T_5 = io_stall[2] & _T_4; // @[idexe_reg.scala 74:40]
  wire  _T_7 = ~io_stall[2]; // @[idexe_reg.scala 87:28]
  assign io_exe_pc = pc_reg; // @[idexe_reg.scala 115:22]
  assign io_exe_alutype = alutype_reg; // @[idexe_reg.scala 116:22]
  assign io_exe_aluop = aluop_reg; // @[idexe_reg.scala 117:26]
  assign io_exe_src1 = src1_reg; // @[idexe_reg.scala 118:22]
  assign io_exe_src2 = src2_reg; // @[idexe_reg.scala 119:22]
  assign io_exe_wa = wa_reg; // @[idexe_reg.scala 120:26]
  assign io_exe_wreg = wreg_reg; // @[idexe_reg.scala 121:26]
  assign io_exe_mreg = mreg_reg; // @[idexe_reg.scala 122:26]
  assign io_exe_din = din_reg; // @[idexe_reg.scala 123:26]
  assign io_exe_csr_addr = csr_addr_reg; // @[idexe_reg.scala 124:26]
  assign io_exe_exccode = exccode_reg; // @[idexe_reg.scala 125:26]
  assign io_exe_jump_addr = jump_addr_reg; // @[idexe_reg.scala 126:26]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pc_reg = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  alutype_reg = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  aluop_reg = _RAND_2[7:0];
  _RAND_3 = {2{`RANDOM}};
  src1_reg = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  src2_reg = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  wa_reg = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  wreg_reg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mreg_reg = _RAND_7[0:0];
  _RAND_8 = {2{`RANDOM}};
  din_reg = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  csr_addr_reg = _RAND_9[11:0];
  _RAND_10 = {1{`RANDOM}};
  exccode_reg = _RAND_10[4:0];
  _RAND_11 = {2{`RANDOM}};
  jump_addr_reg = _RAND_11[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pc_reg <= 64'h0;
    end else if (io_flush) begin
      pc_reg <= 64'h0;
    end else if (_T_5) begin
      pc_reg <= 64'h0;
    end else if (_T_7) begin
      pc_reg <= io_id_pc;
    end
    if (reset) begin
      alutype_reg <= 3'h0;
    end else if (io_flush) begin
      alutype_reg <= 3'h0;
    end else if (_T_5) begin
      alutype_reg <= 3'h0;
    end else if (_T_7) begin
      alutype_reg <= io_id_alutype;
    end
    if (reset) begin
      aluop_reg <= 8'h0;
    end else if (io_flush) begin
      aluop_reg <= 8'h3;
    end else if (_T_5) begin
      aluop_reg <= 8'h3;
    end else if (_T_7) begin
      aluop_reg <= io_id_aluop;
    end
    if (reset) begin
      src1_reg <= 64'h0;
    end else if (io_flush) begin
      src1_reg <= 64'h0;
    end else if (_T_5) begin
      src1_reg <= 64'h0;
    end else if (_T_7) begin
      src1_reg <= io_id_src1;
    end
    if (reset) begin
      src2_reg <= 64'h0;
    end else if (io_flush) begin
      src2_reg <= 64'h0;
    end else if (_T_5) begin
      src2_reg <= 64'h0;
    end else if (_T_7) begin
      src2_reg <= io_id_src2;
    end
    if (reset) begin
      wa_reg <= 5'h0;
    end else if (io_flush) begin
      wa_reg <= 5'h0;
    end else if (_T_5) begin
      wa_reg <= 5'h0;
    end else if (_T_7) begin
      wa_reg <= io_id_wa;
    end
    if (reset) begin
      wreg_reg <= 1'h0;
    end else if (io_flush) begin
      wreg_reg <= 1'h0;
    end else if (_T_5) begin
      wreg_reg <= 1'h0;
    end else if (_T_7) begin
      wreg_reg <= io_id_wreg;
    end
    if (reset) begin
      mreg_reg <= 1'h0;
    end else if (io_flush) begin
      mreg_reg <= 1'h0;
    end else if (_T_5) begin
      mreg_reg <= 1'h0;
    end else if (_T_7) begin
      mreg_reg <= io_id_mreg;
    end
    if (reset) begin
      din_reg <= 64'h0;
    end else if (io_flush) begin
      din_reg <= 64'h0;
    end else if (_T_5) begin
      din_reg <= 64'h0;
    end else if (_T_7) begin
      din_reg <= io_id_din;
    end
    if (reset) begin
      csr_addr_reg <= 12'h0;
    end else if (io_flush) begin
      csr_addr_reg <= 12'h0;
    end else if (_T_5) begin
      csr_addr_reg <= 12'h0;
    end else if (_T_7) begin
      csr_addr_reg <= io_id_csr_addr;
    end
    if (reset) begin
      exccode_reg <= 5'h1f;
    end else if (io_flush) begin
      exccode_reg <= 5'h1f;
    end else if (_T_5) begin
      exccode_reg <= 5'h1f;
    end else if (_T_7) begin
      exccode_reg <= io_id_exccode;
    end
    if (reset) begin
      jump_addr_reg <= 64'h0;
    end else if (io_flush) begin
      jump_addr_reg <= 64'h0;
    end else if (_T_5) begin
      jump_addr_reg <= 64'h0;
    end else if (_T_7) begin
      jump_addr_reg <= io_id_jump_addr;
    end
  end
endmodule
module exe_stage(
  input         clock,
  input         reset,
  input  [63:0] io_exe_pc_i,
  input  [2:0]  io_exe_alutype_i,
  input  [7:0]  io_exe_aluop_i,
  input  [63:0] io_exe_src1_i,
  input  [63:0] io_exe_src2_i,
  input  [4:0]  io_exe_wa_i,
  input         io_exe_wreg_i,
  input         io_exe_mreg_i,
  input  [63:0] io_exe_din_i,
  input  [11:0] io_csr_addr_i,
  input  [63:0] io_csr_rd_i,
  input  [4:0]  io_exe_exccode_i,
  input  [63:0] io_exe_jump_addr_i,
  output [63:0] io_exe_pc_o,
  output [7:0]  io_exe_aluop_o,
  output [4:0]  io_exe_wa_o,
  output        io_exe_wreg_o,
  output [63:0] io_exe_wd_o,
  output        io_exe_mreg_o,
  output [63:0] io_exe_din_o,
  output [11:0] io_csr_wa_o,
  output [63:0] io_csr_wd_o,
  output        io_csr_we_o,
  output [4:0]  io_exe_exccode_o,
  output [63:0] io_exe_jump_addr_o,
  output        io_stallreq_exe,
  output [11:0] io_csr_ra_o,
  output        io_csr_re_o,
  input         io_mem2exe_csr_we,
  input  [11:0] io_mem2exe_csr_wa,
  input  [63:0] io_mem2exe_csr_wd,
  input         io_wb2exe_csr_we,
  input  [11:0] io_wb2exe_csr_wa,
  input  [63:0] io_wb2exe_csr_wd
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [127:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [127:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [159:0] _RAND_15;
  reg [95:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [31:0] _RAND_18;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] andAns = io_exe_src1_i & io_exe_src2_i; // @[exe_stage.scala 70:32]
  wire [63:0] orAns = io_exe_src1_i | io_exe_src2_i; // @[exe_stage.scala 71:32]
  wire [63:0] xorAns = io_exe_src1_i ^ io_exe_src2_i; // @[exe_stage.scala 72:32]
  wire [63:0] addAns = io_exe_src1_i + io_exe_src2_i; // @[exe_stage.scala 73:32]
  wire [63:0] subAns = io_exe_src1_i - io_exe_src2_i; // @[exe_stage.scala 74:32]
  wire  _T_4 = $signed(io_exe_src1_i) < $signed(io_exe_src2_i); // @[exe_stage.scala 75:46]
  wire [63:0] sltAns = _T_4 ? 64'h1 : 64'h0; // @[exe_stage.scala 75:21]
  wire  _T_5 = io_exe_src1_i < io_exe_src2_i; // @[exe_stage.scala 76:46]
  wire [63:0] sltuAns = _T_5 ? 64'h1 : 64'h0; // @[exe_stage.scala 76:21]
  wire [126:0] _GEN_167 = {{63'd0}, io_exe_src1_i}; // @[exe_stage.scala 77:33]
  wire [126:0] _T_7 = _GEN_167 << io_exe_src2_i[5:0]; // @[exe_stage.scala 77:33]
  wire [63:0] sllAns = _T_7[63:0]; // @[exe_stage.scala 77:55]
  wire [63:0] srlAns = io_exe_src1_i >> io_exe_src2_i[5:0]; // @[exe_stage.scala 78:42]
  wire [63:0] sraAns = $signed(io_exe_src1_i) >>> io_exe_src2_i[5:0]; // @[exe_stage.scala 79:71]
  wire [63:0] jalrAns = io_exe_pc_i + 64'h4; // @[exe_stage.scala 98:32]
  wire [75:0] _GEN_169 = {io_exe_src2_i, 12'h0}; // @[exe_stage.scala 107:33]
  wire [78:0] _T_35 = {{3'd0}, _GEN_169}; // @[exe_stage.scala 107:33]
  wire [63:0] luiAns = _T_35[63:0]; // @[exe_stage.scala 107:41]
  wire [78:0] _GEN_171 = {{15'd0}, io_exe_pc_i}; // @[exe_stage.scala 108:43]
  wire [78:0] _T_38 = _T_35 + _GEN_171; // @[exe_stage.scala 108:43]
  wire [63:0] auipcAns = _T_38[63:0]; // @[exe_stage.scala 108:57]
  wire [31:0] _T_44 = addAns[31:0]; // @[exe_stage.scala 118:21]
  wire [63:0] addiwAns = {{32{_T_44[31]}},_T_44}; // @[exe_stage.scala 119:22]
  wire [31:0] _T_54 = subAns[31:0]; // @[exe_stage.scala 118:21]
  wire [63:0] subwAns = {{32{_T_54[31]}},_T_54}; // @[exe_stage.scala 119:22]
  wire [62:0] _GEN_172 = {{31'd0}, io_exe_src1_i[31:0]}; // @[exe_stage.scala 130:51]
  wire [62:0] _T_57 = _GEN_172 << io_exe_src2_i[4:0]; // @[exe_stage.scala 130:51]
  wire [31:0] _T_60 = _T_57[31:0]; // @[exe_stage.scala 118:21]
  wire [63:0] sllwAns = {{32{_T_60[31]}},_T_60}; // @[exe_stage.scala 119:22]
  wire [31:0] _T_71 = io_exe_src1_i[31:0] >> io_exe_src2_i[4:0]; // @[exe_stage.scala 118:21]
  wire [63:0] srlwAns = {{32{_T_71[31]}},_T_71}; // @[exe_stage.scala 119:22]
  wire [31:0] _T_78 = io_exe_src1_i[31:0]; // @[exe_stage.scala 134:55]
  wire [31:0] _T_80 = $signed(_T_78) >>> io_exe_src2_i[4:0]; // @[exe_stage.scala 134:58]
  wire [63:0] srawAns = {{32{_T_80[31]}},_T_80}; // @[exe_stage.scala 124:22]
  wire  _T_87 = io_exe_aluop_i == 8'h26; // @[exe_stage.scala 148:34]
  wire  _T_88 = io_exe_aluop_i == 8'h27; // @[exe_stage.scala 148:70]
  wire  _T_89 = _T_87 | _T_88; // @[exe_stage.scala 148:52]
  wire  _T_90 = io_exe_aluop_i == 8'h28; // @[exe_stage.scala 149:34]
  wire  _T_91 = _T_89 | _T_90; // @[exe_stage.scala 148:87]
  wire  _T_92 = io_exe_aluop_i == 8'h29; // @[exe_stage.scala 149:70]
  wire  _T_93 = _T_91 | _T_92; // @[exe_stage.scala 149:52]
  wire  _T_94 = io_exe_aluop_i == 8'h43; // @[exe_stage.scala 150:50]
  wire  mul_inst = _T_93 | _T_94; // @[exe_stage.scala 149:87]
  wire  signed_mulop1 = _T_91 | _T_94; // @[exe_stage.scala 153:57]
  wire  signed_mulop2 = _T_89 | _T_94; // @[exe_stage.scala 155:92]
  reg [127:0] mulres; // @[exe_stage.scala 158:25]
  reg  mul_done; // @[exe_stage.scala 159:25]
  wire  _T_106 = ~mul_done; // @[exe_stage.scala 166:53]
  wire  mul_start = mul_inst & _T_106; // @[exe_stage.scala 166:41]
  reg [3:0] mul_cnt; // @[exe_stage.scala 169:32]
  reg [127:0] multemp; // @[exe_stage.scala 170:28]
  reg [63:0] mul_temp_op1; // @[exe_stage.scala 171:32]
  reg [63:0] mul_temp_op2; // @[exe_stage.scala 172:32]
  reg [31:0] mul_temp1; // @[exe_stage.scala 174:28]
  reg [31:0] mul_temp2; // @[exe_stage.scala 175:28]
  reg [31:0] mul_temp3; // @[exe_stage.scala 176:28]
  reg [31:0] mul_temp4; // @[exe_stage.scala 177:28]
  reg [1:0] mul_state; // @[exe_stage.scala 184:26]
  wire  _T_108 = 2'h0 == mul_state; // @[Conditional.scala 37:30]
  wire  _T_110 = io_exe_src1_i == 64'h0; // @[exe_stage.scala 191:32]
  wire  _T_111 = io_exe_src2_i == 64'h0; // @[exe_stage.scala 191:51]
  wire  _T_112 = _T_110 | _T_111; // @[exe_stage.scala 191:40]
  wire  _T_116 = signed_mulop1 & io_exe_src1_i[63]; // @[exe_stage.scala 198:68]
  wire [63:0] _T_117 = ~io_exe_src1_i; // @[exe_stage.scala 198:91]
  wire [63:0] _T_119 = _T_117 + 64'h1; // @[exe_stage.scala 198:100]
  wire  _T_124 = signed_mulop2 & io_exe_src2_i[63]; // @[exe_stage.scala 199:68]
  wire [63:0] _T_125 = ~io_exe_src2_i; // @[exe_stage.scala 199:91]
  wire [63:0] _T_127 = _T_125 + 64'h1; // @[exe_stage.scala 199:100]
  wire  _GEN_10 = mul_start & mul_done; // @[exe_stage.scala 190:40]
  wire  _T_129 = 2'h1 == mul_state; // @[Conditional.scala 37:30]
  wire  _T_130 = 2'h2 == mul_state; // @[Conditional.scala 37:30]
  wire  _T_131 = mul_cnt != 4'h8; // @[exe_stage.scala 215:23]
  wire  _T_132 = mul_cnt == 4'h0; // @[exe_stage.scala 219:40]
  wire  _T_133 = mul_cnt == 4'h1; // @[exe_stage.scala 219:59]
  wire  _T_134 = _T_132 | _T_133; // @[exe_stage.scala 219:48]
  wire  _T_136 = mul_cnt == 4'h2; // @[exe_stage.scala 220:44]
  wire  _T_137 = mul_cnt == 4'h3; // @[exe_stage.scala 220:63]
  wire  _T_138 = _T_136 | _T_137; // @[exe_stage.scala 220:52]
  wire  _T_140 = mul_cnt == 4'h4; // @[exe_stage.scala 221:44]
  wire  _T_141 = mul_cnt == 4'h5; // @[exe_stage.scala 221:63]
  wire  _T_142 = _T_140 | _T_141; // @[exe_stage.scala 221:52]
  wire  _T_144 = mul_cnt == 4'h6; // @[exe_stage.scala 222:44]
  wire  _T_145 = mul_cnt == 4'h7; // @[exe_stage.scala 222:63]
  wire  _T_146 = _T_144 | _T_145; // @[exe_stage.scala 222:52]
  wire [15:0] _T_148 = _T_146 ? mul_temp_op1[63:48] : 16'h0; // @[Mux.scala 98:16]
  wire [15:0] _T_149 = _T_142 ? mul_temp_op1[47:32] : _T_148; // @[Mux.scala 98:16]
  wire [15:0] _T_150 = _T_138 ? mul_temp_op1[31:16] : _T_149; // @[Mux.scala 98:16]
  wire [15:0] _T_151 = _T_134 ? mul_temp_op1[15:0] : _T_150; // @[Mux.scala 98:16]
  wire [31:0] _T_153 = _T_151 * mul_temp_op2[15:0]; // @[exe_stage.scala 226:33]
  wire [31:0] _T_155 = _T_151 * mul_temp_op2[31:16]; // @[exe_stage.scala 227:25]
  wire [31:0] _T_157 = _T_151 * mul_temp_op2[47:32]; // @[exe_stage.scala 228:25]
  wire [31:0] _T_159 = _T_151 * mul_temp_op2[63:48]; // @[exe_stage.scala 229:25]
  wire [47:0] _T_160 = {16'h0,mul_temp1}; // @[Cat.scala 30:58]
  wire [47:0] _T_161 = {mul_temp2,16'h0}; // @[Cat.scala 30:58]
  wire [47:0] _T_163 = _T_160 + _T_161; // @[exe_stage.scala 230:49]
  wire [47:0] _T_164 = {16'h0,mul_temp3}; // @[Cat.scala 30:58]
  wire [47:0] _T_165 = {mul_temp4,16'h0}; // @[Cat.scala 30:58]
  wire [47:0] _T_167 = _T_164 + _T_165; // @[exe_stage.scala 231:49]
  wire [47:0] _GEN_18 = _T_131 ? _T_163 : 48'h0; // @[exe_stage.scala 215:37]
  wire [47:0] _GEN_34 = _T_130 ? _GEN_18 : 48'h0; // @[Conditional.scala 39:67]
  wire [47:0] _GEN_48 = _T_129 ? 48'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire [47:0] temp_sum1 = _T_108 ? 48'h0 : _GEN_48; // @[Conditional.scala 40:58]
  wire [79:0] _T_168 = {32'h0,temp_sum1}; // @[Cat.scala 30:58]
  wire [47:0] _GEN_19 = _T_131 ? _T_167 : 48'h0; // @[exe_stage.scala 215:37]
  wire [47:0] _GEN_35 = _T_130 ? _GEN_19 : 48'h0; // @[Conditional.scala 39:67]
  wire [47:0] _GEN_49 = _T_129 ? 48'h0 : _GEN_35; // @[Conditional.scala 39:67]
  wire [47:0] temp_sum2 = _T_108 ? 48'h0 : _GEN_49; // @[Conditional.scala 40:58]
  wire [79:0] _T_169 = {temp_sum2,32'h0}; // @[Cat.scala 30:58]
  wire [79:0] _T_171 = _T_168 + _T_169; // @[exe_stage.scala 232:51]
  wire [79:0] _GEN_20 = _T_131 ? _T_171 : 80'h0; // @[exe_stage.scala 215:37]
  wire [79:0] _GEN_36 = _T_130 ? _GEN_20 : 80'h0; // @[Conditional.scala 39:67]
  wire [79:0] _GEN_50 = _T_129 ? 80'h0 : _GEN_36; // @[Conditional.scala 39:67]
  wire [79:0] temp_result = _T_108 ? 80'h0 : _GEN_50; // @[Conditional.scala 40:58]
  wire [95:0] _T_174 = {temp_result,16'h0}; // @[Cat.scala 30:58]
  wire [127:0] _GEN_174 = {{32'd0}, _T_174}; // @[exe_stage.scala 237:72]
  wire [127:0] _T_176 = multemp + _GEN_174; // @[exe_stage.scala 237:72]
  wire [111:0] _T_178 = {temp_result,32'h0}; // @[Cat.scala 30:58]
  wire [127:0] _GEN_175 = {{16'd0}, _T_178}; // @[exe_stage.scala 238:72]
  wire [127:0] _T_180 = multemp + _GEN_175; // @[exe_stage.scala 238:72]
  wire [127:0] _T_182 = {temp_result,48'h0}; // @[Cat.scala 30:58]
  wire [127:0] _T_184 = multemp + _T_182; // @[exe_stage.scala 239:72]
  wire [3:0] _T_190 = mul_cnt + 4'h1; // @[exe_stage.scala 240:38]
  wire  _T_191 = ~signed_mulop1; // @[exe_stage.scala 243:32]
  wire  _T_192 = ~signed_mulop2; // @[exe_stage.scala 243:57]
  wire  _T_193 = _T_191 & _T_192; // @[exe_stage.scala 243:40]
  wire  _T_196 = signed_mulop1 & _T_192; // @[exe_stage.scala 245:58]
  wire [127:0] _T_199 = ~multemp; // @[exe_stage.scala 246:63]
  wire [127:0] _T_201 = _T_199 + 128'h1; // @[exe_stage.scala 246:72]
  wire  _T_206 = io_exe_src1_i[63] ^ io_exe_src2_i[63]; // @[exe_stage.scala 248:54]
  wire  _T_211 = 2'h3 == mul_state; // @[Conditional.scala 37:30]
  wire  _T_212 = ~mul_start; // @[exe_stage.scala 259:33]
  wire [63:0] mulAns = mulres[63:0]; // @[exe_stage.scala 268:26]
  wire [63:0] mulhAns = mulres[127:64]; // @[exe_stage.scala 269:26]
  wire [31:0] _T_215 = mulres[31:0]; // @[exe_stage.scala 118:21]
  wire [63:0] mulwAns = {{32{_T_215[31]}},_T_215}; // @[exe_stage.scala 119:22]
  wire  _T_216 = io_exe_aluop_i == 8'h2a; // @[exe_stage.scala 279:37]
  wire  _T_217 = io_exe_aluop_i == 8'h2b; // @[exe_stage.scala 279:69]
  wire  _T_218 = _T_216 | _T_217; // @[exe_stage.scala 279:52]
  wire  _T_219 = io_exe_aluop_i == 8'h2c; // @[exe_stage.scala 280:37]
  wire  _T_220 = _T_218 | _T_219; // @[exe_stage.scala 279:85]
  wire  _T_221 = io_exe_aluop_i == 8'h2d; // @[exe_stage.scala 280:69]
  wire  div_inst_64 = _T_220 | _T_221; // @[exe_stage.scala 280:52]
  wire  _T_222 = io_exe_aluop_i == 8'h44; // @[exe_stage.scala 282:37]
  wire  _T_223 = io_exe_aluop_i == 8'h45; // @[exe_stage.scala 282:69]
  wire  _T_224 = _T_222 | _T_223; // @[exe_stage.scala 282:52]
  wire  _T_225 = io_exe_aluop_i == 8'h46; // @[exe_stage.scala 283:37]
  wire  _T_226 = _T_224 | _T_225; // @[exe_stage.scala 282:85]
  wire  _T_227 = io_exe_aluop_i == 8'h47; // @[exe_stage.scala 283:69]
  wire  div_inst_32 = _T_226 | _T_227; // @[exe_stage.scala 283:52]
  wire  _T_230 = _T_216 | _T_219; // @[exe_stage.scala 285:51]
  wire  _T_232 = _T_230 | _T_222; // @[exe_stage.scala 285:83]
  wire  signed_div = _T_232 | _T_225; // @[exe_stage.scala 286:51]
  reg [127:0] divres; // @[exe_stage.scala 288:23]
  reg  div_done; // @[exe_stage.scala 289:25]
  wire  _T_236 = div_inst_64 | div_inst_32; // @[exe_stage.scala 290:48]
  wire  _T_237 = ~div_done; // @[exe_stage.scala 290:84]
  wire  _T_238 = _T_236 & _T_237; // @[exe_stage.scala 290:72]
  reg [2:0] div_group_reg; // @[exe_stage.scala 293:30]
  wire  _T_246 = div_inst_64 & signed_div; // @[exe_stage.scala 295:49]
  wire  _T_248 = ~signed_div; // @[exe_stage.scala 296:79]
  wire  _T_249 = div_inst_64 & _T_248; // @[exe_stage.scala 296:65]
  wire  _T_252 = div_inst_32 & signed_div; // @[exe_stage.scala 297:65]
  wire  _T_255 = div_inst_32 & _T_248; // @[exe_stage.scala 298:65]
  wire [2:0] _T_272 = _T_255 ? 3'h4 : 3'h7; // @[Mux.scala 98:16]
  wire [2:0] _T_273 = _T_252 ? 3'h3 : _T_272; // @[Mux.scala 98:16]
  wire [2:0] _T_274 = _T_249 ? 3'h2 : _T_273; // @[Mux.scala 98:16]
  wire [2:0] div_group = _T_246 ? 3'h1 : _T_274; // @[Mux.scala 98:16]
  wire [63:0] _T_278 = {32'h0,io_exe_src1_i[31:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_279 = div_inst_32 ? _T_278 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] div_op1 = div_inst_64 ? io_exe_src1_i : _T_279; // @[Mux.scala 98:16]
  wire [63:0] _T_283 = {32'h0,io_exe_src2_i[31:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_284 = div_inst_32 ? _T_283 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] div_op2 = div_inst_64 ? io_exe_src2_i : _T_284; // @[Mux.scala 98:16]
  wire  _T_290 = div_group == div_group_reg; // @[exe_stage.scala 320:33]
  wire  _T_291 = div_op1 == io_exe_src1_i; // @[exe_stage.scala 320:64]
  wire  _T_292 = _T_290 & _T_291; // @[exe_stage.scala 320:52]
  wire  _T_293 = div_op2 == io_exe_src2_i; // @[exe_stage.scala 320:95]
  wire  _T_294 = _T_292 & _T_293; // @[exe_stage.scala 320:83]
  wire  _T_303 = div_op1 == _T_278; // @[exe_stage.scala 322:84]
  wire  _T_304 = _T_290 & _T_303; // @[exe_stage.scala 322:72]
  wire  _T_307 = div_op2 == _T_283; // @[exe_stage.scala 322:137]
  wire  _T_308 = _T_304 & _T_307; // @[exe_stage.scala 322:125]
  wire  _T_319 = _T_308 | _T_308; // @[Mux.scala 98:16]
  wire  _T_320 = _T_294 | _T_319; // @[Mux.scala 98:16]
  wire  div_haddone = _T_294 | _T_320; // @[Mux.scala 98:16]
  reg [6:0] cnt; // @[exe_stage.scala 326:25]
  reg [129:0] dividend; // @[exe_stage.scala 327:25]
  reg [65:0] divisor; // @[exe_stage.scala 328:25]
  reg [63:0] divisor_mul1; // @[exe_stage.scala 330:25]
  wire [64:0] divisor_mul2 = {divisor_mul1, 1'h0}; // @[exe_stage.scala 336:35]
  wire [65:0] _GEN_176 = {{1'd0}, divisor_mul2}; // @[exe_stage.scala 337:35]
  wire [65:0] divisor_mul3 = _GEN_176 + divisor; // @[exe_stage.scala 337:35]
  wire [66:0] _T_324 = {3'h0,dividend[127:64]}; // @[Cat.scala 30:58]
  wire [66:0] _T_325 = {1'h0,divisor}; // @[Cat.scala 30:58]
  wire [66:0] _T_327 = _T_324 - _T_325; // @[exe_stage.scala 341:54]
  wire [34:0] _T_329 = {3'h0,dividend[63:32]}; // @[Cat.scala 30:58]
  wire [66:0] _GEN_177 = {{32'd0}, _T_329}; // @[exe_stage.scala 342:70]
  wire [66:0] _T_332 = _GEN_177 - _T_325; // @[exe_stage.scala 342:70]
  wire [66:0] div_temp1 = div_inst_64 ? _T_327 : _T_332; // @[exe_stage.scala 340:22]
  wire [65:0] _T_336 = {1'h0,divisor_mul2}; // @[Cat.scala 30:58]
  wire [66:0] _GEN_178 = {{1'd0}, _T_336}; // @[exe_stage.scala 344:54]
  wire [66:0] _T_338 = _T_324 - _GEN_178; // @[exe_stage.scala 344:54]
  wire [65:0] _GEN_179 = {{31'd0}, _T_329}; // @[exe_stage.scala 345:54]
  wire [65:0] _T_343 = _GEN_179 - _T_336; // @[exe_stage.scala 345:54]
  wire [66:0] div_temp2 = div_inst_64 ? _T_338 : {{1'd0}, _T_343}; // @[exe_stage.scala 343:22]
  wire [66:0] _T_347 = {1'h0,divisor_mul3}; // @[Cat.scala 30:58]
  wire [66:0] _T_349 = _T_324 - _T_347; // @[exe_stage.scala 347:54]
  wire [66:0] _T_354 = _GEN_177 - _T_347; // @[exe_stage.scala 348:74]
  wire [66:0] div_temp3 = div_inst_64 ? _T_349 : _T_354; // @[exe_stage.scala 346:22]
  wire  _T_357 = ~div_temp3[66]; // @[exe_stage.scala 351:58]
  wire  _T_358 = div_inst_64 & _T_357; // @[exe_stage.scala 351:41]
  wire  _T_361 = ~div_temp2[66]; // @[exe_stage.scala 352:74]
  wire  _T_362 = div_inst_64 & _T_361; // @[exe_stage.scala 352:57]
  wire  _T_365 = ~div_temp3[34]; // @[exe_stage.scala 353:74]
  wire  _T_366 = div_inst_32 & _T_365; // @[exe_stage.scala 353:57]
  wire  _T_369 = ~div_temp2[34]; // @[exe_stage.scala 354:74]
  wire  _T_370 = div_inst_32 & _T_369; // @[exe_stage.scala 354:57]
  wire [66:0] _T_371 = _T_370 ? div_temp2 : div_temp1; // @[Mux.scala 98:16]
  wire [66:0] _T_372 = _T_366 ? div_temp3 : _T_371; // @[Mux.scala 98:16]
  wire [66:0] _T_373 = _T_362 ? div_temp2 : _T_372; // @[Mux.scala 98:16]
  wire [66:0] div_temp = _T_358 ? div_temp3 : _T_373; // @[Mux.scala 98:16]
  wire [1:0] _T_390 = _T_370 ? 2'h2 : 2'h1; // @[Mux.scala 98:16]
  wire [1:0] _T_391 = _T_366 ? 2'h3 : _T_390; // @[Mux.scala 98:16]
  wire [1:0] _T_392 = _T_362 ? 2'h2 : _T_391; // @[Mux.scala 98:16]
  wire [1:0] div_cnt = _T_358 ? 2'h3 : _T_392; // @[Mux.scala 98:16]
  reg [1:0] state; // @[exe_stage.scala 364:22]
  wire  _T_393 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_396 = div_op2 == 64'h0; // @[exe_stage.scala 373:38]
  wire  _T_401 = signed_div & div_op1[63]; // @[exe_stage.scala 378:50]
  wire [63:0] _T_402 = ~div_op1; // @[exe_stage.scala 379:40]
  wire [63:0] _T_404 = _T_402 + 64'h1; // @[exe_stage.scala 379:49]
  wire [129:0] _T_408 = {66'h0,_T_404}; // @[Cat.scala 30:58]
  wire [129:0] _T_409 = {66'h0,div_op1}; // @[Cat.scala 30:58]
  wire  _T_413 = signed_div & div_op2[63]; // @[exe_stage.scala 385:50]
  wire [63:0] _T_414 = ~div_op2; // @[exe_stage.scala 386:40]
  wire [63:0] _T_416 = _T_414 + 64'h1; // @[exe_stage.scala 386:49]
  wire [63:0] _GEN_70 = _T_413 ? _T_416 : div_op2; // @[exe_stage.scala 385:73]
  wire  _T_423 = signed_div & div_op1[31]; // @[exe_stage.scala 395:50]
  wire [31:0] _T_425 = ~div_op1[31:0]; // @[exe_stage.scala 396:54]
  wire [31:0] _T_427 = _T_425 + 32'h1; // @[exe_stage.scala 396:69]
  wire [65:0] _T_433 = {34'h0,_T_427}; // @[Cat.scala 30:58]
  wire [97:0] _T_436 = {34'h0,div_op1}; // @[Cat.scala 30:58]
  wire [97:0] _GEN_73 = _T_423 ? {{32'd0}, _T_433} : _T_436; // @[exe_stage.scala 395:73]
  wire  _T_440 = signed_div & div_op2[31]; // @[exe_stage.scala 402:50]
  wire [31:0] _T_442 = ~div_op2[31:0]; // @[exe_stage.scala 403:55]
  wire [31:0] _T_444 = _T_442 + 32'h1; // @[exe_stage.scala 403:70]
  wire [63:0] _T_445 = {32'h0,_T_444}; // @[Cat.scala 30:58]
  wire [63:0] _T_452 = {32'h0,div_op2[31:0]}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_74 = _T_440 ? _T_445 : _T_452; // @[exe_stage.scala 402:73]
  wire [63:0] _GEN_80 = div_inst_64 ? _GEN_70 : _GEN_74; // @[exe_stage.scala 375:50]
  wire  _GEN_100 = _T_238 & div_done; // @[exe_stage.scala 370:40]
  wire  _T_456 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire [129:0] _T_459 = {div_op1,2'h0,64'hffffffffffffffff}; // @[Cat.scala 30:58]
  wire  _T_463 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_465 = cnt != 7'h42; // @[exe_stage.scala 428:20]
  wire [129:0] _T_469 = {dividend[127:0],2'h0}; // @[Cat.scala 30:58]
  wire [129:0] _T_473 = {div_temp[63:0],dividend[63:0],div_cnt}; // @[Cat.scala 30:58]
  wire [6:0] _T_475 = cnt + 7'h2; // @[exe_stage.scala 434:36]
  wire  _T_480 = div_op1[63] ^ div_op2[63]; // @[exe_stage.scala 439:46]
  wire [63:0] _T_482 = ~dividend[63:0]; // @[exe_stage.scala 440:57]
  wire [63:0] _T_484 = _T_482 + 64'h1; // @[exe_stage.scala 440:73]
  wire [63:0] _GEN_103 = _T_480 ? _T_484 : dividend[63:0]; // @[exe_stage.scala 439:68]
  wire  _T_489 = div_op1[63] ^ dividend[129]; // @[exe_stage.scala 444:50]
  wire [63:0] _T_491 = ~dividend[129:66]; // @[exe_stage.scala 445:58]
  wire [63:0] _T_493 = _T_491 + 64'h1; // @[exe_stage.scala 445:76]
  wire [63:0] _GEN_104 = _T_489 ? _T_493 : dividend[129:66]; // @[exe_stage.scala 444:74]
  wire [63:0] _GEN_107 = _T_248 ? 64'h0 : _GEN_104; // @[exe_stage.scala 436:49]
  wire [63:0] _GEN_111 = _T_465 ? 64'h0 : _GEN_107; // @[exe_stage.scala 428:37]
  wire  _T_498 = cnt != 7'h22; // @[exe_stage.scala 455:28]
  wire  _T_531 = div_op1[31] ^ dividend[65]; // @[exe_stage.scala 471:50]
  wire [31:0] _T_533 = ~dividend[65:34]; // @[exe_stage.scala 472:73]
  wire [31:0] _T_535 = _T_533 + 32'h1; // @[exe_stage.scala 472:90]
  wire [63:0] _T_536 = {32'h0,_T_535}; // @[Cat.scala 30:58]
  wire [63:0] _T_538 = {32'h0,dividend[65:34]}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_115 = _T_531 ? _T_536 : _T_538; // @[exe_stage.scala 471:73]
  wire [63:0] _GEN_118 = _T_248 ? 64'h0 : _GEN_115; // @[exe_stage.scala 463:49]
  wire [63:0] _GEN_122 = _T_498 ? 64'h0 : _GEN_118; // @[exe_stage.scala 455:44]
  wire [63:0] _GEN_127 = div_inst_32 ? _GEN_122 : 64'h0; // @[exe_stage.scala 454:44]
  wire [63:0] _GEN_132 = div_inst_64 ? _GEN_111 : _GEN_127; // @[exe_stage.scala 427:38]
  wire [63:0] _GEN_143 = _T_463 ? _GEN_132 : 64'h0; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_151 = _T_456 ? 64'h0 : _GEN_143; // @[Conditional.scala 39:67]
  wire [63:0] dividend_high = _T_393 ? 64'h0 : _GEN_151; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_106 = _T_248 ? 64'h0 : _GEN_103; // @[exe_stage.scala 436:49]
  wire [63:0] _GEN_110 = _T_465 ? 64'h0 : _GEN_106; // @[exe_stage.scala 428:37]
  wire  _T_520 = div_op1[31] ^ div_op2[31]; // @[exe_stage.scala 466:46]
  wire [31:0] _T_522 = ~dividend[31:0]; // @[exe_stage.scala 467:72]
  wire [31:0] _T_524 = _T_522 + 32'h1; // @[exe_stage.scala 467:88]
  wire [63:0] _T_525 = {32'h0,_T_524}; // @[Cat.scala 30:58]
  wire [63:0] _T_527 = {32'h0,dividend[31:0]}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_114 = _T_520 ? _T_525 : _T_527; // @[exe_stage.scala 466:68]
  wire [63:0] _GEN_117 = _T_248 ? 64'h0 : _GEN_114; // @[exe_stage.scala 463:49]
  wire [63:0] _GEN_121 = _T_498 ? 64'h0 : _GEN_117; // @[exe_stage.scala 455:44]
  wire [63:0] _GEN_126 = div_inst_32 ? _GEN_121 : 64'h0; // @[exe_stage.scala 454:44]
  wire [63:0] _GEN_131 = div_inst_64 ? _GEN_110 : _GEN_126; // @[exe_stage.scala 427:38]
  wire [63:0] _GEN_142 = _T_463 ? _GEN_131 : 64'h0; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_150 = _T_456 ? 64'h0 : _GEN_142; // @[Conditional.scala 39:67]
  wire [63:0] dividend_low = _T_393 ? 64'h0 : _GEN_150; // @[Conditional.scala 40:58]
  wire [129:0] _T_496 = {dividend_high,2'h0,dividend_low}; // @[Cat.scala 30:58]
  wire [129:0] _T_507 = {64'h0,div_temp[31:0],dividend[31:0],div_cnt}; // @[Cat.scala 30:58]
  wire [129:0] _T_516 = {32'h0,dividend[65:34],2'h0,32'h0,dividend[31:0]}; // @[Cat.scala 30:58]
  wire  _T_541 = 2'h3 == state; // @[Conditional.scala 37:30]
  wire [127:0] _T_544 = {dividend[129:66],dividend[63:0]}; // @[Cat.scala 30:58]
  wire  _T_545 = ~_T_238; // @[exe_stage.scala 488:33]
  wire [63:0] divAns = divres[63:0]; // @[exe_stage.scala 496:25]
  wire [63:0] remAns = divres[127:64]; // @[exe_stage.scala 498:25]
  wire [31:0] _T_549 = divres[31:0]; // @[exe_stage.scala 502:44]
  wire [63:0] divwAns = {{32{_T_549[31]}},_T_549}; // @[exe_stage.scala 503:50]
  wire [31:0] _T_555 = divres[95:64]; // @[exe_stage.scala 508:45]
  wire [63:0] remwAns = {{32{_T_555[31]}},_T_555}; // @[exe_stage.scala 509:50]
  wire  _T_560 = io_mem2exe_csr_wa == io_csr_ra_o; // @[exe_stage.scala 517:89]
  wire  _T_561 = io_mem2exe_csr_we & _T_560; // @[exe_stage.scala 517:68]
  wire  _T_563 = _T_561 & io_csr_re_o; // @[exe_stage.scala 517:105]
  wire  _T_565 = io_wb2exe_csr_wa == io_csr_ra_o; // @[exe_stage.scala 518:88]
  wire  _T_566 = io_wb2exe_csr_we & _T_565; // @[exe_stage.scala 518:68]
  wire  _T_568 = _T_566 & io_csr_re_o; // @[exe_stage.scala 518:105]
  wire [63:0] _T_569 = _T_568 ? io_wb2exe_csr_wd : io_csr_rd_i; // @[Mux.scala 98:16]
  wire [63:0] csr_data = _T_563 ? io_mem2exe_csr_wd : _T_569; // @[Mux.scala 98:16]
  wire  _T_570 = io_exe_aluop_i == 8'ha; // @[exe_stage.scala 524:24]
  wire  _T_571 = io_exe_aluop_i == 8'h9; // @[exe_stage.scala 525:28]
  wire  _T_572 = io_exe_aluop_i == 8'h6; // @[exe_stage.scala 526:28]
  wire  _T_573 = io_exe_aluop_i == 8'h10; // @[exe_stage.scala 527:28]
  wire  _T_574 = io_exe_aluop_i == 8'hf; // @[exe_stage.scala 528:28]
  wire  _T_575 = io_exe_aluop_i == 8'he; // @[exe_stage.scala 529:28]
  wire [63:0] _T_576 = _T_575 ? xorAns : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_577 = _T_574 ? orAns : _T_576; // @[Mux.scala 98:16]
  wire [63:0] _T_578 = _T_573 ? andAns : _T_577; // @[Mux.scala 98:16]
  wire [63:0] _T_579 = _T_572 ? xorAns : _T_578; // @[Mux.scala 98:16]
  wire [63:0] _T_580 = _T_571 ? orAns : _T_579; // @[Mux.scala 98:16]
  wire [63:0] logicres = _T_570 ? andAns : _T_580; // @[Mux.scala 98:16]
  wire  _T_581 = io_exe_aluop_i == 8'h3; // @[exe_stage.scala 533:24]
  wire  _T_582 = io_exe_aluop_i == 8'h7; // @[exe_stage.scala 534:28]
  wire  _T_583 = io_exe_aluop_i == 8'h8; // @[exe_stage.scala 535:28]
  wire  _T_584 = io_exe_aluop_i == 8'h11; // @[exe_stage.scala 536:28]
  wire  _T_585 = io_exe_aluop_i == 8'h12; // @[exe_stage.scala 537:28]
  wire  _T_586 = io_exe_aluop_i == 8'h13; // @[exe_stage.scala 538:28]
  wire  _T_587 = io_exe_aluop_i == 8'h40; // @[exe_stage.scala 539:28]
  wire  _T_588 = io_exe_aluop_i == 8'h41; // @[exe_stage.scala 540:28]
  wire  _T_589 = io_exe_aluop_i == 8'h42; // @[exe_stage.scala 541:28]
  wire  _T_590 = io_exe_aluop_i == 8'h3b; // @[exe_stage.scala 542:28]
  wire  _T_591 = io_exe_aluop_i == 8'h3c; // @[exe_stage.scala 543:28]
  wire  _T_592 = io_exe_aluop_i == 8'h3d; // @[exe_stage.scala 544:28]
  wire [63:0] _T_593 = _T_592 ? srawAns : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_594 = _T_591 ? srlwAns : _T_593; // @[Mux.scala 98:16]
  wire [63:0] _T_595 = _T_590 ? sllwAns : _T_594; // @[Mux.scala 98:16]
  wire [63:0] _T_596 = _T_589 ? srawAns : _T_595; // @[Mux.scala 98:16]
  wire [63:0] _T_597 = _T_588 ? srlwAns : _T_596; // @[Mux.scala 98:16]
  wire [63:0] _T_598 = _T_587 ? sllwAns : _T_597; // @[Mux.scala 98:16]
  wire [63:0] _T_599 = _T_586 ? sraAns : _T_598; // @[Mux.scala 98:16]
  wire [63:0] _T_600 = _T_585 ? srlAns : _T_599; // @[Mux.scala 98:16]
  wire [63:0] _T_601 = _T_584 ? sllAns : _T_600; // @[Mux.scala 98:16]
  wire [63:0] _T_602 = _T_583 ? sraAns : _T_601; // @[Mux.scala 98:16]
  wire [63:0] _T_603 = _T_582 ? srlAns : _T_602; // @[Mux.scala 98:16]
  wire [63:0] shiftres = _T_581 ? sllAns : _T_603; // @[Mux.scala 98:16]
  wire  _T_604 = io_exe_aluop_i == 8'h1; // @[exe_stage.scala 548:24]
  wire  _T_605 = io_exe_aluop_i == 8'h2; // @[exe_stage.scala 549:28]
  wire  _T_606 = io_exe_aluop_i == 8'h4; // @[exe_stage.scala 550:28]
  wire  _T_607 = io_exe_aluop_i == 8'h5; // @[exe_stage.scala 551:28]
  wire  _T_608 = io_exe_aluop_i == 8'hb; // @[exe_stage.scala 552:28]
  wire  _T_609 = io_exe_aluop_i == 8'hc; // @[exe_stage.scala 553:28]
  wire  _T_610 = io_exe_aluop_i == 8'hd; // @[exe_stage.scala 554:28]
  wire  _T_611 = io_exe_aluop_i == 8'h14; // @[exe_stage.scala 555:28]
  wire  _T_612 = io_exe_aluop_i == 8'h15; // @[exe_stage.scala 556:28]
  wire  _T_613 = io_exe_aluop_i == 8'h16; // @[exe_stage.scala 557:28]
  wire  _T_614 = io_exe_aluop_i == 8'h17; // @[exe_stage.scala 558:28]
  wire  _T_615 = io_exe_aluop_i == 8'h18; // @[exe_stage.scala 559:28]
  wire  _T_616 = io_exe_aluop_i == 8'h19; // @[exe_stage.scala 560:28]
  wire  _T_617 = io_exe_aluop_i == 8'h1a; // @[exe_stage.scala 561:28]
  wire  _T_618 = io_exe_aluop_i == 8'h1b; // @[exe_stage.scala 562:28]
  wire  _T_619 = io_exe_aluop_i == 8'h1c; // @[exe_stage.scala 563:24]
  wire  _T_620 = io_exe_aluop_i == 8'h1d; // @[exe_stage.scala 564:24]
  wire  _T_629 = io_exe_aluop_i == 8'h37; // @[exe_stage.scala 573:28]
  wire  _T_630 = io_exe_aluop_i == 8'h38; // @[exe_stage.scala 574:28]
  wire  _T_631 = io_exe_aluop_i == 8'h39; // @[exe_stage.scala 575:28]
  wire  _T_632 = io_exe_aluop_i == 8'h3a; // @[exe_stage.scala 576:28]
  wire  _T_633 = io_exe_aluop_i == 8'h3e; // @[exe_stage.scala 577:28]
  wire  _T_634 = io_exe_aluop_i == 8'h3f; // @[exe_stage.scala 578:28]
  wire [63:0] _T_640 = _T_227 ? remwAns : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_641 = _T_225 ? remwAns : _T_640; // @[Mux.scala 98:16]
  wire [63:0] _T_642 = _T_223 ? divwAns : _T_641; // @[Mux.scala 98:16]
  wire [63:0] _T_643 = _T_222 ? divwAns : _T_642; // @[Mux.scala 98:16]
  wire [63:0] _T_644 = _T_94 ? mulwAns : _T_643; // @[Mux.scala 98:16]
  wire [63:0] _T_645 = _T_634 ? subwAns : _T_644; // @[Mux.scala 98:16]
  wire [63:0] _T_646 = _T_633 ? addiwAns : _T_645; // @[Mux.scala 98:16]
  wire [63:0] _T_647 = _T_632 ? addiwAns : _T_646; // @[Mux.scala 98:16]
  wire [63:0] _T_648 = _T_631 ? addAns : _T_647; // @[Mux.scala 98:16]
  wire [63:0] _T_649 = _T_630 ? addAns : _T_648; // @[Mux.scala 98:16]
  wire [63:0] _T_650 = _T_629 ? addAns : _T_649; // @[Mux.scala 98:16]
  wire [63:0] _T_651 = _T_221 ? remAns : _T_650; // @[Mux.scala 98:16]
  wire [63:0] _T_652 = _T_219 ? remAns : _T_651; // @[Mux.scala 98:16]
  wire [63:0] _T_653 = _T_217 ? divAns : _T_652; // @[Mux.scala 98:16]
  wire [63:0] _T_654 = _T_216 ? divAns : _T_653; // @[Mux.scala 98:16]
  wire [63:0] _T_655 = _T_92 ? mulhAns : _T_654; // @[Mux.scala 98:16]
  wire [63:0] _T_656 = _T_90 ? mulhAns : _T_655; // @[Mux.scala 98:16]
  wire [63:0] _T_657 = _T_88 ? mulhAns : _T_656; // @[Mux.scala 98:16]
  wire [63:0] _T_658 = _T_87 ? mulAns : _T_657; // @[Mux.scala 98:16]
  wire [63:0] _T_659 = _T_620 ? auipcAns : _T_658; // @[Mux.scala 98:16]
  wire [63:0] _T_660 = _T_619 ? luiAns : _T_659; // @[Mux.scala 98:16]
  wire [63:0] _T_661 = _T_618 ? addAns : _T_660; // @[Mux.scala 98:16]
  wire [63:0] _T_662 = _T_617 ? addAns : _T_661; // @[Mux.scala 98:16]
  wire [63:0] _T_663 = _T_616 ? addAns : _T_662; // @[Mux.scala 98:16]
  wire [63:0] _T_664 = _T_615 ? addAns : _T_663; // @[Mux.scala 98:16]
  wire [63:0] _T_665 = _T_614 ? addAns : _T_664; // @[Mux.scala 98:16]
  wire [63:0] _T_666 = _T_613 ? addAns : _T_665; // @[Mux.scala 98:16]
  wire [63:0] _T_667 = _T_612 ? addAns : _T_666; // @[Mux.scala 98:16]
  wire [63:0] _T_668 = _T_611 ? addAns : _T_667; // @[Mux.scala 98:16]
  wire [63:0] _T_669 = _T_610 ? sltuAns : _T_668; // @[Mux.scala 98:16]
  wire [63:0] _T_670 = _T_609 ? sltAns : _T_669; // @[Mux.scala 98:16]
  wire [63:0] _T_671 = _T_608 ? addAns : _T_670; // @[Mux.scala 98:16]
  wire [63:0] _T_672 = _T_607 ? sltuAns : _T_671; // @[Mux.scala 98:16]
  wire [63:0] _T_673 = _T_606 ? sltAns : _T_672; // @[Mux.scala 98:16]
  wire [63:0] _T_674 = _T_605 ? subAns : _T_673; // @[Mux.scala 98:16]
  wire [63:0] arithres = _T_604 ? addAns : _T_674; // @[Mux.scala 98:16]
  wire  _T_675 = io_exe_aluop_i == 8'h2e; // @[exe_stage.scala 587:28]
  wire  _T_676 = io_exe_aluop_i == 8'h2f; // @[exe_stage.scala 588:28]
  wire  _T_677 = io_exe_aluop_i == 8'h30; // @[exe_stage.scala 589:28]
  wire  _T_678 = io_exe_aluop_i == 8'h31; // @[exe_stage.scala 590:28]
  wire  _T_679 = io_exe_aluop_i == 8'h32; // @[exe_stage.scala 591:28]
  wire  _T_680 = io_exe_aluop_i == 8'h33; // @[exe_stage.scala 592:28]
  wire [63:0] _T_681 = _T_680 ? csr_data : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_682 = _T_679 ? csr_data : _T_681; // @[Mux.scala 98:16]
  wire [63:0] _T_683 = _T_678 ? csr_data : _T_682; // @[Mux.scala 98:16]
  wire [63:0] _T_684 = _T_677 ? csr_data : _T_683; // @[Mux.scala 98:16]
  wire [63:0] _T_685 = _T_676 ? csr_data : _T_684; // @[Mux.scala 98:16]
  wire [63:0] csrres = _T_675 ? csr_data : _T_685; // @[Mux.scala 98:16]
  wire  _T_686 = io_exe_aluop_i == 8'h1e; // @[exe_stage.scala 596:28]
  wire  _T_687 = io_exe_aluop_i == 8'h25; // @[exe_stage.scala 597:28]
  wire [63:0] _T_688 = _T_687 ? jalrAns : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] ret_addr = _T_686 ? jalrAns : _T_688; // @[Mux.scala 98:16]
  wire  _T_689 = io_exe_alutype_i == 3'h0; // @[exe_stage.scala 602:24]
  wire  _T_690 = io_exe_alutype_i == 3'h1; // @[exe_stage.scala 603:28]
  wire  _T_691 = io_exe_alutype_i == 3'h2; // @[exe_stage.scala 604:28]
  wire  _T_692 = io_exe_alutype_i == 3'h4; // @[exe_stage.scala 605:24]
  wire  _T_693 = io_exe_alutype_i == 3'h5; // @[exe_stage.scala 606:28]
  wire  _T_694 = io_exe_alutype_i == 3'h6; // @[exe_stage.scala 607:28]
  wire [63:0] _T_695 = _T_694 ? csrres : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_696 = _T_693 ? ret_addr : _T_695; // @[Mux.scala 98:16]
  wire [63:0] _T_697 = _T_692 ? shiftres : _T_696; // @[Mux.scala 98:16]
  wire [63:0] _T_698 = _T_691 ? logicres : _T_697; // @[Mux.scala 98:16]
  wire [63:0] _T_699 = _T_690 ? arithres : _T_698; // @[Mux.scala 98:16]
  wire [63:0] _T_704 = csr_data | io_exe_src1_i; // @[exe_stage.scala 618:60]
  wire [63:0] _T_707 = csr_data & _T_117; // @[exe_stage.scala 619:60]
  wire [63:0] _T_714 = _T_680 ? _T_707 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_715 = _T_679 ? _T_704 : _T_714; // @[Mux.scala 98:16]
  wire [63:0] _T_716 = _T_678 ? io_exe_src1_i : _T_715; // @[Mux.scala 98:16]
  wire [63:0] _T_717 = _T_677 ? _T_707 : _T_716; // @[Mux.scala 98:16]
  wire [63:0] _T_718 = _T_676 ? _T_704 : _T_717; // @[Mux.scala 98:16]
  wire [63:0] _T_719 = _T_675 ? io_exe_src1_i : _T_718; // @[Mux.scala 98:16]
  assign io_exe_pc_o = io_exe_pc_i; // @[exe_stage.scala 59:22]
  assign io_exe_aluop_o = io_exe_aluop_i; // @[exe_stage.scala 60:22]
  assign io_exe_wa_o = io_exe_wa_i; // @[exe_stage.scala 63:22]
  assign io_exe_wreg_o = io_exe_wreg_i; // @[exe_stage.scala 64:22]
  assign io_exe_wd_o = _T_689 ? 64'h0 : _T_699; // @[exe_stage.scala 601:15]
  assign io_exe_mreg_o = io_exe_mreg_i; // @[exe_stage.scala 61:22]
  assign io_exe_din_o = io_exe_din_i; // @[exe_stage.scala 62:22]
  assign io_csr_wa_o = _T_694 ? io_csr_addr_i : 12'h0; // @[exe_stage.scala 615:21 exe_stage.scala 627:21]
  assign io_csr_wd_o = _T_694 ? _T_719 : 64'h0; // @[exe_stage.scala 616:21 exe_stage.scala 628:21]
  assign io_csr_we_o = io_exe_alutype_i == 3'h6; // @[exe_stage.scala 614:21 exe_stage.scala 626:21]
  assign io_exe_exccode_o = io_exe_exccode_i; // @[exe_stage.scala 65:22]
  assign io_exe_jump_addr_o = io_exe_jump_addr_i; // @[exe_stage.scala 66:22]
  assign io_stallreq_exe = _T_238 | mul_start; // @[exe_stage.scala 290:19]
  assign io_csr_ra_o = _T_694 ? io_csr_addr_i : 12'h0; // @[exe_stage.scala 612:21 exe_stage.scala 624:17]
  assign io_csr_re_o = io_exe_alutype_i == 3'h6; // @[exe_stage.scala 613:21 exe_stage.scala 625:21]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {4{`RANDOM}};
  mulres = _RAND_0[127:0];
  _RAND_1 = {1{`RANDOM}};
  mul_done = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mul_cnt = _RAND_2[3:0];
  _RAND_3 = {4{`RANDOM}};
  multemp = _RAND_3[127:0];
  _RAND_4 = {2{`RANDOM}};
  mul_temp_op1 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  mul_temp_op2 = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  mul_temp1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  mul_temp2 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  mul_temp3 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  mul_temp4 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  mul_state = _RAND_10[1:0];
  _RAND_11 = {4{`RANDOM}};
  divres = _RAND_11[127:0];
  _RAND_12 = {1{`RANDOM}};
  div_done = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  div_group_reg = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  cnt = _RAND_14[6:0];
  _RAND_15 = {5{`RANDOM}};
  dividend = _RAND_15[129:0];
  _RAND_16 = {3{`RANDOM}};
  divisor = _RAND_16[65:0];
  _RAND_17 = {2{`RANDOM}};
  divisor_mul1 = _RAND_17[63:0];
  _RAND_18 = {1{`RANDOM}};
  state = _RAND_18[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      mulres <= 128'h0;
    end else if (_T_108) begin
      if (!(mul_start)) begin
        mulres <= 128'h0;
      end
    end else if (!(_T_129)) begin
      if (!(_T_130)) begin
        if (_T_211) begin
          if (_T_212) begin
            mulres <= 128'h0;
          end else begin
            mulres <= multemp;
          end
        end
      end
    end
    if (reset) begin
      mul_done <= 1'h0;
    end else if (_T_108) begin
      mul_done <= _GEN_10;
    end else if (!(_T_129)) begin
      if (!(_T_130)) begin
        if (_T_211) begin
          if (_T_212) begin
            mul_done <= 1'h0;
          end else begin
            mul_done <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      mul_cnt <= 4'h0;
    end else if (_T_108) begin
      if (mul_start) begin
        if (!(_T_112)) begin
          mul_cnt <= 4'h0;
        end
      end
    end else if (!(_T_129)) begin
      if (_T_130) begin
        if (_T_131) begin
          mul_cnt <= _T_190;
        end else begin
          mul_cnt <= 4'h0;
        end
      end
    end
    if (reset) begin
      multemp <= 128'h0;
    end else if (_T_108) begin
      if (mul_start) begin
        if (!(_T_112)) begin
          multemp <= 128'h0;
        end
      end
    end else if (_T_129) begin
      multemp <= 128'h0;
    end else if (_T_130) begin
      if (_T_131) begin
        if (_T_133) begin
          multemp <= {{48'd0}, temp_result};
        end else if (_T_137) begin
          multemp <= _T_176;
        end else if (_T_141) begin
          multemp <= _T_180;
        end else if (_T_145) begin
          multemp <= _T_184;
        end
      end else if (!(_T_193)) begin
        if (_T_196) begin
          if (io_exe_src1_i[63]) begin
            multemp <= _T_201;
          end
        end else if (_T_206) begin
          multemp <= _T_201;
        end
      end
    end
    if (reset) begin
      mul_temp_op1 <= 64'h0;
    end else if (_T_108) begin
      if (mul_start) begin
        if (!(_T_112)) begin
          if (_T_116) begin
            mul_temp_op1 <= _T_119;
          end else begin
            mul_temp_op1 <= io_exe_src1_i;
          end
        end
      end
    end
    if (reset) begin
      mul_temp_op2 <= 64'h0;
    end else if (_T_108) begin
      if (mul_start) begin
        if (!(_T_112)) begin
          if (_T_124) begin
            mul_temp_op2 <= _T_127;
          end else begin
            mul_temp_op2 <= io_exe_src2_i;
          end
        end
      end
    end
    if (reset) begin
      mul_temp1 <= 32'h0;
    end else if (!(_T_108)) begin
      if (!(_T_129)) begin
        if (_T_130) begin
          if (_T_131) begin
            mul_temp1 <= _T_153;
          end
        end
      end
    end
    if (reset) begin
      mul_temp2 <= 32'h0;
    end else if (!(_T_108)) begin
      if (!(_T_129)) begin
        if (_T_130) begin
          if (_T_131) begin
            mul_temp2 <= _T_155;
          end
        end
      end
    end
    if (reset) begin
      mul_temp3 <= 32'h0;
    end else if (!(_T_108)) begin
      if (!(_T_129)) begin
        if (_T_130) begin
          if (_T_131) begin
            mul_temp3 <= _T_157;
          end
        end
      end
    end
    if (reset) begin
      mul_temp4 <= 32'h0;
    end else if (!(_T_108)) begin
      if (!(_T_129)) begin
        if (_T_130) begin
          if (_T_131) begin
            mul_temp4 <= _T_159;
          end
        end
      end
    end
    if (reset) begin
      mul_state <= 2'h0;
    end else if (_T_108) begin
      if (mul_start) begin
        if (_T_112) begin
          mul_state <= 2'h1;
        end else begin
          mul_state <= 2'h2;
        end
      end
    end else if (_T_129) begin
      mul_state <= 2'h3;
    end else if (_T_130) begin
      if (!(_T_131)) begin
        mul_state <= 2'h3;
      end
    end else if (_T_211) begin
      if (_T_212) begin
        mul_state <= 2'h0;
      end
    end
    if (reset) begin
      divres <= 128'h0;
    end else if (_T_393) begin
      if (!(_T_238)) begin
        divres <= 128'h0;
      end
    end else if (!(_T_456)) begin
      if (!(_T_463)) begin
        if (_T_541) begin
          if (_T_545) begin
            divres <= 128'h0;
          end else begin
            divres <= _T_544;
          end
        end
      end
    end
    if (reset) begin
      div_done <= 1'h0;
    end else if (_T_393) begin
      div_done <= _GEN_100;
    end else if (!(_T_456)) begin
      if (!(_T_463)) begin
        if (_T_541) begin
          if (_T_545) begin
            div_done <= 1'h0;
          end else begin
            div_done <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      div_group_reg <= 3'h0;
    end else if (_T_246) begin
      div_group_reg <= 3'h1;
    end else if (_T_249) begin
      div_group_reg <= 3'h2;
    end else if (_T_252) begin
      div_group_reg <= 3'h3;
    end else if (_T_255) begin
      div_group_reg <= 3'h4;
    end
    if (reset) begin
      cnt <= 7'h0;
    end else if (_T_393) begin
      if (_T_238) begin
        if (!(div_haddone)) begin
          if (!(_T_396)) begin
            cnt <= 7'h0;
          end
        end
      end
    end else if (!(_T_456)) begin
      if (_T_463) begin
        if (div_inst_64) begin
          if (_T_465) begin
            cnt <= _T_475;
          end else begin
            cnt <= 7'h0;
          end
        end else if (div_inst_32) begin
          if (_T_498) begin
            cnt <= _T_475;
          end else begin
            cnt <= 7'h0;
          end
        end
      end
    end
    if (reset) begin
      dividend <= 130'h0;
    end else if (_T_393) begin
      if (_T_238) begin
        if (!(div_haddone)) begin
          if (!(_T_396)) begin
            if (div_inst_64) begin
              if (_T_401) begin
                dividend <= _T_408;
              end else begin
                dividend <= _T_409;
              end
            end else begin
              dividend <= {{32'd0}, _GEN_73};
            end
          end
        end
      end
    end else if (_T_456) begin
      if (signed_div) begin
        dividend <= _T_459;
      end else begin
        dividend <= _T_459;
      end
    end else if (_T_463) begin
      if (div_inst_64) begin
        if (_T_465) begin
          if (div_temp[66]) begin
            dividend <= _T_469;
          end else begin
            dividend <= _T_473;
          end
        end else if (!(_T_248)) begin
          dividend <= _T_496;
        end
      end else if (div_inst_32) begin
        if (_T_498) begin
          if (div_temp[34]) begin
            dividend <= _T_469;
          end else begin
            dividend <= _T_507;
          end
        end else if (_T_248) begin
          dividend <= _T_516;
        end else begin
          dividend <= _T_496;
        end
      end
    end
    if (reset) begin
      divisor <= 66'h0;
    end else if (_T_393) begin
      if (_T_238) begin
        if (!(div_haddone)) begin
          if (!(_T_396)) begin
            divisor <= {{2'd0}, _GEN_80};
          end
        end
      end
    end
    if (reset) begin
      divisor_mul1 <= 64'h0;
    end else if (_T_393) begin
      if (_T_238) begin
        if (!(div_haddone)) begin
          if (!(_T_396)) begin
            if (div_inst_64) begin
              if (_T_413) begin
                divisor_mul1 <= _T_416;
              end else if (div_inst_64) begin
                divisor_mul1 <= io_exe_src2_i;
              end else if (div_inst_32) begin
                divisor_mul1 <= _T_283;
              end else begin
                divisor_mul1 <= 64'h0;
              end
            end else if (_T_440) begin
              divisor_mul1 <= _T_445;
            end else begin
              divisor_mul1 <= _T_452;
            end
          end
        end
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_393) begin
      if (_T_238) begin
        if (div_haddone) begin
          state <= 2'h3;
        end else if (_T_396) begin
          state <= 2'h1;
        end else begin
          state <= 2'h2;
        end
      end
    end else if (_T_456) begin
      state <= 2'h3;
    end else if (_T_463) begin
      if (div_inst_64) begin
        if (!(_T_465)) begin
          state <= 2'h3;
        end
      end else if (div_inst_32) begin
        if (!(_T_498)) begin
          state <= 2'h3;
        end
      end
    end else if (_T_541) begin
      if (_T_545) begin
        state <= 2'h0;
      end
    end
  end
endmodule
module exemem_reg(
  input         clock,
  input         reset,
  input  [63:0] io_exe_pc,
  input  [7:0]  io_exe_aluop,
  input  [4:0]  io_exe_wa,
  input         io_exe_wreg,
  input  [63:0] io_exe_wd,
  input         io_exe_mreg,
  input  [63:0] io_exe_din,
  input         io_exe_csr_we,
  input  [11:0] io_exe_csr_wa,
  input  [63:0] io_exe_csr_wd,
  input  [4:0]  io_exe_exccode,
  input  [63:0] io_exe_jump_addr,
  output [63:0] io_mem_pc,
  output [7:0]  io_mem_aluop,
  output [4:0]  io_mem_wa,
  output        io_mem_wreg,
  output [63:0] io_mem_wd,
  output        io_mem_mreg,
  output [63:0] io_mem_din,
  output        io_mem_csr_we,
  output [11:0] io_mem_csr_wa,
  output [63:0] io_mem_csr_wd,
  output [4:0]  io_mem_exccode,
  output [63:0] io_mem_jump_addr,
  input  [4:0]  io_stall,
  input         io_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pc_reg; // @[exemem_reg.scala 48:36]
  reg [7:0] aluop_reg; // @[exemem_reg.scala 49:32]
  reg [4:0] wa_reg; // @[exemem_reg.scala 50:36]
  reg  wreg_reg; // @[exemem_reg.scala 51:36]
  reg [63:0] wd_reg; // @[exemem_reg.scala 52:36]
  reg  mreg_reg; // @[exemem_reg.scala 53:36]
  reg [63:0] din_reg; // @[exemem_reg.scala 54:36]
  reg  csr_we_reg; // @[exemem_reg.scala 55:36]
  reg [11:0] csr_wa_reg; // @[exemem_reg.scala 56:36]
  reg [63:0] csr_wd_reg; // @[exemem_reg.scala 57:36]
  reg [4:0] exccode_reg; // @[exemem_reg.scala 58:36]
  reg [63:0] jump_addr_reg; // @[exemem_reg.scala 59:36]
  wire  _T_4 = ~io_stall[4]; // @[exemem_reg.scala 74:55]
  wire  _T_5 = io_stall[3] & _T_4; // @[exemem_reg.scala 74:40]
  wire  _T_7 = ~io_stall[3]; // @[exemem_reg.scala 87:32]
  assign io_mem_pc = pc_reg; // @[exemem_reg.scala 115:26]
  assign io_mem_aluop = aluop_reg; // @[exemem_reg.scala 116:22]
  assign io_mem_wa = wa_reg; // @[exemem_reg.scala 117:22]
  assign io_mem_wreg = wreg_reg; // @[exemem_reg.scala 118:22]
  assign io_mem_wd = wd_reg; // @[exemem_reg.scala 119:22]
  assign io_mem_mreg = mreg_reg; // @[exemem_reg.scala 120:22]
  assign io_mem_din = din_reg; // @[exemem_reg.scala 121:22]
  assign io_mem_csr_we = csr_we_reg; // @[exemem_reg.scala 122:26]
  assign io_mem_csr_wa = csr_wa_reg; // @[exemem_reg.scala 123:26]
  assign io_mem_csr_wd = csr_wd_reg; // @[exemem_reg.scala 124:26]
  assign io_mem_exccode = exccode_reg; // @[exemem_reg.scala 125:26]
  assign io_mem_jump_addr = jump_addr_reg; // @[exemem_reg.scala 126:26]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  pc_reg = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  aluop_reg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  wa_reg = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  wreg_reg = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  wd_reg = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  mreg_reg = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  din_reg = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  csr_we_reg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  csr_wa_reg = _RAND_8[11:0];
  _RAND_9 = {2{`RANDOM}};
  csr_wd_reg = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  exccode_reg = _RAND_10[4:0];
  _RAND_11 = {2{`RANDOM}};
  jump_addr_reg = _RAND_11[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pc_reg <= 64'h0;
    end else if (io_flush) begin
      pc_reg <= 64'h0;
    end else if (_T_5) begin
      pc_reg <= 64'h0;
    end else if (_T_7) begin
      pc_reg <= io_exe_pc;
    end
    if (reset) begin
      aluop_reg <= 8'h0;
    end else if (io_flush) begin
      aluop_reg <= 8'h3;
    end else if (_T_5) begin
      aluop_reg <= 8'h3;
    end else if (_T_7) begin
      aluop_reg <= io_exe_aluop;
    end
    if (reset) begin
      wa_reg <= 5'h0;
    end else if (io_flush) begin
      wa_reg <= 5'h0;
    end else if (_T_5) begin
      wa_reg <= 5'h0;
    end else if (_T_7) begin
      wa_reg <= io_exe_wa;
    end
    if (reset) begin
      wreg_reg <= 1'h0;
    end else if (io_flush) begin
      wreg_reg <= 1'h0;
    end else if (_T_5) begin
      wreg_reg <= 1'h0;
    end else if (_T_7) begin
      wreg_reg <= io_exe_wreg;
    end
    if (reset) begin
      wd_reg <= 64'h0;
    end else if (io_flush) begin
      wd_reg <= 64'h0;
    end else if (_T_5) begin
      wd_reg <= 64'h0;
    end else if (_T_7) begin
      wd_reg <= io_exe_wd;
    end
    if (reset) begin
      mreg_reg <= 1'h0;
    end else if (io_flush) begin
      mreg_reg <= 1'h0;
    end else if (_T_5) begin
      mreg_reg <= 1'h0;
    end else if (_T_7) begin
      mreg_reg <= io_exe_mreg;
    end
    if (reset) begin
      din_reg <= 64'h0;
    end else if (io_flush) begin
      din_reg <= 64'h0;
    end else if (_T_5) begin
      din_reg <= 64'h0;
    end else if (_T_7) begin
      din_reg <= io_exe_din;
    end
    if (reset) begin
      csr_we_reg <= 1'h0;
    end else if (io_flush) begin
      csr_we_reg <= 1'h0;
    end else if (_T_5) begin
      csr_we_reg <= 1'h0;
    end else if (_T_7) begin
      csr_we_reg <= io_exe_csr_we;
    end
    if (reset) begin
      csr_wa_reg <= 12'h0;
    end else if (io_flush) begin
      csr_wa_reg <= 12'h0;
    end else if (_T_5) begin
      csr_wa_reg <= 12'h0;
    end else if (_T_7) begin
      csr_wa_reg <= io_exe_csr_wa;
    end
    if (reset) begin
      csr_wd_reg <= 64'h0;
    end else if (io_flush) begin
      csr_wd_reg <= 64'h0;
    end else if (_T_5) begin
      csr_wd_reg <= 64'h0;
    end else if (_T_7) begin
      csr_wd_reg <= io_exe_csr_wd;
    end
    if (reset) begin
      exccode_reg <= 5'h1f;
    end else if (io_flush) begin
      exccode_reg <= 5'h1f;
    end else if (_T_5) begin
      exccode_reg <= 5'h1f;
    end else if (_T_7) begin
      exccode_reg <= io_exe_exccode;
    end
    if (reset) begin
      jump_addr_reg <= 64'h0;
    end else if (io_flush) begin
      jump_addr_reg <= 64'h0;
    end else if (_T_5) begin
      jump_addr_reg <= 64'h0;
    end else if (_T_7) begin
      jump_addr_reg <= io_exe_jump_addr;
    end
  end
endmodule
module mem_stage(
  input  [63:0] io_mem_pc_i,
  input  [7:0]  io_mem_aluop_i,
  input  [4:0]  io_mem_wa_i,
  input         io_mem_wreg_i,
  input  [63:0] io_mem_wd_i,
  input         io_mem_mreg_i,
  input  [63:0] io_mem_din_i,
  input         io_csr_we_i,
  input  [11:0] io_csr_wa_i,
  input  [63:0] io_csr_wd_i,
  input  [4:0]  io_mem_exccode_i,
  input  [63:0] io_jump_addr_i,
  output [4:0]  io_mem_wa_o,
  output        io_mem_wreg_o,
  output [63:0] io_mem_dreg_o,
  output        io_mem_mreg_o,
  output [7:0]  io_dre,
  output        io_load_unsign,
  output        io_csr_we_o,
  output [11:0] io_csr_wa_o,
  output [63:0] io_csr_wd_o,
  output [63:0] io_mem_dm,
  output        io_mem_big_endian,
  output        io_data_req,
  output [63:0] io_daddr,
  output        io_data_we,
  output [7:0]  io_dwstrb,
  output [63:0] io_din,
  input  [63:0] io_data_rdata,
  input         io_data_data_ok,
  output [4:0]  io_exccode_o,
  output [63:0] io_pc_o,
  output [63:0] io_jump_addr_o,
  output        io_stallreq_mem,
  input  [63:0] io_data_plic,
  output        io_dce
);
  wire  _T = io_mem_aluop_i == 8'h1f; // @[mem_stage.scala 62:37]
  wire  _T_1 = io_mem_aluop_i == 8'h20; // @[mem_stage.scala 62:70]
  wire  _T_2 = _T | _T_1; // @[mem_stage.scala 62:52]
  wire  _T_3 = io_mem_aluop_i == 8'h21; // @[mem_stage.scala 63:37]
  wire  _T_4 = _T_2 | _T_3; // @[mem_stage.scala 62:85]
  wire  _T_5 = io_mem_aluop_i == 8'h22; // @[mem_stage.scala 63:70]
  wire  _T_6 = _T_4 | _T_5; // @[mem_stage.scala 63:52]
  wire  _T_7 = io_mem_aluop_i == 8'h23; // @[mem_stage.scala 64:37]
  wire  _T_8 = _T_6 | _T_7; // @[mem_stage.scala 63:85]
  wire  _T_9 = io_mem_aluop_i == 8'h24; // @[mem_stage.scala 64:70]
  wire  btype_inst = _T_8 | _T_9; // @[mem_stage.scala 64:52]
  wire  _T_10 = io_mem_aluop_i == 8'h1e; // @[mem_stage.scala 65:41]
  wire  _T_11 = io_mem_aluop_i == 8'h25; // @[mem_stage.scala 65:74]
  wire  jtype_inst = _T_10 | _T_11; // @[mem_stage.scala 65:56]
  wire  _T_13 = io_daddr != 64'h2000000; // @[mem_stage.scala 70:33]
  wire  _T_14 = io_dce & _T_13; // @[mem_stage.scala 69:39]
  wire  _T_15 = io_daddr != 64'h2004000; // @[mem_stage.scala 70:59]
  wire  _T_16 = _T_14 & _T_15; // @[mem_stage.scala 70:47]
  wire  _T_17 = io_daddr != 64'h200bff8; // @[mem_stage.scala 70:89]
  wire  _T_18 = _T_16 & _T_17; // @[mem_stage.scala 70:77]
  wire  _T_19 = io_daddr != 64'hc200004; // @[mem_stage.scala 71:29]
  wire  ready_go = io_data_req & io_data_data_ok; // @[mem_stage.scala 72:44]
  wire  _T_24 = ~ready_go; // @[mem_stage.scala 73:60]
  wire  _T_28 = io_daddr == 64'hc200004; // @[mem_stage.scala 76:62]
  wire  _T_29 = io_dce & _T_28; // @[mem_stage.scala 76:50]
  wire [63:0] _T_30 = _T_29 ? io_data_plic : 64'h0; // @[Mux.scala 98:16]
  wire  _T_35 = btype_inst | io_dce; // @[mem_stage.scala 89:50]
  wire  inst_lb = io_mem_aluop_i == 8'h14; // @[mem_stage.scala 95:39]
  wire  inst_lh = io_mem_aluop_i == 8'h15; // @[mem_stage.scala 96:39]
  wire  inst_lw = io_mem_aluop_i == 8'h16; // @[mem_stage.scala 97:39]
  wire  inst_lbu = io_mem_aluop_i == 8'h17; // @[mem_stage.scala 98:39]
  wire  inst_lhu = io_mem_aluop_i == 8'h18; // @[mem_stage.scala 99:39]
  wire  inst_lwu = io_mem_aluop_i == 8'h37; // @[mem_stage.scala 100:39]
  wire  inst_ld = io_mem_aluop_i == 8'h38; // @[mem_stage.scala 101:39]
  wire  inst_sb = io_mem_aluop_i == 8'h19; // @[mem_stage.scala 102:39]
  wire  inst_sh = io_mem_aluop_i == 8'h1a; // @[mem_stage.scala 103:39]
  wire  inst_sw = io_mem_aluop_i == 8'h1b; // @[mem_stage.scala 104:39]
  wire  inst_sd = io_mem_aluop_i == 8'h39; // @[mem_stage.scala 105:39]
  wire  _T_40 = inst_lh | inst_lhu; // @[mem_stage.scala 109:76]
  wire  _T_43 = _T_40 & io_mem_wd_i[0]; // @[mem_stage.scala 109:95]
  wire  _T_45 = inst_lw | inst_lwu; // @[mem_stage.scala 110:76]
  wire  _T_47 = io_mem_wd_i[1:0] != 2'h0; // @[mem_stage.scala 110:115]
  wire  _T_48 = _T_45 & _T_47; // @[mem_stage.scala 110:95]
  wire  _T_51 = io_mem_wd_i[2:0] != 3'h0; // @[mem_stage.scala 111:104]
  wire  _T_52 = inst_ld & _T_51; // @[mem_stage.scala 111:84]
  wire  _T_56 = inst_sh & io_mem_wd_i[0]; // @[mem_stage.scala 112:84]
  wire  _T_60 = inst_sw & _T_47; // @[mem_stage.scala 113:84]
  wire  _T_63 = io_mem_wa_i[2:0] != 3'h0; // @[mem_stage.scala 114:104]
  wire  _T_64 = inst_sd & _T_63; // @[mem_stage.scala 114:84]
  wire [2:0] _T_65 = _T_64 ? 3'h6 : 3'h0; // @[Mux.scala 98:16]
  wire [2:0] _T_66 = _T_60 ? 3'h6 : _T_65; // @[Mux.scala 98:16]
  wire [2:0] _T_67 = _T_56 ? 3'h6 : _T_66; // @[Mux.scala 98:16]
  wire [2:0] _T_68 = _T_52 ? 3'h4 : _T_67; // @[Mux.scala 98:16]
  wire [2:0] _T_69 = _T_48 ? 3'h4 : _T_68; // @[Mux.scala 98:16]
  wire [2:0] address_misaligned = _T_43 ? 3'h4 : _T_69; // @[Mux.scala 98:16]
  wire  _T_70 = address_misaligned == 3'h0; // @[mem_stage.scala 117:40]
  wire  _T_72 = inst_lb | inst_lh; // @[mem_stage.scala 120:29]
  wire  _T_73 = _T_72 | inst_lw; // @[mem_stage.scala 120:41]
  wire  _T_74 = _T_73 | inst_lbu; // @[mem_stage.scala 120:53]
  wire  _T_75 = _T_74 | inst_lhu; // @[mem_stage.scala 121:29]
  wire  _T_76 = _T_75 | inst_lwu; // @[mem_stage.scala 121:41]
  wire  _T_77 = _T_76 | inst_ld; // @[mem_stage.scala 121:53]
  wire  _T_78 = _T_77 | inst_sb; // @[mem_stage.scala 121:63]
  wire  _T_79 = _T_78 | inst_sh; // @[mem_stage.scala 122:29]
  wire  _T_80 = _T_79 | inst_sw; // @[mem_stage.scala 122:41]
  wire  _T_81 = _T_80 | inst_sd; // @[mem_stage.scala 122:53]
  wire  _T_86 = io_daddr[63:12] == 52'h8000000010012; // @[mem_stage.scala 125:59]
  wire  gpio_addr_en = io_dce & _T_86; // @[mem_stage.scala 125:40]
  wire  _T_89 = io_daddr[63:12] == 52'h8000000010013; // @[mem_stage.scala 126:59]
  wire  uart_addr_en = io_dce & _T_89; // @[mem_stage.scala 126:40]
  wire  _T_94 = gpio_addr_en | uart_addr_en; // @[mem_stage.scala 128:51]
  wire  _T_96 = _T_94 | _T_29; // @[mem_stage.scala 128:75]
  wire  _T_97 = inst_lb | inst_lbu; // @[mem_stage.scala 132:34]
  wire  _T_99 = io_daddr[2:0] == 3'h0; // @[mem_stage.scala 132:63]
  wire  _T_100 = _T_97 & _T_99; // @[mem_stage.scala 132:46]
  wire  _T_104 = _T_40 & _T_99; // @[mem_stage.scala 132:102]
  wire  _T_105 = _T_100 | _T_104; // @[mem_stage.scala 132:78]
  wire  _T_109 = _T_45 & _T_99; // @[mem_stage.scala 133:58]
  wire  _T_110 = _T_105 | _T_109; // @[mem_stage.scala 132:134]
  wire  dre_temp_7 = _T_110 | inst_ld; // @[mem_stage.scala 133:90]
  wire  _T_114 = io_daddr[2:0] == 3'h1; // @[mem_stage.scala 134:59]
  wire  _T_115 = _T_97 & _T_114; // @[mem_stage.scala 134:42]
  wire  _T_120 = _T_115 | _T_104; // @[mem_stage.scala 134:74]
  wire  _T_125 = _T_120 | _T_109; // @[mem_stage.scala 134:130]
  wire  dre_temp_6 = _T_125 | inst_ld; // @[mem_stage.scala 135:78]
  wire  _T_129 = io_daddr[2:0] == 3'h2; // @[mem_stage.scala 136:63]
  wire  _T_130 = _T_97 & _T_129; // @[mem_stage.scala 136:46]
  wire  _T_134 = _T_40 & _T_129; // @[mem_stage.scala 136:102]
  wire  _T_135 = _T_130 | _T_134; // @[mem_stage.scala 136:78]
  wire  _T_140 = _T_135 | _T_109; // @[mem_stage.scala 136:134]
  wire  dre_temp_5 = _T_140 | inst_ld; // @[mem_stage.scala 137:78]
  wire  _T_144 = io_daddr[2:0] == 3'h3; // @[mem_stage.scala 138:63]
  wire  _T_145 = _T_97 & _T_144; // @[mem_stage.scala 138:46]
  wire  _T_150 = _T_145 | _T_134; // @[mem_stage.scala 138:78]
  wire  _T_155 = _T_150 | _T_109; // @[mem_stage.scala 138:134]
  wire  dre_temp_4 = _T_155 | inst_ld; // @[mem_stage.scala 139:78]
  wire  _T_159 = io_daddr[2:0] == 3'h4; // @[mem_stage.scala 140:63]
  wire  _T_160 = _T_97 & _T_159; // @[mem_stage.scala 140:46]
  wire  _T_164 = _T_40 & _T_159; // @[mem_stage.scala 140:102]
  wire  _T_165 = _T_160 | _T_164; // @[mem_stage.scala 140:78]
  wire  _T_169 = _T_45 & _T_159; // @[mem_stage.scala 141:58]
  wire  _T_170 = _T_165 | _T_169; // @[mem_stage.scala 140:134]
  wire  dre_temp_3 = _T_170 | inst_ld; // @[mem_stage.scala 141:90]
  wire  _T_174 = io_daddr[2:0] == 3'h5; // @[mem_stage.scala 142:59]
  wire  _T_175 = _T_97 & _T_174; // @[mem_stage.scala 142:42]
  wire  _T_180 = _T_175 | _T_164; // @[mem_stage.scala 142:74]
  wire  _T_185 = _T_180 | _T_169; // @[mem_stage.scala 142:130]
  wire  dre_temp_2 = _T_185 | inst_ld; // @[mem_stage.scala 143:78]
  wire  _T_189 = io_daddr[2:0] == 3'h6; // @[mem_stage.scala 144:63]
  wire  _T_190 = _T_97 & _T_189; // @[mem_stage.scala 144:46]
  wire  _T_194 = _T_40 & _T_189; // @[mem_stage.scala 144:102]
  wire  _T_195 = _T_190 | _T_194; // @[mem_stage.scala 144:78]
  wire  _T_200 = _T_195 | _T_169; // @[mem_stage.scala 144:134]
  wire  dre_temp_1 = _T_200 | inst_ld; // @[mem_stage.scala 145:78]
  wire  _T_204 = io_daddr[2:0] == 3'h7; // @[mem_stage.scala 146:63]
  wire  _T_205 = _T_97 & _T_204; // @[mem_stage.scala 146:46]
  wire  _T_210 = _T_205 | _T_194; // @[mem_stage.scala 146:78]
  wire  _T_215 = _T_210 | _T_169; // @[mem_stage.scala 146:134]
  wire  dre_temp_0 = _T_215 | inst_ld; // @[mem_stage.scala 147:78]
  wire [3:0] _T_219 = {dre_temp_3,dre_temp_2,dre_temp_1,dre_temp_0}; // @[mem_stage.scala 148:28]
  wire [3:0] _T_222 = {dre_temp_7,dre_temp_6,dre_temp_5,dre_temp_4}; // @[mem_stage.scala 148:28]
  wire  _T_224 = inst_lbu | inst_lhu; // @[mem_stage.scala 151:36]
  wire  _T_228 = inst_sb & _T_99; // @[mem_stage.scala 155:36]
  wire  _T_231 = inst_sh & _T_99; // @[mem_stage.scala 155:79]
  wire  _T_232 = _T_228 | _T_231; // @[mem_stage.scala 155:68]
  wire  _T_235 = inst_sw & _T_99; // @[mem_stage.scala 156:45]
  wire  _T_236 = _T_232 | _T_235; // @[mem_stage.scala 155:111]
  wire  dwstrb_temp_7 = _T_236 | inst_sd; // @[mem_stage.scala 156:77]
  wire  _T_240 = inst_sb & _T_114; // @[mem_stage.scala 157:32]
  wire  _T_244 = _T_240 | _T_231; // @[mem_stage.scala 157:64]
  wire  _T_248 = _T_244 | _T_235; // @[mem_stage.scala 157:107]
  wire  dwstrb_temp_6 = _T_248 | inst_sd; // @[mem_stage.scala 158:65]
  wire  _T_252 = inst_sb & _T_129; // @[mem_stage.scala 159:36]
  wire  _T_255 = inst_sh & _T_129; // @[mem_stage.scala 159:79]
  wire  _T_256 = _T_252 | _T_255; // @[mem_stage.scala 159:68]
  wire  _T_260 = _T_256 | _T_235; // @[mem_stage.scala 159:111]
  wire  dwstrb_temp_5 = _T_260 | inst_sd; // @[mem_stage.scala 160:65]
  wire  _T_264 = inst_sb & _T_144; // @[mem_stage.scala 161:36]
  wire  _T_268 = _T_264 | _T_255; // @[mem_stage.scala 161:68]
  wire  _T_272 = _T_268 | _T_235; // @[mem_stage.scala 161:111]
  wire  dwstrb_temp_4 = _T_272 | inst_sd; // @[mem_stage.scala 162:65]
  wire  _T_276 = inst_sb & _T_159; // @[mem_stage.scala 163:36]
  wire  _T_279 = inst_sh & _T_159; // @[mem_stage.scala 163:79]
  wire  _T_280 = _T_276 | _T_279; // @[mem_stage.scala 163:68]
  wire  _T_283 = inst_sw & _T_159; // @[mem_stage.scala 164:45]
  wire  _T_284 = _T_280 | _T_283; // @[mem_stage.scala 163:111]
  wire  dwstrb_temp_3 = _T_284 | inst_sd; // @[mem_stage.scala 164:77]
  wire  _T_288 = inst_sb & _T_174; // @[mem_stage.scala 165:32]
  wire  _T_292 = _T_288 | _T_279; // @[mem_stage.scala 165:64]
  wire  _T_296 = _T_292 | _T_283; // @[mem_stage.scala 165:107]
  wire  dwstrb_temp_2 = _T_296 | inst_sd; // @[mem_stage.scala 166:65]
  wire  _T_300 = inst_sb & _T_189; // @[mem_stage.scala 167:36]
  wire  _T_303 = inst_sh & _T_189; // @[mem_stage.scala 167:79]
  wire  _T_304 = _T_300 | _T_303; // @[mem_stage.scala 167:68]
  wire  _T_308 = _T_304 | _T_283; // @[mem_stage.scala 167:111]
  wire  dwstrb_temp_1 = _T_308 | inst_sd; // @[mem_stage.scala 168:65]
  wire  _T_312 = inst_sb & _T_204; // @[mem_stage.scala 169:36]
  wire  _T_316 = _T_312 | _T_303; // @[mem_stage.scala 169:68]
  wire  _T_320 = _T_316 | _T_283; // @[mem_stage.scala 169:111]
  wire  dwstrb_temp_0 = _T_320 | inst_sd; // @[mem_stage.scala 170:65]
  wire [7:0] _T_329 = {dwstrb_temp_7,dwstrb_temp_6,dwstrb_temp_5,dwstrb_temp_4,dwstrb_temp_3,dwstrb_temp_2,dwstrb_temp_1,dwstrb_temp_0}; // @[mem_stage.scala 171:66]
  wire [63:0] din_sb = {io_mem_din_i[7:0],io_mem_din_i[7:0],io_mem_din_i[7:0],io_mem_din_i[7:0],io_mem_din_i[7:0],io_mem_din_i[7:0],io_mem_din_i[7:0],io_mem_din_i[7:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_356 = {io_mem_din_i[15:0],io_mem_din_i[15:0],io_mem_din_i[15:0],io_mem_din_i[15:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_371 = {io_mem_din_i[7:0],io_mem_din_i[15:8],io_mem_din_i[7:0],io_mem_din_i[15:8],io_mem_din_i[7:0],io_mem_din_i[15:8],io_mem_din_i[7:0],io_mem_din_i[15:8]}; // @[Cat.scala 30:58]
  wire [63:0] din_sh = _T_96 ? _T_356 : _T_371; // @[mem_stage.scala 176:25]
  wire [63:0] _T_379 = {io_mem_din_i[31:0],io_mem_din_i[31:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_394 = {io_mem_din_i[7:0],io_mem_din_i[15:8],io_mem_din_i[23:16],io_mem_din_i[31:24],io_mem_din_i[7:0],io_mem_din_i[15:8],io_mem_din_i[23:16],io_mem_din_i[31:24]}; // @[Cat.scala 30:58]
  wire [63:0] din_sw = _T_96 ? _T_379 : _T_394; // @[mem_stage.scala 180:25]
  wire [63:0] _T_414 = {io_mem_din_i[7:0],io_mem_din_i[15:8],io_mem_din_i[23:16],io_mem_din_i[31:24],io_mem_din_i[39:32],io_mem_din_i[47:40],io_mem_din_i[55:48],io_mem_din_i[63:56]}; // @[Cat.scala 30:58]
  wire [63:0] din_sd = _T_96 ? io_mem_din_i : _T_414; // @[mem_stage.scala 184:25]
  wire  _T_415 = io_dwstrb == 8'h80; // @[mem_stage.scala 190:28]
  wire  _T_416 = io_dwstrb == 8'h40; // @[mem_stage.scala 191:28]
  wire  _T_417 = io_dwstrb == 8'h20; // @[mem_stage.scala 192:28]
  wire  _T_418 = io_dwstrb == 8'h10; // @[mem_stage.scala 193:28]
  wire  _T_419 = io_dwstrb == 8'h8; // @[mem_stage.scala 194:28]
  wire  _T_420 = io_dwstrb == 8'h4; // @[mem_stage.scala 195:28]
  wire  _T_421 = io_dwstrb == 8'h2; // @[mem_stage.scala 196:28]
  wire  _T_422 = io_dwstrb == 8'h1; // @[mem_stage.scala 197:28]
  wire  _T_423 = io_dwstrb == 8'hc0; // @[mem_stage.scala 198:28]
  wire  _T_424 = io_dwstrb == 8'h30; // @[mem_stage.scala 199:28]
  wire  _T_425 = io_dwstrb == 8'hc; // @[mem_stage.scala 200:28]
  wire  _T_426 = io_dwstrb == 8'h3; // @[mem_stage.scala 201:28]
  wire  _T_427 = io_dwstrb == 8'hf0; // @[mem_stage.scala 202:24]
  wire  _T_428 = io_dwstrb == 8'hf; // @[mem_stage.scala 203:28]
  wire  _T_429 = io_dwstrb == 8'hff; // @[mem_stage.scala 204:28]
  wire [63:0] _T_430 = _T_429 ? din_sd : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_431 = _T_428 ? din_sw : _T_430; // @[Mux.scala 98:16]
  wire [63:0] _T_432 = _T_427 ? din_sw : _T_431; // @[Mux.scala 98:16]
  wire [63:0] _T_433 = _T_426 ? din_sh : _T_432; // @[Mux.scala 98:16]
  wire [63:0] _T_434 = _T_425 ? din_sh : _T_433; // @[Mux.scala 98:16]
  wire [63:0] _T_435 = _T_424 ? din_sh : _T_434; // @[Mux.scala 98:16]
  wire [63:0] _T_436 = _T_423 ? din_sh : _T_435; // @[Mux.scala 98:16]
  wire [63:0] _T_437 = _T_422 ? din_sb : _T_436; // @[Mux.scala 98:16]
  wire [63:0] _T_438 = _T_421 ? din_sb : _T_437; // @[Mux.scala 98:16]
  wire [63:0] _T_439 = _T_420 ? din_sb : _T_438; // @[Mux.scala 98:16]
  wire [63:0] _T_440 = _T_419 ? din_sb : _T_439; // @[Mux.scala 98:16]
  wire [63:0] _T_441 = _T_418 ? din_sb : _T_440; // @[Mux.scala 98:16]
  wire [63:0] _T_442 = _T_417 ? din_sb : _T_441; // @[Mux.scala 98:16]
  wire [63:0] _T_443 = _T_416 ? din_sb : _T_442; // @[Mux.scala 98:16]
  wire  _T_445 = address_misaligned == 3'h4; // @[mem_stage.scala 208:77]
  wire  _T_446 = address_misaligned == 3'h6; // @[mem_stage.scala 209:77]
  wire [4:0] _T_447 = _T_446 ? 5'h6 : io_mem_exccode_i; // @[Mux.scala 98:16]
  assign io_mem_wa_o = io_mem_wa_i; // @[mem_stage.scala 82:20]
  assign io_mem_wreg_o = io_mem_wreg_i; // @[mem_stage.scala 83:24]
  assign io_mem_dreg_o = io_mem_wd_i; // @[mem_stage.scala 84:24]
  assign io_mem_mreg_o = io_mem_mreg_i; // @[mem_stage.scala 85:24]
  assign io_dre = {_T_222,_T_219}; // @[mem_stage.scala 148:16]
  assign io_load_unsign = _T_224 | inst_lwu; // @[mem_stage.scala 151:24]
  assign io_csr_we_o = io_csr_we_i; // @[mem_stage.scala 86:24]
  assign io_csr_wa_o = io_csr_wa_i; // @[mem_stage.scala 87:24]
  assign io_csr_wd_o = io_csr_wd_i; // @[mem_stage.scala 88:24]
  assign io_mem_dm = ready_go ? io_data_rdata : _T_30; // @[mem_stage.scala 74:15]
  assign io_mem_big_endian = _T_94 | _T_29; // @[mem_stage.scala 128:27]
  assign io_data_req = _T_18 & _T_19; // @[mem_stage.scala 69:21]
  assign io_daddr = _T_70 ? io_mem_wd_i : 64'h0; // @[mem_stage.scala 117:14]
  assign io_data_we = io_dwstrb != 8'h0; // @[mem_stage.scala 78:16]
  assign io_dwstrb = _T_70 ? _T_329 : 8'h0; // @[mem_stage.scala 171:19]
  assign io_din = _T_415 ? din_sb : _T_443; // @[mem_stage.scala 189:16]
  assign io_exccode_o = _T_445 ? 5'h4 : _T_447; // @[mem_stage.scala 207:22]
  assign io_pc_o = _T_35 ? 64'h0 : io_mem_pc_i; // @[mem_stage.scala 89:24]
  assign io_jump_addr_o = jtype_inst ? io_jump_addr_i : 64'h0; // @[mem_stage.scala 90:25]
  assign io_stallreq_mem = io_data_req & _T_24; // @[mem_stage.scala 73:25]
  assign io_dce = _T_81 & _T_70; // @[mem_stage.scala 120:16]
endmodule
module memwb_reg(
  input         clock,
  input         reset,
  input  [4:0]  io_mem_wa,
  input         io_mem_wreg,
  input  [63:0] io_mem_dreg,
  input         io_mem_mreg,
  input  [7:0]  io_mem_dre,
  input         io_mem_load_unsign,
  input         io_mem_csr_we,
  input  [11:0] io_mem_csr_wa,
  input  [63:0] io_mem_csr_wd,
  input  [63:0] io_mem_dm,
  input         io_mem_big_endian,
  input         io_flush,
  input  [4:0]  io_stall,
  output [4:0]  io_wb_wa,
  output        io_wb_wreg,
  output [63:0] io_wb_dreg,
  output        io_wb_mreg,
  output [7:0]  io_wb_dre,
  output        io_wb_load_unsign,
  output        io_wb_csr_we,
  output [11:0] io_wb_csr_wa,
  output [63:0] io_wb_csr_wd,
  output [63:0] io_wb_dm,
  output        io_wb_big_endian
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] wa_reg; // @[memwb_reg.scala 44:37]
  reg  wreg_reg; // @[memwb_reg.scala 45:37]
  reg [63:0] dreg_reg; // @[memwb_reg.scala 46:37]
  reg  mreg_reg; // @[memwb_reg.scala 47:37]
  reg [7:0] dre_reg; // @[memwb_reg.scala 48:33]
  reg  unsign_reg; // @[memwb_reg.scala 49:33]
  reg  csr_we_reg; // @[memwb_reg.scala 50:37]
  reg [11:0] csr_wa_reg; // @[memwb_reg.scala 51:37]
  reg [63:0] csr_wd_reg; // @[memwb_reg.scala 52:37]
  reg [63:0] data_reg; // @[memwb_reg.scala 53:37]
  reg  big_endian_reg; // @[memwb_reg.scala 54:33]
  wire  _T_2 = ~io_stall[4]; // @[memwb_reg.scala 68:32]
  assign io_wb_wa = wa_reg; // @[memwb_reg.scala 94:23]
  assign io_wb_wreg = wreg_reg; // @[memwb_reg.scala 95:23]
  assign io_wb_dreg = dreg_reg; // @[memwb_reg.scala 96:23]
  assign io_wb_mreg = mreg_reg; // @[memwb_reg.scala 97:23]
  assign io_wb_dre = dre_reg; // @[memwb_reg.scala 98:23]
  assign io_wb_load_unsign = unsign_reg; // @[memwb_reg.scala 99:23]
  assign io_wb_csr_we = csr_we_reg; // @[memwb_reg.scala 100:27]
  assign io_wb_csr_wa = csr_wa_reg; // @[memwb_reg.scala 101:27]
  assign io_wb_csr_wd = csr_wd_reg; // @[memwb_reg.scala 102:27]
  assign io_wb_dm = data_reg; // @[memwb_reg.scala 103:27]
  assign io_wb_big_endian = big_endian_reg; // @[memwb_reg.scala 104:27]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  wa_reg = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  wreg_reg = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  dreg_reg = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  mreg_reg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  dre_reg = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  unsign_reg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  csr_we_reg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  csr_wa_reg = _RAND_7[11:0];
  _RAND_8 = {2{`RANDOM}};
  csr_wd_reg = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  data_reg = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  big_endian_reg = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      wa_reg <= 5'h0;
    end else if (io_flush) begin
      wa_reg <= 5'h0;
    end else if (_T_2) begin
      wa_reg <= io_mem_wa;
    end
    if (reset) begin
      wreg_reg <= 1'h0;
    end else if (io_flush) begin
      wreg_reg <= 1'h0;
    end else if (_T_2) begin
      wreg_reg <= io_mem_wreg;
    end
    if (reset) begin
      dreg_reg <= 64'h0;
    end else if (io_flush) begin
      dreg_reg <= 64'h0;
    end else if (_T_2) begin
      dreg_reg <= io_mem_dreg;
    end
    if (reset) begin
      mreg_reg <= 1'h0;
    end else if (io_flush) begin
      mreg_reg <= 1'h0;
    end else if (_T_2) begin
      mreg_reg <= io_mem_mreg;
    end
    if (reset) begin
      dre_reg <= 8'h0;
    end else if (io_flush) begin
      dre_reg <= 8'h0;
    end else if (_T_2) begin
      dre_reg <= io_mem_dre;
    end
    if (reset) begin
      unsign_reg <= 1'h0;
    end else if (io_flush) begin
      unsign_reg <= 1'h0;
    end else if (_T_2) begin
      unsign_reg <= io_mem_load_unsign;
    end
    if (reset) begin
      csr_we_reg <= 1'h0;
    end else if (io_flush) begin
      csr_we_reg <= 1'h0;
    end else if (_T_2) begin
      csr_we_reg <= io_mem_csr_we;
    end
    if (reset) begin
      csr_wa_reg <= 12'h0;
    end else if (io_flush) begin
      csr_wa_reg <= 12'h0;
    end else if (_T_2) begin
      csr_wa_reg <= io_mem_csr_wa;
    end
    if (reset) begin
      csr_wd_reg <= 64'h0;
    end else if (io_flush) begin
      csr_wd_reg <= 64'h0;
    end else if (_T_2) begin
      csr_wd_reg <= io_mem_csr_wd;
    end
    if (reset) begin
      data_reg <= 64'h0;
    end else if (io_flush) begin
      data_reg <= 64'h0;
    end else if (_T_2) begin
      data_reg <= io_mem_dm;
    end
    if (reset) begin
      big_endian_reg <= 1'h0;
    end else if (io_flush) begin
      big_endian_reg <= 1'h0;
    end else if (_T_2) begin
      big_endian_reg <= io_mem_big_endian;
    end
  end
endmodule
module wb_stage(
  input  [4:0]  io_wb_wa_i,
  input         io_wb_wreg_i,
  input  [63:0] io_wb_dreg_i,
  input         io_wb_mreg_i,
  input  [7:0]  io_wb_dre_i,
  input         io_wb_load_unsign,
  input         io_csr_we_i,
  input  [11:0] io_csr_wa_i,
  input  [63:0] io_csr_wd_i,
  input         io_wb_big_endian,
  input  [63:0] io_dm,
  output [4:0]  io_wb_wa_o,
  output        io_wb_wreg_o,
  output [63:0] io_wb_wd_o,
  output        io_csr_we_o,
  output [11:0] io_csr_wa_o,
  output [63:0] io_csr_wd_o
);
  wire  _T_2 = io_wb_dre_i != 8'h0; // @[wb_stage.scala 53:34]
  wire  _T_4 = _T_2 & io_wb_big_endian; // @[wb_stage.scala 53:42]
  wire  _T_6 = io_wb_dre_i == 8'h80; // @[wb_stage.scala 55:34]
  wire  _T_8 = io_wb_dre_i == 8'h40; // @[wb_stage.scala 56:38]
  wire  _T_10 = io_wb_dre_i == 8'h20; // @[wb_stage.scala 57:38]
  wire  _T_12 = io_wb_dre_i == 8'h10; // @[wb_stage.scala 58:38]
  wire  _T_14 = io_wb_dre_i == 8'h8; // @[wb_stage.scala 59:38]
  wire  _T_16 = io_wb_dre_i == 8'h4; // @[wb_stage.scala 60:38]
  wire  _T_18 = io_wb_dre_i == 8'h2; // @[wb_stage.scala 61:38]
  wire  _T_20 = io_wb_dre_i == 8'h1; // @[wb_stage.scala 62:38]
  wire  _T_22 = io_wb_dre_i == 8'hc0; // @[wb_stage.scala 64:38]
  wire [15:0] _T_25 = {io_dm[55:48],io_dm[63:56]}; // @[Cat.scala 30:58]
  wire  _T_26 = io_wb_dre_i == 8'h30; // @[wb_stage.scala 65:38]
  wire [15:0] _T_29 = {io_dm[39:32],io_dm[47:40]}; // @[Cat.scala 30:58]
  wire  _T_30 = io_wb_dre_i == 8'hc; // @[wb_stage.scala 66:38]
  wire [15:0] _T_33 = {io_dm[23:16],io_dm[31:24]}; // @[Cat.scala 30:58]
  wire  _T_34 = io_wb_dre_i == 8'h3; // @[wb_stage.scala 67:38]
  wire [15:0] _T_37 = {io_dm[7:0],io_dm[15:8]}; // @[Cat.scala 30:58]
  wire  _T_38 = io_wb_dre_i == 8'hf0; // @[wb_stage.scala 69:38]
  wire [31:0] _T_45 = {io_dm[39:32],io_dm[47:40],io_dm[55:48],io_dm[63:56]}; // @[Cat.scala 30:58]
  wire  _T_46 = io_wb_dre_i == 8'hf; // @[wb_stage.scala 70:38]
  wire [31:0] _T_53 = {io_dm[7:0],io_dm[15:8],io_dm[23:16],io_dm[31:24]}; // @[Cat.scala 30:58]
  wire [31:0] _T_54 = _T_46 ? _T_53 : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _T_55 = _T_38 ? _T_45 : _T_54; // @[Mux.scala 98:16]
  wire [31:0] _T_56 = _T_34 ? {{16'd0}, _T_37} : _T_55; // @[Mux.scala 98:16]
  wire [31:0] _T_57 = _T_30 ? {{16'd0}, _T_33} : _T_56; // @[Mux.scala 98:16]
  wire [31:0] _T_58 = _T_26 ? {{16'd0}, _T_29} : _T_57; // @[Mux.scala 98:16]
  wire [31:0] _T_59 = _T_22 ? {{16'd0}, _T_25} : _T_58; // @[Mux.scala 98:16]
  wire [31:0] _T_60 = _T_20 ? {{24'd0}, io_dm[7:0]} : _T_59; // @[Mux.scala 98:16]
  wire [31:0] _T_61 = _T_18 ? {{24'd0}, io_dm[15:8]} : _T_60; // @[Mux.scala 98:16]
  wire [31:0] _T_62 = _T_16 ? {{24'd0}, io_dm[23:16]} : _T_61; // @[Mux.scala 98:16]
  wire [31:0] _T_63 = _T_14 ? {{24'd0}, io_dm[31:24]} : _T_62; // @[Mux.scala 98:16]
  wire [31:0] _T_64 = _T_12 ? {{24'd0}, io_dm[39:32]} : _T_63; // @[Mux.scala 98:16]
  wire [31:0] _T_65 = _T_10 ? {{24'd0}, io_dm[47:40]} : _T_64; // @[Mux.scala 98:16]
  wire [31:0] _T_66 = _T_8 ? {{24'd0}, io_dm[55:48]} : _T_65; // @[Mux.scala 98:16]
  wire [31:0] _T_67 = _T_6 ? {{24'd0}, io_dm[63:56]} : _T_66; // @[Mux.scala 98:16]
  wire [31:0] _T_68 = _T_4 ? {{24'd0}, io_dm[7:0]} : _T_67; // @[Mux.scala 98:16]
  wire [7:0] _T_74 = io_dm[7:0]; // @[wb_stage.scala 77:83]
  wire [7:0] _T_77 = io_dm[63:56]; // @[wb_stage.scala 79:79]
  wire [7:0] _T_80 = io_dm[55:48]; // @[wb_stage.scala 80:79]
  wire [7:0] _T_83 = io_dm[47:40]; // @[wb_stage.scala 81:79]
  wire [7:0] _T_86 = io_dm[39:32]; // @[wb_stage.scala 82:79]
  wire [7:0] _T_89 = io_dm[31:24]; // @[wb_stage.scala 83:79]
  wire [7:0] _T_92 = io_dm[23:16]; // @[wb_stage.scala 84:79]
  wire [7:0] _T_95 = io_dm[15:8]; // @[wb_stage.scala 85:79]
  wire [15:0] _T_103 = {io_dm[55:48],io_dm[63:56]}; // @[wb_stage.scala 88:97]
  wire [15:0] _T_108 = {io_dm[39:32],io_dm[47:40]}; // @[wb_stage.scala 89:97]
  wire [15:0] _T_113 = {io_dm[23:16],io_dm[31:24]}; // @[wb_stage.scala 90:97]
  wire [15:0] _T_118 = {io_dm[7:0],io_dm[15:8]}; // @[wb_stage.scala 91:94]
  wire [31:0] _T_127 = {io_dm[39:32],io_dm[47:40],io_dm[55:48],io_dm[63:56]}; // @[wb_stage.scala 93:123]
  wire [31:0] _T_136 = {io_dm[7:0],io_dm[15:8],io_dm[23:16],io_dm[31:24]}; // @[wb_stage.scala 94:120]
  wire  _T_137 = io_wb_dre_i == 8'hff; // @[wb_stage.scala 96:38]
  wire [63:0] _T_153 = {io_dm[7:0],io_dm[15:8],io_dm[23:16],io_dm[31:24],io_dm[39:32],io_dm[47:40],io_dm[55:48],io_dm[63:56]}; // @[wb_stage.scala 97:123]
  wire [63:0] _T_154 = _T_137 ? $signed(_T_153) : $signed(64'sh0); // @[Mux.scala 98:16]
  wire [63:0] _T_155 = _T_46 ? $signed({{32{_T_136[31]}},_T_136}) : $signed(_T_154); // @[Mux.scala 98:16]
  wire [63:0] _T_156 = _T_38 ? $signed({{32{_T_127[31]}},_T_127}) : $signed(_T_155); // @[Mux.scala 98:16]
  wire [63:0] _T_157 = _T_34 ? $signed({{48{_T_118[15]}},_T_118}) : $signed(_T_156); // @[Mux.scala 98:16]
  wire [63:0] _T_158 = _T_30 ? $signed({{48{_T_113[15]}},_T_113}) : $signed(_T_157); // @[Mux.scala 98:16]
  wire [63:0] _T_159 = _T_26 ? $signed({{48{_T_108[15]}},_T_108}) : $signed(_T_158); // @[Mux.scala 98:16]
  wire [63:0] _T_160 = _T_22 ? $signed({{48{_T_103[15]}},_T_103}) : $signed(_T_159); // @[Mux.scala 98:16]
  wire [63:0] _T_161 = _T_20 ? $signed({{56{_T_74[7]}},_T_74}) : $signed(_T_160); // @[Mux.scala 98:16]
  wire [63:0] _T_162 = _T_18 ? $signed({{56{_T_95[7]}},_T_95}) : $signed(_T_161); // @[Mux.scala 98:16]
  wire [63:0] _T_163 = _T_16 ? $signed({{56{_T_92[7]}},_T_92}) : $signed(_T_162); // @[Mux.scala 98:16]
  wire [63:0] _T_164 = _T_14 ? $signed({{56{_T_89[7]}},_T_89}) : $signed(_T_163); // @[Mux.scala 98:16]
  wire [63:0] _T_165 = _T_12 ? $signed({{56{_T_86[7]}},_T_86}) : $signed(_T_164); // @[Mux.scala 98:16]
  wire [63:0] _T_166 = _T_10 ? $signed({{56{_T_83[7]}},_T_83}) : $signed(_T_165); // @[Mux.scala 98:16]
  wire [63:0] _T_167 = _T_8 ? $signed({{56{_T_80[7]}},_T_80}) : $signed(_T_166); // @[Mux.scala 98:16]
  wire [63:0] _T_168 = _T_6 ? $signed({{56{_T_77[7]}},_T_77}) : $signed(_T_167); // @[Mux.scala 98:16]
  wire [63:0] _T_170 = _T_4 ? $signed({{56{_T_74[7]}},_T_74}) : $signed(_T_168); // @[wb_stage.scala 99:44]
  wire [63:0] _T_1 = {{32'd0}, _T_68}; // @[wb_stage.scala 52:32]
  wire [63:0] data = io_wb_load_unsign ? _T_1 : _T_170; // @[wb_stage.scala 49:40]
  assign io_wb_wa_o = io_wb_wa_i; // @[wb_stage.scala 44:23]
  assign io_wb_wreg_o = io_wb_wreg_i; // @[wb_stage.scala 45:23]
  assign io_wb_wd_o = io_wb_mreg_i ? data : io_wb_dreg_i; // @[wb_stage.scala 102:20]
  assign io_csr_we_o = io_csr_we_i; // @[wb_stage.scala 39:21]
  assign io_csr_wa_o = io_csr_wa_i; // @[wb_stage.scala 40:21]
  assign io_csr_wd_o = io_csr_wd_i; // @[wb_stage.scala 41:17]
endmodule
module regfile(
  input         clock,
  input         reset,
  input  [4:0]  io_wa,
  input  [63:0] io_wd,
  input         io_we,
  input  [4:0]  io_ra1,
  input  [4:0]  io_ra2,
  input         io_re1,
  input         io_re2,
  output [63:0] io_rd1,
  output [63:0] io_rd2
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] regs_0; // @[regfile.scala 31:21]
  reg [63:0] regs_1; // @[regfile.scala 31:21]
  reg [63:0] regs_2; // @[regfile.scala 31:21]
  reg [63:0] regs_3; // @[regfile.scala 31:21]
  reg [63:0] regs_4; // @[regfile.scala 31:21]
  reg [63:0] regs_5; // @[regfile.scala 31:21]
  reg [63:0] regs_6; // @[regfile.scala 31:21]
  reg [63:0] regs_7; // @[regfile.scala 31:21]
  reg [63:0] regs_8; // @[regfile.scala 31:21]
  reg [63:0] regs_9; // @[regfile.scala 31:21]
  reg [63:0] regs_10; // @[regfile.scala 31:21]
  reg [63:0] regs_11; // @[regfile.scala 31:21]
  reg [63:0] regs_12; // @[regfile.scala 31:21]
  reg [63:0] regs_13; // @[regfile.scala 31:21]
  reg [63:0] regs_14; // @[regfile.scala 31:21]
  reg [63:0] regs_15; // @[regfile.scala 31:21]
  reg [63:0] regs_16; // @[regfile.scala 31:21]
  reg [63:0] regs_17; // @[regfile.scala 31:21]
  reg [63:0] regs_18; // @[regfile.scala 31:21]
  reg [63:0] regs_19; // @[regfile.scala 31:21]
  reg [63:0] regs_20; // @[regfile.scala 31:21]
  reg [63:0] regs_21; // @[regfile.scala 31:21]
  reg [63:0] regs_22; // @[regfile.scala 31:21]
  reg [63:0] regs_23; // @[regfile.scala 31:21]
  reg [63:0] regs_24; // @[regfile.scala 31:21]
  reg [63:0] regs_25; // @[regfile.scala 31:21]
  reg [63:0] regs_26; // @[regfile.scala 31:21]
  reg [63:0] regs_27; // @[regfile.scala 31:21]
  reg [63:0] regs_28; // @[regfile.scala 31:21]
  reg [63:0] regs_29; // @[regfile.scala 31:21]
  reg [63:0] regs_30; // @[regfile.scala 31:21]
  reg [63:0] regs_31; // @[regfile.scala 31:21]
  wire  _T_1 = io_ra1 == 5'h0; // @[regfile.scala 34:15]
  wire  _T_3 = io_ra1 == io_wa; // @[regfile.scala 36:42]
  wire  _T_4 = io_re1 & _T_3; // @[regfile.scala 36:31]
  wire  _T_6 = _T_4 & io_we; // @[regfile.scala 36:53]
  wire [63:0] _GEN_1 = 5'h1 == io_ra1 ? regs_1 : regs_0; // @[regfile.scala 39:18]
  wire [63:0] _GEN_2 = 5'h2 == io_ra1 ? regs_2 : _GEN_1; // @[regfile.scala 39:18]
  wire [63:0] _GEN_3 = 5'h3 == io_ra1 ? regs_3 : _GEN_2; // @[regfile.scala 39:18]
  wire [63:0] _GEN_4 = 5'h4 == io_ra1 ? regs_4 : _GEN_3; // @[regfile.scala 39:18]
  wire [63:0] _GEN_5 = 5'h5 == io_ra1 ? regs_5 : _GEN_4; // @[regfile.scala 39:18]
  wire [63:0] _GEN_6 = 5'h6 == io_ra1 ? regs_6 : _GEN_5; // @[regfile.scala 39:18]
  wire [63:0] _GEN_7 = 5'h7 == io_ra1 ? regs_7 : _GEN_6; // @[regfile.scala 39:18]
  wire [63:0] _GEN_8 = 5'h8 == io_ra1 ? regs_8 : _GEN_7; // @[regfile.scala 39:18]
  wire [63:0] _GEN_9 = 5'h9 == io_ra1 ? regs_9 : _GEN_8; // @[regfile.scala 39:18]
  wire [63:0] _GEN_10 = 5'ha == io_ra1 ? regs_10 : _GEN_9; // @[regfile.scala 39:18]
  wire [63:0] _GEN_11 = 5'hb == io_ra1 ? regs_11 : _GEN_10; // @[regfile.scala 39:18]
  wire [63:0] _GEN_12 = 5'hc == io_ra1 ? regs_12 : _GEN_11; // @[regfile.scala 39:18]
  wire [63:0] _GEN_13 = 5'hd == io_ra1 ? regs_13 : _GEN_12; // @[regfile.scala 39:18]
  wire [63:0] _GEN_14 = 5'he == io_ra1 ? regs_14 : _GEN_13; // @[regfile.scala 39:18]
  wire [63:0] _GEN_15 = 5'hf == io_ra1 ? regs_15 : _GEN_14; // @[regfile.scala 39:18]
  wire [63:0] _GEN_16 = 5'h10 == io_ra1 ? regs_16 : _GEN_15; // @[regfile.scala 39:18]
  wire [63:0] _GEN_17 = 5'h11 == io_ra1 ? regs_17 : _GEN_16; // @[regfile.scala 39:18]
  wire [63:0] _GEN_18 = 5'h12 == io_ra1 ? regs_18 : _GEN_17; // @[regfile.scala 39:18]
  wire [63:0] _GEN_19 = 5'h13 == io_ra1 ? regs_19 : _GEN_18; // @[regfile.scala 39:18]
  wire [63:0] _GEN_20 = 5'h14 == io_ra1 ? regs_20 : _GEN_19; // @[regfile.scala 39:18]
  wire [63:0] _GEN_21 = 5'h15 == io_ra1 ? regs_21 : _GEN_20; // @[regfile.scala 39:18]
  wire [63:0] _GEN_22 = 5'h16 == io_ra1 ? regs_22 : _GEN_21; // @[regfile.scala 39:18]
  wire [63:0] _GEN_23 = 5'h17 == io_ra1 ? regs_23 : _GEN_22; // @[regfile.scala 39:18]
  wire [63:0] _GEN_24 = 5'h18 == io_ra1 ? regs_24 : _GEN_23; // @[regfile.scala 39:18]
  wire [63:0] _GEN_25 = 5'h19 == io_ra1 ? regs_25 : _GEN_24; // @[regfile.scala 39:18]
  wire [63:0] _GEN_26 = 5'h1a == io_ra1 ? regs_26 : _GEN_25; // @[regfile.scala 39:18]
  wire [63:0] _GEN_27 = 5'h1b == io_ra1 ? regs_27 : _GEN_26; // @[regfile.scala 39:18]
  wire [63:0] _GEN_28 = 5'h1c == io_ra1 ? regs_28 : _GEN_27; // @[regfile.scala 39:18]
  wire [63:0] _GEN_29 = 5'h1d == io_ra1 ? regs_29 : _GEN_28; // @[regfile.scala 39:18]
  wire [63:0] _GEN_30 = 5'h1e == io_ra1 ? regs_30 : _GEN_29; // @[regfile.scala 39:18]
  wire [63:0] _GEN_31 = 5'h1f == io_ra1 ? regs_31 : _GEN_30; // @[regfile.scala 39:18]
  wire [63:0] _T_8 = io_re1 ? _GEN_31 : 64'h0; // @[regfile.scala 39:18]
  wire [63:0] _GEN_32 = _T_6 ? io_wd : _T_8; // @[regfile.scala 36:72]
  wire  _T_9 = io_ra2 == 5'h0; // @[regfile.scala 43:15]
  wire  _T_11 = io_ra2 == io_wa; // @[regfile.scala 45:42]
  wire  _T_12 = io_re2 & _T_11; // @[regfile.scala 45:31]
  wire  _T_14 = _T_12 & io_we; // @[regfile.scala 45:53]
  wire [63:0] _GEN_35 = 5'h1 == io_ra2 ? regs_1 : regs_0; // @[regfile.scala 48:18]
  wire [63:0] _GEN_36 = 5'h2 == io_ra2 ? regs_2 : _GEN_35; // @[regfile.scala 48:18]
  wire [63:0] _GEN_37 = 5'h3 == io_ra2 ? regs_3 : _GEN_36; // @[regfile.scala 48:18]
  wire [63:0] _GEN_38 = 5'h4 == io_ra2 ? regs_4 : _GEN_37; // @[regfile.scala 48:18]
  wire [63:0] _GEN_39 = 5'h5 == io_ra2 ? regs_5 : _GEN_38; // @[regfile.scala 48:18]
  wire [63:0] _GEN_40 = 5'h6 == io_ra2 ? regs_6 : _GEN_39; // @[regfile.scala 48:18]
  wire [63:0] _GEN_41 = 5'h7 == io_ra2 ? regs_7 : _GEN_40; // @[regfile.scala 48:18]
  wire [63:0] _GEN_42 = 5'h8 == io_ra2 ? regs_8 : _GEN_41; // @[regfile.scala 48:18]
  wire [63:0] _GEN_43 = 5'h9 == io_ra2 ? regs_9 : _GEN_42; // @[regfile.scala 48:18]
  wire [63:0] _GEN_44 = 5'ha == io_ra2 ? regs_10 : _GEN_43; // @[regfile.scala 48:18]
  wire [63:0] _GEN_45 = 5'hb == io_ra2 ? regs_11 : _GEN_44; // @[regfile.scala 48:18]
  wire [63:0] _GEN_46 = 5'hc == io_ra2 ? regs_12 : _GEN_45; // @[regfile.scala 48:18]
  wire [63:0] _GEN_47 = 5'hd == io_ra2 ? regs_13 : _GEN_46; // @[regfile.scala 48:18]
  wire [63:0] _GEN_48 = 5'he == io_ra2 ? regs_14 : _GEN_47; // @[regfile.scala 48:18]
  wire [63:0] _GEN_49 = 5'hf == io_ra2 ? regs_15 : _GEN_48; // @[regfile.scala 48:18]
  wire [63:0] _GEN_50 = 5'h10 == io_ra2 ? regs_16 : _GEN_49; // @[regfile.scala 48:18]
  wire [63:0] _GEN_51 = 5'h11 == io_ra2 ? regs_17 : _GEN_50; // @[regfile.scala 48:18]
  wire [63:0] _GEN_52 = 5'h12 == io_ra2 ? regs_18 : _GEN_51; // @[regfile.scala 48:18]
  wire [63:0] _GEN_53 = 5'h13 == io_ra2 ? regs_19 : _GEN_52; // @[regfile.scala 48:18]
  wire [63:0] _GEN_54 = 5'h14 == io_ra2 ? regs_20 : _GEN_53; // @[regfile.scala 48:18]
  wire [63:0] _GEN_55 = 5'h15 == io_ra2 ? regs_21 : _GEN_54; // @[regfile.scala 48:18]
  wire [63:0] _GEN_56 = 5'h16 == io_ra2 ? regs_22 : _GEN_55; // @[regfile.scala 48:18]
  wire [63:0] _GEN_57 = 5'h17 == io_ra2 ? regs_23 : _GEN_56; // @[regfile.scala 48:18]
  wire [63:0] _GEN_58 = 5'h18 == io_ra2 ? regs_24 : _GEN_57; // @[regfile.scala 48:18]
  wire [63:0] _GEN_59 = 5'h19 == io_ra2 ? regs_25 : _GEN_58; // @[regfile.scala 48:18]
  wire [63:0] _GEN_60 = 5'h1a == io_ra2 ? regs_26 : _GEN_59; // @[regfile.scala 48:18]
  wire [63:0] _GEN_61 = 5'h1b == io_ra2 ? regs_27 : _GEN_60; // @[regfile.scala 48:18]
  wire [63:0] _GEN_62 = 5'h1c == io_ra2 ? regs_28 : _GEN_61; // @[regfile.scala 48:18]
  wire [63:0] _GEN_63 = 5'h1d == io_ra2 ? regs_29 : _GEN_62; // @[regfile.scala 48:18]
  wire [63:0] _GEN_64 = 5'h1e == io_ra2 ? regs_30 : _GEN_63; // @[regfile.scala 48:18]
  wire [63:0] _GEN_65 = 5'h1f == io_ra2 ? regs_31 : _GEN_64; // @[regfile.scala 48:18]
  wire [63:0] _T_16 = io_re2 ? _GEN_65 : 64'h0; // @[regfile.scala 48:18]
  wire [63:0] _GEN_66 = _T_14 ? io_wd : _T_16; // @[regfile.scala 45:72]
  wire  _T_18 = io_wa != 5'h0; // @[regfile.scala 52:35]
  wire  _T_19 = io_we & _T_18; // @[regfile.scala 52:25]
  assign io_rd1 = _T_1 ? 64'h0 : _GEN_32; // @[regfile.scala 35:12 regfile.scala 37:12 regfile.scala 39:12]
  assign io_rd2 = _T_9 ? 64'h0 : _GEN_66; // @[regfile.scala 44:12 regfile.scala 46:12 regfile.scala 48:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  regs_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  regs_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  regs_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  regs_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  regs_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  regs_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  regs_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  regs_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  regs_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  regs_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  regs_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  regs_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  regs_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  regs_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  regs_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  regs_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  regs_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  regs_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  regs_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  regs_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  regs_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  regs_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  regs_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  regs_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  regs_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  regs_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  regs_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  regs_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  regs_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  regs_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  regs_30 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  regs_31 = _RAND_31[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      regs_0 <= 64'h0;
    end else if (_T_19) begin
      if (5'h0 == io_wa) begin
        regs_0 <= io_wd;
      end
    end
    if (reset) begin
      regs_1 <= 64'h0;
    end else if (_T_19) begin
      if (5'h1 == io_wa) begin
        regs_1 <= io_wd;
      end
    end
    if (reset) begin
      regs_2 <= 64'h0;
    end else if (_T_19) begin
      if (5'h2 == io_wa) begin
        regs_2 <= io_wd;
      end
    end
    if (reset) begin
      regs_3 <= 64'h0;
    end else if (_T_19) begin
      if (5'h3 == io_wa) begin
        regs_3 <= io_wd;
      end
    end
    if (reset) begin
      regs_4 <= 64'h0;
    end else if (_T_19) begin
      if (5'h4 == io_wa) begin
        regs_4 <= io_wd;
      end
    end
    if (reset) begin
      regs_5 <= 64'h0;
    end else if (_T_19) begin
      if (5'h5 == io_wa) begin
        regs_5 <= io_wd;
      end
    end
    if (reset) begin
      regs_6 <= 64'h0;
    end else if (_T_19) begin
      if (5'h6 == io_wa) begin
        regs_6 <= io_wd;
      end
    end
    if (reset) begin
      regs_7 <= 64'h0;
    end else if (_T_19) begin
      if (5'h7 == io_wa) begin
        regs_7 <= io_wd;
      end
    end
    if (reset) begin
      regs_8 <= 64'h0;
    end else if (_T_19) begin
      if (5'h8 == io_wa) begin
        regs_8 <= io_wd;
      end
    end
    if (reset) begin
      regs_9 <= 64'h0;
    end else if (_T_19) begin
      if (5'h9 == io_wa) begin
        regs_9 <= io_wd;
      end
    end
    if (reset) begin
      regs_10 <= 64'h0;
    end else if (_T_19) begin
      if (5'ha == io_wa) begin
        regs_10 <= io_wd;
      end
    end
    if (reset) begin
      regs_11 <= 64'h0;
    end else if (_T_19) begin
      if (5'hb == io_wa) begin
        regs_11 <= io_wd;
      end
    end
    if (reset) begin
      regs_12 <= 64'h0;
    end else if (_T_19) begin
      if (5'hc == io_wa) begin
        regs_12 <= io_wd;
      end
    end
    if (reset) begin
      regs_13 <= 64'h0;
    end else if (_T_19) begin
      if (5'hd == io_wa) begin
        regs_13 <= io_wd;
      end
    end
    if (reset) begin
      regs_14 <= 64'h0;
    end else if (_T_19) begin
      if (5'he == io_wa) begin
        regs_14 <= io_wd;
      end
    end
    if (reset) begin
      regs_15 <= 64'h0;
    end else if (_T_19) begin
      if (5'hf == io_wa) begin
        regs_15 <= io_wd;
      end
    end
    if (reset) begin
      regs_16 <= 64'h0;
    end else if (_T_19) begin
      if (5'h10 == io_wa) begin
        regs_16 <= io_wd;
      end
    end
    if (reset) begin
      regs_17 <= 64'h0;
    end else if (_T_19) begin
      if (5'h11 == io_wa) begin
        regs_17 <= io_wd;
      end
    end
    if (reset) begin
      regs_18 <= 64'h0;
    end else if (_T_19) begin
      if (5'h12 == io_wa) begin
        regs_18 <= io_wd;
      end
    end
    if (reset) begin
      regs_19 <= 64'h0;
    end else if (_T_19) begin
      if (5'h13 == io_wa) begin
        regs_19 <= io_wd;
      end
    end
    if (reset) begin
      regs_20 <= 64'h0;
    end else if (_T_19) begin
      if (5'h14 == io_wa) begin
        regs_20 <= io_wd;
      end
    end
    if (reset) begin
      regs_21 <= 64'h0;
    end else if (_T_19) begin
      if (5'h15 == io_wa) begin
        regs_21 <= io_wd;
      end
    end
    if (reset) begin
      regs_22 <= 64'h0;
    end else if (_T_19) begin
      if (5'h16 == io_wa) begin
        regs_22 <= io_wd;
      end
    end
    if (reset) begin
      regs_23 <= 64'h0;
    end else if (_T_19) begin
      if (5'h17 == io_wa) begin
        regs_23 <= io_wd;
      end
    end
    if (reset) begin
      regs_24 <= 64'h0;
    end else if (_T_19) begin
      if (5'h18 == io_wa) begin
        regs_24 <= io_wd;
      end
    end
    if (reset) begin
      regs_25 <= 64'h0;
    end else if (_T_19) begin
      if (5'h19 == io_wa) begin
        regs_25 <= io_wd;
      end
    end
    if (reset) begin
      regs_26 <= 64'h0;
    end else if (_T_19) begin
      if (5'h1a == io_wa) begin
        regs_26 <= io_wd;
      end
    end
    if (reset) begin
      regs_27 <= 64'h0;
    end else if (_T_19) begin
      if (5'h1b == io_wa) begin
        regs_27 <= io_wd;
      end
    end
    if (reset) begin
      regs_28 <= 64'h0;
    end else if (_T_19) begin
      if (5'h1c == io_wa) begin
        regs_28 <= io_wd;
      end
    end
    if (reset) begin
      regs_29 <= 64'h0;
    end else if (_T_19) begin
      if (5'h1d == io_wa) begin
        regs_29 <= io_wd;
      end
    end
    if (reset) begin
      regs_30 <= 64'h0;
    end else if (_T_19) begin
      if (5'h1e == io_wa) begin
        regs_30 <= io_wd;
      end
    end
    if (reset) begin
      regs_31 <= 64'h0;
    end else if (_T_19) begin
      if (5'h1f == io_wa) begin
        regs_31 <= io_wd;
      end
    end
  end
endmodule
module stall_ctrl(
  input        io_stallreq_id,
  input        io_stallreq_exe,
  input        io_stallreq_mem,
  output [4:0] io_stall
);
  wire [3:0] _T_3 = io_stallreq_exe ? 4'hf : 4'h0; // @[Mux.scala 98:16]
  wire [3:0] _T_4 = io_stallreq_id ? 4'h7 : _T_3; // @[Mux.scala 98:16]
  assign io_stall = io_stallreq_mem ? 5'h1f : {{1'd0}, _T_4}; // @[stall_ctrl.scala 19:12]
endmodule
module excp(
  input         clock,
  input         reset,
  input         io_we_i,
  input  [11:0] io_wa_i,
  input  [63:0] io_wd_i,
  input         io_re_i,
  input  [11:0] io_ra_i,
  output [63:0] io_rd_o,
  input  [4:0]  io_exccode_i,
  input  [63:0] io_pc_i,
  input  [63:0] io_jump_addr_i,
  output        io_flush,
  output [63:0] io_excaddr,
  input         io_mtime_int_i,
  input         io_msoft_int_i,
  input         io_mext_int_i
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mtvec; // @[excp.scala 35:25]
  reg [63:0] mcause; // @[excp.scala 36:25]
  reg [63:0] mepc; // @[excp.scala 37:25]
  reg [63:0] mstatus; // @[excp.scala 38:25]
  reg [63:0] mscratch; // @[excp.scala 39:25]
  reg  MEIP; // @[excp.scala 42:21]
  reg  MTIP; // @[excp.scala 45:21]
  reg  MSIP; // @[excp.scala 48:21]
  reg  MEIE; // @[excp.scala 51:21]
  reg  MTIE; // @[excp.scala 54:21]
  reg  MSIE; // @[excp.scala 57:21]
  wire [63:0] mie = {52'h0,MEIE,2'h0,1'h0,MTIE,1'h0,2'h0,MSIE,3'h0}; // @[Cat.scala 30:58]
  wire [63:0] mip = {52'h0,MEIP,2'h0,1'h0,MTIP,1'h0,2'h0,MSIP,3'h0}; // @[Cat.scala 30:58]
  wire  _T_23 = ~MSIP; // @[excp.scala 63:39]
  wire  _T_24 = io_msoft_int_i & _T_23; // @[excp.scala 63:31]
  wire  _T_25 = ~io_msoft_int_i; // @[excp.scala 65:29]
  wire  _T_27 = _T_25 & MSIP; // @[excp.scala 65:37]
  wire  _GEN_0 = _T_27 ? 1'h0 : MSIP; // @[excp.scala 65:53]
  wire  _GEN_1 = _T_24 | _GEN_0; // @[excp.scala 63:47]
  wire  _T_29 = ~MTIP; // @[excp.scala 69:39]
  wire  _T_30 = io_mtime_int_i & _T_29; // @[excp.scala 69:31]
  wire  _T_31 = ~io_mtime_int_i; // @[excp.scala 71:29]
  wire  _T_33 = _T_31 & MTIP; // @[excp.scala 71:37]
  wire  _GEN_2 = _T_33 ? 1'h0 : MTIP; // @[excp.scala 71:53]
  wire  _GEN_3 = _T_30 | _GEN_2; // @[excp.scala 69:47]
  wire  _T_35 = ~MEIP; // @[excp.scala 75:38]
  wire  _T_36 = io_mext_int_i & _T_35; // @[excp.scala 75:30]
  wire  _T_37 = ~io_mext_int_i; // @[excp.scala 77:28]
  wire  _T_39 = _T_37 & MEIP; // @[excp.scala 77:36]
  wire  _GEN_4 = _T_39 ? 1'h0 : MEIP; // @[excp.scala 77:52]
  wire  _GEN_5 = _T_36 | _GEN_4; // @[excp.scala 75:46]
  wire  global_int_en = mstatus[3]; // @[excp.scala 81:34]
  wire  _T_43 = io_ra_i == 12'h305; // @[excp.scala 88:26]
  wire  _T_44 = io_ra_i == 12'h342; // @[excp.scala 89:26]
  wire  _T_45 = io_ra_i == 12'h341; // @[excp.scala 90:26]
  wire  _T_46 = io_ra_i == 12'h300; // @[excp.scala 91:26]
  wire  _T_47 = io_ra_i == 12'h340; // @[excp.scala 92:26]
  wire  _T_48 = io_ra_i == 12'h304; // @[excp.scala 93:26]
  wire  _T_49 = io_ra_i == 12'h344; // @[excp.scala 94:26]
  wire [63:0] _T_50 = _T_49 ? mip : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_51 = _T_48 ? mie : _T_50; // @[Mux.scala 98:16]
  wire [63:0] _T_52 = _T_47 ? mscratch : _T_51; // @[Mux.scala 98:16]
  wire [63:0] _T_53 = _T_46 ? mstatus : _T_52; // @[Mux.scala 98:16]
  wire [63:0] _T_54 = _T_45 ? mepc : _T_53; // @[Mux.scala 98:16]
  wire [63:0] _T_55 = _T_44 ? mcause : _T_54; // @[Mux.scala 98:16]
  wire [63:0] _T_56 = _T_43 ? mtvec : _T_55; // @[Mux.scala 98:16]
  wire  _T_59 = 12'h305 == io_wa_i; // @[Conditional.scala 37:30]
  wire  _T_60 = 12'h342 == io_wa_i; // @[Conditional.scala 37:30]
  wire  _T_61 = 12'h341 == io_wa_i; // @[Conditional.scala 37:30]
  wire  _T_62 = 12'h300 == io_wa_i; // @[Conditional.scala 37:30]
  wire  _T_63 = 12'h340 == io_wa_i; // @[Conditional.scala 37:30]
  wire  _T_64 = 12'h304 == io_wa_i; // @[Conditional.scala 37:30]
  wire  _T_68 = 12'h344 == io_wa_i; // @[Conditional.scala 37:30]
  wire  _GEN_10 = _T_64 ? io_wd_i[7] : MTIE; // @[Conditional.scala 39:67]
  wire  _GEN_11 = _T_64 ? io_wd_i[3] : MSIE; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_64 ? io_wd_i[11] : MEIE; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_63 ? MTIE : _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_63 ? MSIE : _GEN_11; // @[Conditional.scala 39:67]
  wire  _GEN_19 = _T_63 ? MEIE : _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_62 ? MTIE : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_26 = _T_62 ? MSIE : _GEN_18; // @[Conditional.scala 39:67]
  wire  _GEN_27 = _T_62 ? MEIE : _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_61 ? MTIE : _GEN_25; // @[Conditional.scala 39:67]
  wire  _GEN_35 = _T_61 ? MSIE : _GEN_26; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_61 ? MEIE : _GEN_27; // @[Conditional.scala 39:67]
  wire  _GEN_44 = _T_60 ? MTIE : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_45 = _T_60 ? MSIE : _GEN_35; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_60 ? MEIE : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_59 ? MTIE : _GEN_44; // @[Conditional.scala 40:58]
  wire  _GEN_56 = _T_59 ? MSIE : _GEN_45; // @[Conditional.scala 40:58]
  wire  _GEN_57 = _T_59 ? MEIE : _GEN_46; // @[Conditional.scala 40:58]
  wire  _GEN_66 = io_we_i ? _GEN_55 : MTIE; // @[excp.scala 100:24]
  wire  _GEN_67 = io_we_i ? _GEN_56 : MSIE; // @[excp.scala 100:24]
  wire  _GEN_68 = io_we_i ? _GEN_57 : MEIE; // @[excp.scala 100:24]
  wire  _T_72 = io_exccode_i != 5'h1f; // @[excp.scala 121:48]
  wire  _T_75 = global_int_en & MSIE; // @[excp.scala 122:57]
  wire  _T_77 = _T_75 & MSIP; // @[excp.scala 122:73]
  wire  _T_78 = io_pc_i != 64'h0; // @[excp.scala 122:100]
  wire  _T_79 = _T_77 & _T_78; // @[excp.scala 122:89]
  wire  _T_82 = global_int_en & MTIE; // @[excp.scala 123:57]
  wire  _T_84 = _T_82 & MTIP; // @[excp.scala 123:73]
  wire  _T_86 = _T_84 & _T_78; // @[excp.scala 123:89]
  wire  _T_89 = global_int_en & MEIE; // @[excp.scala 124:57]
  wire  _T_91 = _T_89 & MEIP; // @[excp.scala 124:73]
  wire  _T_93 = _T_91 & _T_78; // @[excp.scala 124:89]
  wire [4:0] _T_94 = _T_93 ? 5'h1b : 5'h1f; // @[Mux.scala 98:16]
  wire [4:0] _T_95 = _T_86 ? 5'h17 : _T_94; // @[Mux.scala 98:16]
  wire [4:0] _T_96 = _T_79 ? 5'h13 : _T_95; // @[Mux.scala 98:16]
  wire [4:0] exccode = _T_72 ? io_exccode_i : _T_96; // @[Mux.scala 98:16]
  wire  _T_99 = exccode == 5'h1f; // @[excp.scala 130:16]
  wire  _T_100 = exccode == 5'h1e; // @[excp.scala 133:22]
  wire  _T_103 = io_wa_i == 12'h341; // @[excp.scala 135:68]
  wire  _T_104 = io_we_i & _T_103; // @[excp.scala 135:51]
  wire [63:0] _T_105 = _T_104 ? io_wd_i : mepc; // @[excp.scala 135:34]
  wire [63:0] _T_112 = {57'h31,3'h0,mstatus[7],3'h0}; // @[Cat.scala 30:58]
  wire  _T_113 = exccode == 5'h17; // @[excp.scala 140:22]
  wire  _T_115 = mtvec[1:0] == 2'h0; // @[excp.scala 142:69]
  wire [63:0] _T_117 = {mtvec[63:2],2'h0}; // @[Cat.scala 30:58]
  wire  _T_119 = mtvec[1:0] == 2'h1; // @[excp.scala 143:69]
  wire [63:0] _T_122 = _T_119 ? _T_117 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_123 = _T_115 ? _T_117 : _T_122; // @[Mux.scala 98:16]
  wire  _T_125 = io_jump_addr_i != 64'h0; // @[excp.scala 147:46]
  wire [63:0] _T_127 = io_pc_i + 64'h4; // @[excp.scala 147:78]
  wire [63:0] _T_135 = {53'h3,3'h0,global_int_en,7'h0}; // @[Cat.scala 30:58]
  wire  _T_136 = exccode == 5'h13; // @[excp.scala 151:22]
  wire  _T_159 = exccode == 5'h1b; // @[excp.scala 162:22]
  wire [63:0] _T_193 = {60'h0,io_exccode_i[3:0]}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_72 = _T_159 ? _T_123 : _T_123; // @[excp.scala 162:38]
  wire [63:0] _GEN_76 = _T_136 ? _T_123 : _GEN_72; // @[excp.scala 151:36]
  wire [63:0] _GEN_80 = _T_113 ? _T_123 : _GEN_76; // @[excp.scala 140:39]
  wire [63:0] _GEN_84 = _T_100 ? _T_105 : _GEN_80; // @[excp.scala 133:36]
  assign io_rd_o = io_re_i ? _T_56 : 64'h0; // @[excp.scala 87:13 excp.scala 96:17]
  assign io_flush = exccode != 5'h1f; // @[excp.scala 127:12]
  assign io_excaddr = _T_99 ? 64'h0 : _GEN_84; // @[excp.scala 131:28 excp.scala 135:28 excp.scala 141:28 excp.scala 152:28 excp.scala 163:28 excp.scala 174:28]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  mtvec = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mcause = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mepc = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mstatus = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  mscratch = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  MEIP = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  MTIP = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  MSIP = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  MEIE = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  MTIE = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  MSIE = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      mtvec <= 64'hf0;
    end else if (io_we_i) begin
      if (_T_59) begin
        mtvec <= io_wd_i;
      end
    end
    if (reset) begin
      mcause <= 64'h0;
    end else if (_T_99) begin
      if (io_we_i) begin
        if (!(_T_59)) begin
          if (_T_60) begin
            mcause <= io_wd_i;
          end
        end
      end
    end else if (_T_100) begin
      if (io_we_i) begin
        if (!(_T_59)) begin
          if (_T_60) begin
            mcause <= io_wd_i;
          end
        end
      end
    end else if (_T_113) begin
      mcause <= 64'h8000000000000007;
    end else if (_T_136) begin
      mcause <= 64'h8000000000000003;
    end else if (_T_159) begin
      mcause <= 64'h8000000000000003;
    end else begin
      mcause <= _T_193;
    end
    if (reset) begin
      mepc <= 64'h0;
    end else if (_T_99) begin
      if (io_we_i) begin
        if (!(_T_59)) begin
          if (!(_T_60)) begin
            if (_T_61) begin
              mepc <= io_wd_i;
            end
          end
        end
      end
    end else if (_T_100) begin
      if (io_we_i) begin
        if (!(_T_59)) begin
          if (!(_T_60)) begin
            if (_T_61) begin
              mepc <= io_wd_i;
            end
          end
        end
      end
    end else if (_T_113) begin
      if (_T_125) begin
        mepc <= io_jump_addr_i;
      end else begin
        mepc <= _T_127;
      end
    end else if (_T_136) begin
      if (_T_125) begin
        mepc <= io_jump_addr_i;
      end else begin
        mepc <= _T_127;
      end
    end else if (_T_159) begin
      if (_T_125) begin
        mepc <= io_jump_addr_i;
      end else begin
        mepc <= _T_127;
      end
    end else begin
      mepc <= io_pc_i;
    end
    if (reset) begin
      mstatus <= 64'h8;
    end else if (_T_99) begin
      if (io_we_i) begin
        if (!(_T_59)) begin
          if (!(_T_60)) begin
            if (!(_T_61)) begin
              if (_T_62) begin
                mstatus <= io_wd_i;
              end
            end
          end
        end
      end
    end else if (_T_100) begin
      mstatus <= _T_112;
    end else if (_T_113) begin
      mstatus <= _T_135;
    end else if (_T_136) begin
      mstatus <= _T_135;
    end else if (_T_159) begin
      mstatus <= _T_135;
    end else begin
      mstatus <= _T_135;
    end
    if (reset) begin
      mscratch <= 64'h0;
    end else if (io_we_i) begin
      if (!(_T_59)) begin
        if (!(_T_60)) begin
          if (!(_T_61)) begin
            if (!(_T_62)) begin
              if (_T_63) begin
                mscratch <= io_wd_i;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      MEIP <= 1'h0;
    end else if (io_we_i) begin
      if (_T_59) begin
        MEIP <= _GEN_5;
      end else if (_T_60) begin
        MEIP <= _GEN_5;
      end else if (_T_61) begin
        MEIP <= _GEN_5;
      end else if (_T_62) begin
        MEIP <= _GEN_5;
      end else if (_T_63) begin
        MEIP <= _GEN_5;
      end else if (_T_64) begin
        MEIP <= _GEN_5;
      end else if (_T_68) begin
        MEIP <= io_wd_i[11];
      end else begin
        MEIP <= _GEN_5;
      end
    end else begin
      MEIP <= _GEN_5;
    end
    if (reset) begin
      MTIP <= 1'h0;
    end else if (io_we_i) begin
      if (_T_59) begin
        MTIP <= _GEN_3;
      end else if (_T_60) begin
        MTIP <= _GEN_3;
      end else if (_T_61) begin
        MTIP <= _GEN_3;
      end else if (_T_62) begin
        MTIP <= _GEN_3;
      end else if (_T_63) begin
        MTIP <= _GEN_3;
      end else if (_T_64) begin
        MTIP <= _GEN_3;
      end else if (_T_68) begin
        MTIP <= io_wd_i[7];
      end else begin
        MTIP <= _GEN_3;
      end
    end else begin
      MTIP <= _GEN_3;
    end
    if (reset) begin
      MSIP <= 1'h0;
    end else if (io_we_i) begin
      if (_T_59) begin
        MSIP <= _GEN_1;
      end else if (_T_60) begin
        MSIP <= _GEN_1;
      end else if (_T_61) begin
        MSIP <= _GEN_1;
      end else if (_T_62) begin
        MSIP <= _GEN_1;
      end else if (_T_63) begin
        MSIP <= _GEN_1;
      end else if (_T_64) begin
        MSIP <= _GEN_1;
      end else if (_T_68) begin
        MSIP <= io_wd_i[3];
      end else begin
        MSIP <= _GEN_1;
      end
    end else begin
      MSIP <= _GEN_1;
    end
    MEIE <= reset | _GEN_68;
    MTIE <= reset | _GEN_66;
    MSIE <= reset | _GEN_67;
  end
endmodule
module clint(
  input         clock,
  input         reset,
  input         io_we,
  input  [63:0] io_addr,
  input  [63:0] io_wd,
  output        io_software_int,
  output        io_timer_int
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] data = {io_wd[7:0],io_wd[15:8],io_wd[23:16],io_wd[31:24],io_wd[39:32],io_wd[47:40],io_wd[55:48],io_wd[63:56]}; // @[Cat.scala 30:58]
  reg [63:0] mtime; // @[clint.scala 30:25]
  reg [63:0] mtimecmp; // @[clint.scala 31:25]
  reg  msip; // @[clint.scala 32:25]
  wire  _T_15 = io_addr == 64'h200bff8; // @[clint.scala 35:44]
  wire  _T_16 = io_we & _T_15; // @[clint.scala 35:33]
  wire [63:0] _T_18 = mtime + 64'h1; // @[clint.scala 35:72]
  wire  _T_21 = io_addr == 64'h2004000; // @[clint.scala 36:44]
  wire  _T_22 = io_we & _T_21; // @[clint.scala 36:33]
  wire  _T_25 = io_addr == 64'h2000000; // @[clint.scala 37:44]
  wire  _T_26 = io_we & _T_25; // @[clint.scala 37:33]
  wire [63:0] _T_27 = _T_26 ? data : {{63'd0}, msip}; // @[clint.scala 37:18]
  assign io_software_int = msip; // @[clint.scala 44:19]
  assign io_timer_int = mtime > mtimecmp; // @[clint.scala 41:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  mtime = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mtimecmp = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  msip = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      mtime <= 64'h0;
    end else if (_T_16) begin
      mtime <= data;
    end else begin
      mtime <= _T_18;
    end
    if (reset) begin
      mtimecmp <= 64'hffffffffffffffff;
    end else if (_T_22) begin
      mtimecmp <= data;
    end
    if (reset) begin
      msip <= 1'h0;
    end else begin
      msip <= _T_27[0];
    end
  end
endmodule
module plic(
  input         clock,
  input         reset,
  input         io_int_i_1,
  input         io_int_i_2,
  input         io_int_i_3,
  input         io_int_i_4,
  input         io_int_i_5,
  input         io_int_i_6,
  output        io_excint,
  input         io_re,
  output [63:0] io_rdata,
  input         io_we,
  input  [2:0]  io_wdata,
  input  [63:0] io_addr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg  pending_1; // @[plic.scala 31:26]
  reg  pending_2; // @[plic.scala 31:26]
  reg  pending_3; // @[plic.scala 31:26]
  reg  pending_4; // @[plic.scala 31:26]
  reg  pending_5; // @[plic.scala 31:26]
  reg  pending_6; // @[plic.scala 31:26]
  reg  gate_1; // @[plic.scala 34:26]
  reg  gate_2; // @[plic.scala 34:26]
  reg  gate_3; // @[plic.scala 34:26]
  reg  gate_4; // @[plic.scala 34:26]
  reg  gate_5; // @[plic.scala 34:26]
  reg  gate_6; // @[plic.scala 34:26]
  reg [2:0] Max_pri; // @[plic.scala 36:26]
  reg [2:0] Max_id; // @[plic.scala 37:26]
  wire  _T_7 = io_int_i_1 & gate_1; // @[plic.scala 41:27]
  wire  _GEN_0 = _T_7 ? 1'h0 : gate_1; // @[plic.scala 41:46]
  wire  _GEN_1 = _T_7 | pending_1; // @[plic.scala 41:46]
  wire  _T_10 = io_int_i_2 & gate_2; // @[plic.scala 45:27]
  wire  _GEN_2 = _T_10 ? 1'h0 : gate_2; // @[plic.scala 45:46]
  wire  _GEN_3 = _T_10 | pending_2; // @[plic.scala 45:46]
  wire  _T_13 = io_int_i_3 & gate_3; // @[plic.scala 49:27]
  wire  _GEN_4 = _T_13 ? 1'h0 : gate_3; // @[plic.scala 49:46]
  wire  _GEN_5 = _T_13 | pending_3; // @[plic.scala 49:46]
  wire  _T_16 = io_int_i_4 & gate_4; // @[plic.scala 53:27]
  wire  _GEN_6 = _T_16 ? 1'h0 : gate_4; // @[plic.scala 53:46]
  wire  _GEN_7 = _T_16 | pending_4; // @[plic.scala 53:46]
  wire  _T_19 = io_int_i_5 & gate_5; // @[plic.scala 57:27]
  wire  _GEN_8 = _T_19 ? 1'h0 : gate_5; // @[plic.scala 57:46]
  wire  _GEN_9 = _T_19 | pending_5; // @[plic.scala 57:46]
  wire  _T_22 = io_int_i_6 & gate_6; // @[plic.scala 61:27]
  wire  _GEN_10 = _T_22 ? 1'h0 : gate_6; // @[plic.scala 61:46]
  wire  _GEN_11 = _T_22 | pending_6; // @[plic.scala 61:46]
  wire [2:0] _T_26 = pending_1 ? 3'h7 : 3'h0; // @[plic.scala 67:30]
  wire [5:0] pri1 = {3'h1,_T_26}; // @[Cat.scala 30:58]
  wire [2:0] _T_30 = pending_2 ? 3'h7 : 3'h0; // @[plic.scala 68:30]
  wire [5:0] pri2 = {3'h2,_T_30}; // @[Cat.scala 30:58]
  wire [2:0] _T_34 = pending_3 ? 3'h7 : 3'h0; // @[plic.scala 69:30]
  wire [5:0] pri3 = {3'h3,_T_34}; // @[Cat.scala 30:58]
  wire [2:0] _T_38 = pending_4 ? 3'h7 : 3'h0; // @[plic.scala 70:30]
  wire [5:0] pri4 = {3'h4,_T_38}; // @[Cat.scala 30:58]
  wire [2:0] _T_42 = pending_5 ? 3'h7 : 3'h0; // @[plic.scala 71:30]
  wire [5:0] pri5 = {3'h5,_T_42}; // @[Cat.scala 30:58]
  wire [2:0] _T_46 = pending_6 ? 3'h7 : 3'h0; // @[plic.scala 72:30]
  wire [5:0] pri6 = {3'h6,_T_46}; // @[Cat.scala 30:58]
  wire  _T_49 = pri1[2:0] > pri2[2:0]; // @[plic.scala 76:34]
  wire  _T_52 = pri1[2:0] < pri2[2:0]; // @[plic.scala 77:54]
  wire [5:0] _T_57 = _T_52 ? pri2 : pri1; // @[Mux.scala 98:16]
  wire [5:0] pri_temp12 = _T_49 ? pri1 : _T_57; // @[Mux.scala 98:16]
  wire  _T_60 = pri3[2:0] > pri4[2:0]; // @[plic.scala 80:34]
  wire  _T_63 = pri3[2:0] < pri4[2:0]; // @[plic.scala 81:54]
  wire [5:0] _T_68 = _T_63 ? pri4 : pri3; // @[Mux.scala 98:16]
  wire [5:0] pri_temp34 = _T_60 ? pri3 : _T_68; // @[Mux.scala 98:16]
  wire  _T_71 = pri5[2:0] > pri6[2:0]; // @[plic.scala 84:34]
  wire  _T_74 = pri5[2:0] < pri6[2:0]; // @[plic.scala 85:54]
  wire [5:0] _T_79 = _T_74 ? pri6 : pri5; // @[Mux.scala 98:16]
  wire [5:0] pri_temp56 = _T_71 ? pri5 : _T_79; // @[Mux.scala 98:16]
  wire  _T_82 = pri_temp12[2:0] > pri_temp34[2:0]; // @[plic.scala 88:40]
  wire  _T_85 = pri_temp12[2:0] < pri_temp34[2:0]; // @[plic.scala 89:40]
  wire [5:0] _T_90 = _T_85 ? pri_temp34 : pri_temp12; // @[Mux.scala 98:16]
  wire [5:0] pri_temp = _T_82 ? pri_temp12 : _T_90; // @[Mux.scala 98:16]
  wire  _T_93 = pri_temp[2:0] > pri_temp56[2:0]; // @[plic.scala 92:38]
  wire  _T_96 = pri_temp[2:0] < pri_temp56[2:0]; // @[plic.scala 93:38]
  wire [5:0] _T_101 = _T_96 ? pri_temp56 : pri_temp; // @[Mux.scala 98:16]
  wire [5:0] pri_max = _T_93 ? pri_temp : _T_101; // @[Mux.scala 98:16]
  wire  _T_107 = io_addr == 64'hc200004; // @[plic.scala 106:33]
  wire  _T_108 = io_re & _T_107; // @[plic.scala 106:22]
  wire [2:0] _GEN_26 = _T_108 ? Max_id : 3'h0; // @[plic.scala 106:57]
  wire  _T_111 = io_we & _T_107; // @[plic.scala 113:22]
  wire  _GEN_48 = 3'h1 == io_wdata; // @[plic.scala 114:24]
  wire  _GEN_35 = _GEN_48 | _GEN_0; // @[plic.scala 114:24]
  wire  _GEN_49 = 3'h2 == io_wdata; // @[plic.scala 114:24]
  wire  _GEN_36 = _GEN_49 | _GEN_2; // @[plic.scala 114:24]
  wire  _GEN_50 = 3'h3 == io_wdata; // @[plic.scala 114:24]
  wire  _GEN_37 = _GEN_50 | _GEN_4; // @[plic.scala 114:24]
  wire  _GEN_51 = 3'h4 == io_wdata; // @[plic.scala 114:24]
  wire  _GEN_38 = _GEN_51 | _GEN_6; // @[plic.scala 114:24]
  wire  _GEN_52 = 3'h5 == io_wdata; // @[plic.scala 114:24]
  wire  _GEN_39 = _GEN_52 | _GEN_8; // @[plic.scala 114:24]
  wire  _GEN_53 = 3'h6 == io_wdata; // @[plic.scala 114:24]
  wire  _GEN_40 = _GEN_53 | _GEN_10; // @[plic.scala 114:24]
  wire  _GEN_42 = _T_111 ? _GEN_35 : _GEN_0; // @[plic.scala 113:57]
  wire  _GEN_43 = _T_111 ? _GEN_36 : _GEN_2; // @[plic.scala 113:57]
  wire  _GEN_44 = _T_111 ? _GEN_37 : _GEN_4; // @[plic.scala 113:57]
  wire  _GEN_45 = _T_111 ? _GEN_38 : _GEN_6; // @[plic.scala 113:57]
  wire  _GEN_46 = _T_111 ? _GEN_39 : _GEN_8; // @[plic.scala 113:57]
  wire  _GEN_47 = _T_111 ? _GEN_40 : _GEN_10; // @[plic.scala 113:57]
  assign io_excint = Max_pri > 3'h0; // @[plic.scala 101:16]
  assign io_rdata = {{61'd0}, _GEN_26}; // @[plic.scala 107:18 plic.scala 110:18]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pending_1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pending_2 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pending_3 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  pending_4 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  pending_5 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  pending_6 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  gate_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  gate_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  gate_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  gate_4 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  gate_5 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  gate_6 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  Max_pri = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  Max_id = _RAND_13[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pending_1 <= 1'h0;
    end else if (_T_108) begin
      if (3'h1 == Max_id) begin
        pending_1 <= 1'h0;
      end else begin
        pending_1 <= _GEN_1;
      end
    end else begin
      pending_1 <= _GEN_1;
    end
    if (reset) begin
      pending_2 <= 1'h0;
    end else if (_T_108) begin
      if (3'h2 == Max_id) begin
        pending_2 <= 1'h0;
      end else begin
        pending_2 <= _GEN_3;
      end
    end else begin
      pending_2 <= _GEN_3;
    end
    if (reset) begin
      pending_3 <= 1'h0;
    end else if (_T_108) begin
      if (3'h3 == Max_id) begin
        pending_3 <= 1'h0;
      end else begin
        pending_3 <= _GEN_5;
      end
    end else begin
      pending_3 <= _GEN_5;
    end
    if (reset) begin
      pending_4 <= 1'h0;
    end else if (_T_108) begin
      if (3'h4 == Max_id) begin
        pending_4 <= 1'h0;
      end else begin
        pending_4 <= _GEN_7;
      end
    end else begin
      pending_4 <= _GEN_7;
    end
    if (reset) begin
      pending_5 <= 1'h0;
    end else if (_T_108) begin
      if (3'h5 == Max_id) begin
        pending_5 <= 1'h0;
      end else begin
        pending_5 <= _GEN_9;
      end
    end else begin
      pending_5 <= _GEN_9;
    end
    if (reset) begin
      pending_6 <= 1'h0;
    end else if (_T_108) begin
      if (3'h6 == Max_id) begin
        pending_6 <= 1'h0;
      end else begin
        pending_6 <= _GEN_11;
      end
    end else begin
      pending_6 <= _GEN_11;
    end
    gate_1 <= reset | _GEN_42;
    gate_2 <= reset | _GEN_43;
    gate_3 <= reset | _GEN_44;
    gate_4 <= reset | _GEN_45;
    gate_5 <= reset | _GEN_46;
    gate_6 <= reset | _GEN_47;
    if (reset) begin
      Max_pri <= 3'h0;
    end else begin
      Max_pri <= pri_max[2:0];
    end
    if (reset) begin
      Max_id <= 3'h0;
    end else begin
      Max_id <= pri_max[5:3];
    end
  end
endmodule
module myc01_core(
  input         clock,
  input         reset,
  output        io_inst_req,
  output [63:0] io_inst_addr,
  input  [63:0] io_inst_rdata,
  input         io_inst_data_ok,
  output        io_icache_invalid,
  output        io_data_req,
  output        io_data_we,
  output [7:0]  io_data_wstrb,
  output [63:0] io_data_addr,
  output [63:0] io_data_wdata,
  input  [63:0] io_data_rdata,
  input         io_data_data_ok,
  input         io_int_i_1,
  input         io_int_i_2,
  input         io_int_i_3,
  input         io_int_i_4,
  input         io_int_i_5,
  input         io_int_i_6
);
  wire  if_stage_clock; // @[myc01_core.scala 48:32]
  wire  if_stage_reset; // @[myc01_core.scala 48:32]
  wire [63:0] if_stage_io_pc; // @[myc01_core.scala 48:32]
  wire [31:0] if_stage_io_inst_o; // @[myc01_core.scala 48:32]
  wire [1:0] if_stage_io_BTB_hit_o; // @[myc01_core.scala 48:32]
  wire  if_stage_io_BTB_false_o; // @[myc01_core.scala 48:32]
  wire [63:0] if_stage_io_jump_addr; // @[myc01_core.scala 48:32]
  wire  if_stage_io_jump_flag; // @[myc01_core.scala 48:32]
  wire  if_stage_io_jump_inst; // @[myc01_core.scala 48:32]
  wire [63:0] if_stage_io_id_pc; // @[myc01_core.scala 48:32]
  wire [1:0] if_stage_io_id_BTB_hit; // @[myc01_core.scala 48:32]
  wire  if_stage_io_inst_req; // @[myc01_core.scala 48:32]
  wire [63:0] if_stage_io_iaddr; // @[myc01_core.scala 48:32]
  wire [63:0] if_stage_io_inst_rdata; // @[myc01_core.scala 48:32]
  wire  if_stage_io_inst_data_ok; // @[myc01_core.scala 48:32]
  wire  if_stage_io_icache_invalid; // @[myc01_core.scala 48:32]
  wire [4:0] if_stage_io_stall; // @[myc01_core.scala 48:32]
  wire  if_stage_io_flush; // @[myc01_core.scala 48:32]
  wire [63:0] if_stage_io_excaddr; // @[myc01_core.scala 48:32]
  wire  ifid_reg_clock; // @[myc01_core.scala 49:32]
  wire  ifid_reg_reset; // @[myc01_core.scala 49:32]
  wire [63:0] ifid_reg_io_if_pc; // @[myc01_core.scala 49:32]
  wire  ifid_reg_io_if_BTB_false; // @[myc01_core.scala 49:32]
  wire [1:0] ifid_reg_io_if_BTB_hit; // @[myc01_core.scala 49:32]
  wire [31:0] ifid_reg_io_if_inst; // @[myc01_core.scala 49:32]
  wire [63:0] ifid_reg_io_id_pc; // @[myc01_core.scala 49:32]
  wire [31:0] ifid_reg_io_id_inst; // @[myc01_core.scala 49:32]
  wire  ifid_reg_io_id_BTB_false; // @[myc01_core.scala 49:32]
  wire [1:0] ifid_reg_io_id_BTB_hit; // @[myc01_core.scala 49:32]
  wire [4:0] ifid_reg_io_stall; // @[myc01_core.scala 49:32]
  wire  ifid_reg_io_flush; // @[myc01_core.scala 49:32]
  wire [63:0] id_stage_io_id_pc_i; // @[myc01_core.scala 50:32]
  wire  id_stage_io_BTB_false_i; // @[myc01_core.scala 50:32]
  wire [31:0] id_stage_io_id_inst_i; // @[myc01_core.scala 50:32]
  wire  id_stage_io_rreg1; // @[myc01_core.scala 50:32]
  wire [4:0] id_stage_io_ra1; // @[myc01_core.scala 50:32]
  wire  id_stage_io_rreg2; // @[myc01_core.scala 50:32]
  wire [4:0] id_stage_io_ra2; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_rd1; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_rd2; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_id_pc_o; // @[myc01_core.scala 50:32]
  wire [2:0] id_stage_io_id_alutype_o; // @[myc01_core.scala 50:32]
  wire [7:0] id_stage_io_id_aluop_o; // @[myc01_core.scala 50:32]
  wire [4:0] id_stage_io_id_wa_o; // @[myc01_core.scala 50:32]
  wire  id_stage_io_id_wreg_o; // @[myc01_core.scala 50:32]
  wire  id_stage_io_id_mreg_o; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_id_din_o; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_id_src1_o; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_id_src2_o; // @[myc01_core.scala 50:32]
  wire  id_stage_io_exe2id_wreg; // @[myc01_core.scala 50:32]
  wire [4:0] id_stage_io_exe2id_wa; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_exe2id_wd; // @[myc01_core.scala 50:32]
  wire  id_stage_io_mem2id_wreg; // @[myc01_core.scala 50:32]
  wire [4:0] id_stage_io_mem2id_wa; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_mem2id_wd; // @[myc01_core.scala 50:32]
  wire  id_stage_io_exe2id_mreg; // @[myc01_core.scala 50:32]
  wire  id_stage_io_mem2id_mreg; // @[myc01_core.scala 50:32]
  wire [63:0] id_stage_io_jump_addr; // @[myc01_core.scala 50:32]
  wire  id_stage_io_jump_flag; // @[myc01_core.scala 50:32]
  wire  id_stage_io_jump_inst; // @[myc01_core.scala 50:32]
  wire  id_stage_io_stallreq_id; // @[myc01_core.scala 50:32]
  wire [1:0] id_stage_io_BTB_hit_i; // @[myc01_core.scala 50:32]
  wire [1:0] id_stage_io_BTB_hit_o; // @[myc01_core.scala 50:32]
  wire [11:0] id_stage_io_csr_addr_o; // @[myc01_core.scala 50:32]
  wire [4:0] id_stage_io_id_exccode_o; // @[myc01_core.scala 50:32]
  wire  id_stage_io_flush; // @[myc01_core.scala 50:32]
  wire  idexe_reg_clock; // @[myc01_core.scala 51:32]
  wire  idexe_reg_reset; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_id_pc; // @[myc01_core.scala 51:32]
  wire [2:0] idexe_reg_io_id_alutype; // @[myc01_core.scala 51:32]
  wire [7:0] idexe_reg_io_id_aluop; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_id_src1; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_id_src2; // @[myc01_core.scala 51:32]
  wire [4:0] idexe_reg_io_id_wa; // @[myc01_core.scala 51:32]
  wire  idexe_reg_io_id_wreg; // @[myc01_core.scala 51:32]
  wire  idexe_reg_io_id_mreg; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_id_din; // @[myc01_core.scala 51:32]
  wire [11:0] idexe_reg_io_id_csr_addr; // @[myc01_core.scala 51:32]
  wire [4:0] idexe_reg_io_id_exccode; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_id_jump_addr; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_exe_pc; // @[myc01_core.scala 51:32]
  wire [2:0] idexe_reg_io_exe_alutype; // @[myc01_core.scala 51:32]
  wire [7:0] idexe_reg_io_exe_aluop; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_exe_src1; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_exe_src2; // @[myc01_core.scala 51:32]
  wire [4:0] idexe_reg_io_exe_wa; // @[myc01_core.scala 51:32]
  wire  idexe_reg_io_exe_wreg; // @[myc01_core.scala 51:32]
  wire  idexe_reg_io_exe_mreg; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_exe_din; // @[myc01_core.scala 51:32]
  wire [11:0] idexe_reg_io_exe_csr_addr; // @[myc01_core.scala 51:32]
  wire [4:0] idexe_reg_io_exe_exccode; // @[myc01_core.scala 51:32]
  wire [63:0] idexe_reg_io_exe_jump_addr; // @[myc01_core.scala 51:32]
  wire [4:0] idexe_reg_io_stall; // @[myc01_core.scala 51:32]
  wire  idexe_reg_io_flush; // @[myc01_core.scala 51:32]
  wire  exe_stage_clock; // @[myc01_core.scala 52:32]
  wire  exe_stage_reset; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_pc_i; // @[myc01_core.scala 52:32]
  wire [2:0] exe_stage_io_exe_alutype_i; // @[myc01_core.scala 52:32]
  wire [7:0] exe_stage_io_exe_aluop_i; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_src1_i; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_src2_i; // @[myc01_core.scala 52:32]
  wire [4:0] exe_stage_io_exe_wa_i; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_exe_wreg_i; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_exe_mreg_i; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_din_i; // @[myc01_core.scala 52:32]
  wire [11:0] exe_stage_io_csr_addr_i; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_csr_rd_i; // @[myc01_core.scala 52:32]
  wire [4:0] exe_stage_io_exe_exccode_i; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_jump_addr_i; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_pc_o; // @[myc01_core.scala 52:32]
  wire [7:0] exe_stage_io_exe_aluop_o; // @[myc01_core.scala 52:32]
  wire [4:0] exe_stage_io_exe_wa_o; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_exe_wreg_o; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_wd_o; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_exe_mreg_o; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_din_o; // @[myc01_core.scala 52:32]
  wire [11:0] exe_stage_io_csr_wa_o; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_csr_wd_o; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_csr_we_o; // @[myc01_core.scala 52:32]
  wire [4:0] exe_stage_io_exe_exccode_o; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_exe_jump_addr_o; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_stallreq_exe; // @[myc01_core.scala 52:32]
  wire [11:0] exe_stage_io_csr_ra_o; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_csr_re_o; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_mem2exe_csr_we; // @[myc01_core.scala 52:32]
  wire [11:0] exe_stage_io_mem2exe_csr_wa; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_mem2exe_csr_wd; // @[myc01_core.scala 52:32]
  wire  exe_stage_io_wb2exe_csr_we; // @[myc01_core.scala 52:32]
  wire [11:0] exe_stage_io_wb2exe_csr_wa; // @[myc01_core.scala 52:32]
  wire [63:0] exe_stage_io_wb2exe_csr_wd; // @[myc01_core.scala 52:32]
  wire  exemem_reg_clock; // @[myc01_core.scala 53:32]
  wire  exemem_reg_reset; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_exe_pc; // @[myc01_core.scala 53:32]
  wire [7:0] exemem_reg_io_exe_aluop; // @[myc01_core.scala 53:32]
  wire [4:0] exemem_reg_io_exe_wa; // @[myc01_core.scala 53:32]
  wire  exemem_reg_io_exe_wreg; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_exe_wd; // @[myc01_core.scala 53:32]
  wire  exemem_reg_io_exe_mreg; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_exe_din; // @[myc01_core.scala 53:32]
  wire  exemem_reg_io_exe_csr_we; // @[myc01_core.scala 53:32]
  wire [11:0] exemem_reg_io_exe_csr_wa; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_exe_csr_wd; // @[myc01_core.scala 53:32]
  wire [4:0] exemem_reg_io_exe_exccode; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_exe_jump_addr; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_mem_pc; // @[myc01_core.scala 53:32]
  wire [7:0] exemem_reg_io_mem_aluop; // @[myc01_core.scala 53:32]
  wire [4:0] exemem_reg_io_mem_wa; // @[myc01_core.scala 53:32]
  wire  exemem_reg_io_mem_wreg; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_mem_wd; // @[myc01_core.scala 53:32]
  wire  exemem_reg_io_mem_mreg; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_mem_din; // @[myc01_core.scala 53:32]
  wire  exemem_reg_io_mem_csr_we; // @[myc01_core.scala 53:32]
  wire [11:0] exemem_reg_io_mem_csr_wa; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_mem_csr_wd; // @[myc01_core.scala 53:32]
  wire [4:0] exemem_reg_io_mem_exccode; // @[myc01_core.scala 53:32]
  wire [63:0] exemem_reg_io_mem_jump_addr; // @[myc01_core.scala 53:32]
  wire [4:0] exemem_reg_io_stall; // @[myc01_core.scala 53:32]
  wire  exemem_reg_io_flush; // @[myc01_core.scala 53:32]
  wire [63:0] mem_stage_io_mem_pc_i; // @[myc01_core.scala 54:32]
  wire [7:0] mem_stage_io_mem_aluop_i; // @[myc01_core.scala 54:32]
  wire [4:0] mem_stage_io_mem_wa_i; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_mem_wreg_i; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_mem_wd_i; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_mem_mreg_i; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_mem_din_i; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_csr_we_i; // @[myc01_core.scala 54:32]
  wire [11:0] mem_stage_io_csr_wa_i; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_csr_wd_i; // @[myc01_core.scala 54:32]
  wire [4:0] mem_stage_io_mem_exccode_i; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_jump_addr_i; // @[myc01_core.scala 54:32]
  wire [4:0] mem_stage_io_mem_wa_o; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_mem_wreg_o; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_mem_dreg_o; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_mem_mreg_o; // @[myc01_core.scala 54:32]
  wire [7:0] mem_stage_io_dre; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_load_unsign; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_csr_we_o; // @[myc01_core.scala 54:32]
  wire [11:0] mem_stage_io_csr_wa_o; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_csr_wd_o; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_mem_dm; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_mem_big_endian; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_data_req; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_daddr; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_data_we; // @[myc01_core.scala 54:32]
  wire [7:0] mem_stage_io_dwstrb; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_din; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_data_rdata; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_data_data_ok; // @[myc01_core.scala 54:32]
  wire [4:0] mem_stage_io_exccode_o; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_pc_o; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_jump_addr_o; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_stallreq_mem; // @[myc01_core.scala 54:32]
  wire [63:0] mem_stage_io_data_plic; // @[myc01_core.scala 54:32]
  wire  mem_stage_io_dce; // @[myc01_core.scala 54:32]
  wire  memwb_reg_clock; // @[myc01_core.scala 55:32]
  wire  memwb_reg_reset; // @[myc01_core.scala 55:32]
  wire [4:0] memwb_reg_io_mem_wa; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_mem_wreg; // @[myc01_core.scala 55:32]
  wire [63:0] memwb_reg_io_mem_dreg; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_mem_mreg; // @[myc01_core.scala 55:32]
  wire [7:0] memwb_reg_io_mem_dre; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_mem_load_unsign; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_mem_csr_we; // @[myc01_core.scala 55:32]
  wire [11:0] memwb_reg_io_mem_csr_wa; // @[myc01_core.scala 55:32]
  wire [63:0] memwb_reg_io_mem_csr_wd; // @[myc01_core.scala 55:32]
  wire [63:0] memwb_reg_io_mem_dm; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_mem_big_endian; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_flush; // @[myc01_core.scala 55:32]
  wire [4:0] memwb_reg_io_stall; // @[myc01_core.scala 55:32]
  wire [4:0] memwb_reg_io_wb_wa; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_wb_wreg; // @[myc01_core.scala 55:32]
  wire [63:0] memwb_reg_io_wb_dreg; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_wb_mreg; // @[myc01_core.scala 55:32]
  wire [7:0] memwb_reg_io_wb_dre; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_wb_load_unsign; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_wb_csr_we; // @[myc01_core.scala 55:32]
  wire [11:0] memwb_reg_io_wb_csr_wa; // @[myc01_core.scala 55:32]
  wire [63:0] memwb_reg_io_wb_csr_wd; // @[myc01_core.scala 55:32]
  wire [63:0] memwb_reg_io_wb_dm; // @[myc01_core.scala 55:32]
  wire  memwb_reg_io_wb_big_endian; // @[myc01_core.scala 55:32]
  wire [4:0] wb_stage_io_wb_wa_i; // @[myc01_core.scala 56:32]
  wire  wb_stage_io_wb_wreg_i; // @[myc01_core.scala 56:32]
  wire [63:0] wb_stage_io_wb_dreg_i; // @[myc01_core.scala 56:32]
  wire  wb_stage_io_wb_mreg_i; // @[myc01_core.scala 56:32]
  wire [7:0] wb_stage_io_wb_dre_i; // @[myc01_core.scala 56:32]
  wire  wb_stage_io_wb_load_unsign; // @[myc01_core.scala 56:32]
  wire  wb_stage_io_csr_we_i; // @[myc01_core.scala 56:32]
  wire [11:0] wb_stage_io_csr_wa_i; // @[myc01_core.scala 56:32]
  wire [63:0] wb_stage_io_csr_wd_i; // @[myc01_core.scala 56:32]
  wire  wb_stage_io_wb_big_endian; // @[myc01_core.scala 56:32]
  wire [63:0] wb_stage_io_dm; // @[myc01_core.scala 56:32]
  wire [4:0] wb_stage_io_wb_wa_o; // @[myc01_core.scala 56:32]
  wire  wb_stage_io_wb_wreg_o; // @[myc01_core.scala 56:32]
  wire [63:0] wb_stage_io_wb_wd_o; // @[myc01_core.scala 56:32]
  wire  wb_stage_io_csr_we_o; // @[myc01_core.scala 56:32]
  wire [11:0] wb_stage_io_csr_wa_o; // @[myc01_core.scala 56:32]
  wire [63:0] wb_stage_io_csr_wd_o; // @[myc01_core.scala 56:32]
  wire  regfile_clock; // @[myc01_core.scala 57:32]
  wire  regfile_reset; // @[myc01_core.scala 57:32]
  wire [4:0] regfile_io_wa; // @[myc01_core.scala 57:32]
  wire [63:0] regfile_io_wd; // @[myc01_core.scala 57:32]
  wire  regfile_io_we; // @[myc01_core.scala 57:32]
  wire [4:0] regfile_io_ra1; // @[myc01_core.scala 57:32]
  wire [4:0] regfile_io_ra2; // @[myc01_core.scala 57:32]
  wire  regfile_io_re1; // @[myc01_core.scala 57:32]
  wire  regfile_io_re2; // @[myc01_core.scala 57:32]
  wire [63:0] regfile_io_rd1; // @[myc01_core.scala 57:32]
  wire [63:0] regfile_io_rd2; // @[myc01_core.scala 57:32]
  wire  stall_ctrl_io_stallreq_id; // @[myc01_core.scala 58:32]
  wire  stall_ctrl_io_stallreq_exe; // @[myc01_core.scala 58:32]
  wire  stall_ctrl_io_stallreq_mem; // @[myc01_core.scala 58:32]
  wire [4:0] stall_ctrl_io_stall; // @[myc01_core.scala 58:32]
  wire  excp_clock; // @[myc01_core.scala 59:32]
  wire  excp_reset; // @[myc01_core.scala 59:32]
  wire  excp_io_we_i; // @[myc01_core.scala 59:32]
  wire [11:0] excp_io_wa_i; // @[myc01_core.scala 59:32]
  wire [63:0] excp_io_wd_i; // @[myc01_core.scala 59:32]
  wire  excp_io_re_i; // @[myc01_core.scala 59:32]
  wire [11:0] excp_io_ra_i; // @[myc01_core.scala 59:32]
  wire [63:0] excp_io_rd_o; // @[myc01_core.scala 59:32]
  wire [4:0] excp_io_exccode_i; // @[myc01_core.scala 59:32]
  wire [63:0] excp_io_pc_i; // @[myc01_core.scala 59:32]
  wire [63:0] excp_io_jump_addr_i; // @[myc01_core.scala 59:32]
  wire  excp_io_flush; // @[myc01_core.scala 59:32]
  wire [63:0] excp_io_excaddr; // @[myc01_core.scala 59:32]
  wire  excp_io_mtime_int_i; // @[myc01_core.scala 59:32]
  wire  excp_io_msoft_int_i; // @[myc01_core.scala 59:32]
  wire  excp_io_mext_int_i; // @[myc01_core.scala 59:32]
  wire  clint_clock; // @[myc01_core.scala 60:28]
  wire  clint_reset; // @[myc01_core.scala 60:28]
  wire  clint_io_we; // @[myc01_core.scala 60:28]
  wire [63:0] clint_io_addr; // @[myc01_core.scala 60:28]
  wire [63:0] clint_io_wd; // @[myc01_core.scala 60:28]
  wire  clint_io_software_int; // @[myc01_core.scala 60:28]
  wire  clint_io_timer_int; // @[myc01_core.scala 60:28]
  wire  plic_clock; // @[myc01_core.scala 61:32]
  wire  plic_reset; // @[myc01_core.scala 61:32]
  wire  plic_io_int_i_1; // @[myc01_core.scala 61:32]
  wire  plic_io_int_i_2; // @[myc01_core.scala 61:32]
  wire  plic_io_int_i_3; // @[myc01_core.scala 61:32]
  wire  plic_io_int_i_4; // @[myc01_core.scala 61:32]
  wire  plic_io_int_i_5; // @[myc01_core.scala 61:32]
  wire  plic_io_int_i_6; // @[myc01_core.scala 61:32]
  wire  plic_io_excint; // @[myc01_core.scala 61:32]
  wire  plic_io_re; // @[myc01_core.scala 61:32]
  wire [63:0] plic_io_rdata; // @[myc01_core.scala 61:32]
  wire  plic_io_we; // @[myc01_core.scala 61:32]
  wire [2:0] plic_io_wdata; // @[myc01_core.scala 61:32]
  wire [63:0] plic_io_addr; // @[myc01_core.scala 61:32]
  if_stage if_stage ( // @[myc01_core.scala 48:32]
    .clock(if_stage_clock),
    .reset(if_stage_reset),
    .io_pc(if_stage_io_pc),
    .io_inst_o(if_stage_io_inst_o),
    .io_BTB_hit_o(if_stage_io_BTB_hit_o),
    .io_BTB_false_o(if_stage_io_BTB_false_o),
    .io_jump_addr(if_stage_io_jump_addr),
    .io_jump_flag(if_stage_io_jump_flag),
    .io_jump_inst(if_stage_io_jump_inst),
    .io_id_pc(if_stage_io_id_pc),
    .io_id_BTB_hit(if_stage_io_id_BTB_hit),
    .io_inst_req(if_stage_io_inst_req),
    .io_iaddr(if_stage_io_iaddr),
    .io_inst_rdata(if_stage_io_inst_rdata),
    .io_inst_data_ok(if_stage_io_inst_data_ok),
    .io_icache_invalid(if_stage_io_icache_invalid),
    .io_stall(if_stage_io_stall),
    .io_flush(if_stage_io_flush),
    .io_excaddr(if_stage_io_excaddr)
  );
  ifid_reg ifid_reg ( // @[myc01_core.scala 49:32]
    .clock(ifid_reg_clock),
    .reset(ifid_reg_reset),
    .io_if_pc(ifid_reg_io_if_pc),
    .io_if_BTB_false(ifid_reg_io_if_BTB_false),
    .io_if_BTB_hit(ifid_reg_io_if_BTB_hit),
    .io_if_inst(ifid_reg_io_if_inst),
    .io_id_pc(ifid_reg_io_id_pc),
    .io_id_inst(ifid_reg_io_id_inst),
    .io_id_BTB_false(ifid_reg_io_id_BTB_false),
    .io_id_BTB_hit(ifid_reg_io_id_BTB_hit),
    .io_stall(ifid_reg_io_stall),
    .io_flush(ifid_reg_io_flush)
  );
  id_stage id_stage ( // @[myc01_core.scala 50:32]
    .io_id_pc_i(id_stage_io_id_pc_i),
    .io_BTB_false_i(id_stage_io_BTB_false_i),
    .io_id_inst_i(id_stage_io_id_inst_i),
    .io_rreg1(id_stage_io_rreg1),
    .io_ra1(id_stage_io_ra1),
    .io_rreg2(id_stage_io_rreg2),
    .io_ra2(id_stage_io_ra2),
    .io_rd1(id_stage_io_rd1),
    .io_rd2(id_stage_io_rd2),
    .io_id_pc_o(id_stage_io_id_pc_o),
    .io_id_alutype_o(id_stage_io_id_alutype_o),
    .io_id_aluop_o(id_stage_io_id_aluop_o),
    .io_id_wa_o(id_stage_io_id_wa_o),
    .io_id_wreg_o(id_stage_io_id_wreg_o),
    .io_id_mreg_o(id_stage_io_id_mreg_o),
    .io_id_din_o(id_stage_io_id_din_o),
    .io_id_src1_o(id_stage_io_id_src1_o),
    .io_id_src2_o(id_stage_io_id_src2_o),
    .io_exe2id_wreg(id_stage_io_exe2id_wreg),
    .io_exe2id_wa(id_stage_io_exe2id_wa),
    .io_exe2id_wd(id_stage_io_exe2id_wd),
    .io_mem2id_wreg(id_stage_io_mem2id_wreg),
    .io_mem2id_wa(id_stage_io_mem2id_wa),
    .io_mem2id_wd(id_stage_io_mem2id_wd),
    .io_exe2id_mreg(id_stage_io_exe2id_mreg),
    .io_mem2id_mreg(id_stage_io_mem2id_mreg),
    .io_jump_addr(id_stage_io_jump_addr),
    .io_jump_flag(id_stage_io_jump_flag),
    .io_jump_inst(id_stage_io_jump_inst),
    .io_stallreq_id(id_stage_io_stallreq_id),
    .io_BTB_hit_i(id_stage_io_BTB_hit_i),
    .io_BTB_hit_o(id_stage_io_BTB_hit_o),
    .io_csr_addr_o(id_stage_io_csr_addr_o),
    .io_id_exccode_o(id_stage_io_id_exccode_o),
    .io_flush(id_stage_io_flush)
  );
  idexe_reg idexe_reg ( // @[myc01_core.scala 51:32]
    .clock(idexe_reg_clock),
    .reset(idexe_reg_reset),
    .io_id_pc(idexe_reg_io_id_pc),
    .io_id_alutype(idexe_reg_io_id_alutype),
    .io_id_aluop(idexe_reg_io_id_aluop),
    .io_id_src1(idexe_reg_io_id_src1),
    .io_id_src2(idexe_reg_io_id_src2),
    .io_id_wa(idexe_reg_io_id_wa),
    .io_id_wreg(idexe_reg_io_id_wreg),
    .io_id_mreg(idexe_reg_io_id_mreg),
    .io_id_din(idexe_reg_io_id_din),
    .io_id_csr_addr(idexe_reg_io_id_csr_addr),
    .io_id_exccode(idexe_reg_io_id_exccode),
    .io_id_jump_addr(idexe_reg_io_id_jump_addr),
    .io_exe_pc(idexe_reg_io_exe_pc),
    .io_exe_alutype(idexe_reg_io_exe_alutype),
    .io_exe_aluop(idexe_reg_io_exe_aluop),
    .io_exe_src1(idexe_reg_io_exe_src1),
    .io_exe_src2(idexe_reg_io_exe_src2),
    .io_exe_wa(idexe_reg_io_exe_wa),
    .io_exe_wreg(idexe_reg_io_exe_wreg),
    .io_exe_mreg(idexe_reg_io_exe_mreg),
    .io_exe_din(idexe_reg_io_exe_din),
    .io_exe_csr_addr(idexe_reg_io_exe_csr_addr),
    .io_exe_exccode(idexe_reg_io_exe_exccode),
    .io_exe_jump_addr(idexe_reg_io_exe_jump_addr),
    .io_stall(idexe_reg_io_stall),
    .io_flush(idexe_reg_io_flush)
  );
  exe_stage exe_stage ( // @[myc01_core.scala 52:32]
    .clock(exe_stage_clock),
    .reset(exe_stage_reset),
    .io_exe_pc_i(exe_stage_io_exe_pc_i),
    .io_exe_alutype_i(exe_stage_io_exe_alutype_i),
    .io_exe_aluop_i(exe_stage_io_exe_aluop_i),
    .io_exe_src1_i(exe_stage_io_exe_src1_i),
    .io_exe_src2_i(exe_stage_io_exe_src2_i),
    .io_exe_wa_i(exe_stage_io_exe_wa_i),
    .io_exe_wreg_i(exe_stage_io_exe_wreg_i),
    .io_exe_mreg_i(exe_stage_io_exe_mreg_i),
    .io_exe_din_i(exe_stage_io_exe_din_i),
    .io_csr_addr_i(exe_stage_io_csr_addr_i),
    .io_csr_rd_i(exe_stage_io_csr_rd_i),
    .io_exe_exccode_i(exe_stage_io_exe_exccode_i),
    .io_exe_jump_addr_i(exe_stage_io_exe_jump_addr_i),
    .io_exe_pc_o(exe_stage_io_exe_pc_o),
    .io_exe_aluop_o(exe_stage_io_exe_aluop_o),
    .io_exe_wa_o(exe_stage_io_exe_wa_o),
    .io_exe_wreg_o(exe_stage_io_exe_wreg_o),
    .io_exe_wd_o(exe_stage_io_exe_wd_o),
    .io_exe_mreg_o(exe_stage_io_exe_mreg_o),
    .io_exe_din_o(exe_stage_io_exe_din_o),
    .io_csr_wa_o(exe_stage_io_csr_wa_o),
    .io_csr_wd_o(exe_stage_io_csr_wd_o),
    .io_csr_we_o(exe_stage_io_csr_we_o),
    .io_exe_exccode_o(exe_stage_io_exe_exccode_o),
    .io_exe_jump_addr_o(exe_stage_io_exe_jump_addr_o),
    .io_stallreq_exe(exe_stage_io_stallreq_exe),
    .io_csr_ra_o(exe_stage_io_csr_ra_o),
    .io_csr_re_o(exe_stage_io_csr_re_o),
    .io_mem2exe_csr_we(exe_stage_io_mem2exe_csr_we),
    .io_mem2exe_csr_wa(exe_stage_io_mem2exe_csr_wa),
    .io_mem2exe_csr_wd(exe_stage_io_mem2exe_csr_wd),
    .io_wb2exe_csr_we(exe_stage_io_wb2exe_csr_we),
    .io_wb2exe_csr_wa(exe_stage_io_wb2exe_csr_wa),
    .io_wb2exe_csr_wd(exe_stage_io_wb2exe_csr_wd)
  );
  exemem_reg exemem_reg ( // @[myc01_core.scala 53:32]
    .clock(exemem_reg_clock),
    .reset(exemem_reg_reset),
    .io_exe_pc(exemem_reg_io_exe_pc),
    .io_exe_aluop(exemem_reg_io_exe_aluop),
    .io_exe_wa(exemem_reg_io_exe_wa),
    .io_exe_wreg(exemem_reg_io_exe_wreg),
    .io_exe_wd(exemem_reg_io_exe_wd),
    .io_exe_mreg(exemem_reg_io_exe_mreg),
    .io_exe_din(exemem_reg_io_exe_din),
    .io_exe_csr_we(exemem_reg_io_exe_csr_we),
    .io_exe_csr_wa(exemem_reg_io_exe_csr_wa),
    .io_exe_csr_wd(exemem_reg_io_exe_csr_wd),
    .io_exe_exccode(exemem_reg_io_exe_exccode),
    .io_exe_jump_addr(exemem_reg_io_exe_jump_addr),
    .io_mem_pc(exemem_reg_io_mem_pc),
    .io_mem_aluop(exemem_reg_io_mem_aluop),
    .io_mem_wa(exemem_reg_io_mem_wa),
    .io_mem_wreg(exemem_reg_io_mem_wreg),
    .io_mem_wd(exemem_reg_io_mem_wd),
    .io_mem_mreg(exemem_reg_io_mem_mreg),
    .io_mem_din(exemem_reg_io_mem_din),
    .io_mem_csr_we(exemem_reg_io_mem_csr_we),
    .io_mem_csr_wa(exemem_reg_io_mem_csr_wa),
    .io_mem_csr_wd(exemem_reg_io_mem_csr_wd),
    .io_mem_exccode(exemem_reg_io_mem_exccode),
    .io_mem_jump_addr(exemem_reg_io_mem_jump_addr),
    .io_stall(exemem_reg_io_stall),
    .io_flush(exemem_reg_io_flush)
  );
  mem_stage mem_stage ( // @[myc01_core.scala 54:32]
    .io_mem_pc_i(mem_stage_io_mem_pc_i),
    .io_mem_aluop_i(mem_stage_io_mem_aluop_i),
    .io_mem_wa_i(mem_stage_io_mem_wa_i),
    .io_mem_wreg_i(mem_stage_io_mem_wreg_i),
    .io_mem_wd_i(mem_stage_io_mem_wd_i),
    .io_mem_mreg_i(mem_stage_io_mem_mreg_i),
    .io_mem_din_i(mem_stage_io_mem_din_i),
    .io_csr_we_i(mem_stage_io_csr_we_i),
    .io_csr_wa_i(mem_stage_io_csr_wa_i),
    .io_csr_wd_i(mem_stage_io_csr_wd_i),
    .io_mem_exccode_i(mem_stage_io_mem_exccode_i),
    .io_jump_addr_i(mem_stage_io_jump_addr_i),
    .io_mem_wa_o(mem_stage_io_mem_wa_o),
    .io_mem_wreg_o(mem_stage_io_mem_wreg_o),
    .io_mem_dreg_o(mem_stage_io_mem_dreg_o),
    .io_mem_mreg_o(mem_stage_io_mem_mreg_o),
    .io_dre(mem_stage_io_dre),
    .io_load_unsign(mem_stage_io_load_unsign),
    .io_csr_we_o(mem_stage_io_csr_we_o),
    .io_csr_wa_o(mem_stage_io_csr_wa_o),
    .io_csr_wd_o(mem_stage_io_csr_wd_o),
    .io_mem_dm(mem_stage_io_mem_dm),
    .io_mem_big_endian(mem_stage_io_mem_big_endian),
    .io_data_req(mem_stage_io_data_req),
    .io_daddr(mem_stage_io_daddr),
    .io_data_we(mem_stage_io_data_we),
    .io_dwstrb(mem_stage_io_dwstrb),
    .io_din(mem_stage_io_din),
    .io_data_rdata(mem_stage_io_data_rdata),
    .io_data_data_ok(mem_stage_io_data_data_ok),
    .io_exccode_o(mem_stage_io_exccode_o),
    .io_pc_o(mem_stage_io_pc_o),
    .io_jump_addr_o(mem_stage_io_jump_addr_o),
    .io_stallreq_mem(mem_stage_io_stallreq_mem),
    .io_data_plic(mem_stage_io_data_plic),
    .io_dce(mem_stage_io_dce)
  );
  memwb_reg memwb_reg ( // @[myc01_core.scala 55:32]
    .clock(memwb_reg_clock),
    .reset(memwb_reg_reset),
    .io_mem_wa(memwb_reg_io_mem_wa),
    .io_mem_wreg(memwb_reg_io_mem_wreg),
    .io_mem_dreg(memwb_reg_io_mem_dreg),
    .io_mem_mreg(memwb_reg_io_mem_mreg),
    .io_mem_dre(memwb_reg_io_mem_dre),
    .io_mem_load_unsign(memwb_reg_io_mem_load_unsign),
    .io_mem_csr_we(memwb_reg_io_mem_csr_we),
    .io_mem_csr_wa(memwb_reg_io_mem_csr_wa),
    .io_mem_csr_wd(memwb_reg_io_mem_csr_wd),
    .io_mem_dm(memwb_reg_io_mem_dm),
    .io_mem_big_endian(memwb_reg_io_mem_big_endian),
    .io_flush(memwb_reg_io_flush),
    .io_stall(memwb_reg_io_stall),
    .io_wb_wa(memwb_reg_io_wb_wa),
    .io_wb_wreg(memwb_reg_io_wb_wreg),
    .io_wb_dreg(memwb_reg_io_wb_dreg),
    .io_wb_mreg(memwb_reg_io_wb_mreg),
    .io_wb_dre(memwb_reg_io_wb_dre),
    .io_wb_load_unsign(memwb_reg_io_wb_load_unsign),
    .io_wb_csr_we(memwb_reg_io_wb_csr_we),
    .io_wb_csr_wa(memwb_reg_io_wb_csr_wa),
    .io_wb_csr_wd(memwb_reg_io_wb_csr_wd),
    .io_wb_dm(memwb_reg_io_wb_dm),
    .io_wb_big_endian(memwb_reg_io_wb_big_endian)
  );
  wb_stage wb_stage ( // @[myc01_core.scala 56:32]
    .io_wb_wa_i(wb_stage_io_wb_wa_i),
    .io_wb_wreg_i(wb_stage_io_wb_wreg_i),
    .io_wb_dreg_i(wb_stage_io_wb_dreg_i),
    .io_wb_mreg_i(wb_stage_io_wb_mreg_i),
    .io_wb_dre_i(wb_stage_io_wb_dre_i),
    .io_wb_load_unsign(wb_stage_io_wb_load_unsign),
    .io_csr_we_i(wb_stage_io_csr_we_i),
    .io_csr_wa_i(wb_stage_io_csr_wa_i),
    .io_csr_wd_i(wb_stage_io_csr_wd_i),
    .io_wb_big_endian(wb_stage_io_wb_big_endian),
    .io_dm(wb_stage_io_dm),
    .io_wb_wa_o(wb_stage_io_wb_wa_o),
    .io_wb_wreg_o(wb_stage_io_wb_wreg_o),
    .io_wb_wd_o(wb_stage_io_wb_wd_o),
    .io_csr_we_o(wb_stage_io_csr_we_o),
    .io_csr_wa_o(wb_stage_io_csr_wa_o),
    .io_csr_wd_o(wb_stage_io_csr_wd_o)
  );
  regfile regfile ( // @[myc01_core.scala 57:32]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_wa(regfile_io_wa),
    .io_wd(regfile_io_wd),
    .io_we(regfile_io_we),
    .io_ra1(regfile_io_ra1),
    .io_ra2(regfile_io_ra2),
    .io_re1(regfile_io_re1),
    .io_re2(regfile_io_re2),
    .io_rd1(regfile_io_rd1),
    .io_rd2(regfile_io_rd2)
  );
  stall_ctrl stall_ctrl ( // @[myc01_core.scala 58:32]
    .io_stallreq_id(stall_ctrl_io_stallreq_id),
    .io_stallreq_exe(stall_ctrl_io_stallreq_exe),
    .io_stallreq_mem(stall_ctrl_io_stallreq_mem),
    .io_stall(stall_ctrl_io_stall)
  );
  excp excp ( // @[myc01_core.scala 59:32]
    .clock(excp_clock),
    .reset(excp_reset),
    .io_we_i(excp_io_we_i),
    .io_wa_i(excp_io_wa_i),
    .io_wd_i(excp_io_wd_i),
    .io_re_i(excp_io_re_i),
    .io_ra_i(excp_io_ra_i),
    .io_rd_o(excp_io_rd_o),
    .io_exccode_i(excp_io_exccode_i),
    .io_pc_i(excp_io_pc_i),
    .io_jump_addr_i(excp_io_jump_addr_i),
    .io_flush(excp_io_flush),
    .io_excaddr(excp_io_excaddr),
    .io_mtime_int_i(excp_io_mtime_int_i),
    .io_msoft_int_i(excp_io_msoft_int_i),
    .io_mext_int_i(excp_io_mext_int_i)
  );
  clint clint ( // @[myc01_core.scala 60:28]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_we(clint_io_we),
    .io_addr(clint_io_addr),
    .io_wd(clint_io_wd),
    .io_software_int(clint_io_software_int),
    .io_timer_int(clint_io_timer_int)
  );
  plic plic ( // @[myc01_core.scala 61:32]
    .clock(plic_clock),
    .reset(plic_reset),
    .io_int_i_1(plic_io_int_i_1),
    .io_int_i_2(plic_io_int_i_2),
    .io_int_i_3(plic_io_int_i_3),
    .io_int_i_4(plic_io_int_i_4),
    .io_int_i_5(plic_io_int_i_5),
    .io_int_i_6(plic_io_int_i_6),
    .io_excint(plic_io_excint),
    .io_re(plic_io_re),
    .io_rdata(plic_io_rdata),
    .io_we(plic_io_we),
    .io_wdata(plic_io_wdata),
    .io_addr(plic_io_addr)
  );
  assign io_inst_req = if_stage_io_inst_req; // @[myc01_core.scala 245:27]
  assign io_inst_addr = if_stage_io_iaddr; // @[myc01_core.scala 246:27]
  assign io_icache_invalid = if_stage_io_icache_invalid; // @[myc01_core.scala 252:27]
  assign io_data_req = mem_stage_io_data_req; // @[myc01_core.scala 255:27]
  assign io_data_we = mem_stage_io_data_we; // @[myc01_core.scala 256:27]
  assign io_data_wstrb = mem_stage_io_dwstrb; // @[myc01_core.scala 257:27]
  assign io_data_addr = mem_stage_io_daddr; // @[myc01_core.scala 258:27]
  assign io_data_wdata = mem_stage_io_din; // @[myc01_core.scala 259:27]
  assign if_stage_clock = clock;
  assign if_stage_reset = reset;
  assign if_stage_io_jump_addr = id_stage_io_jump_addr; // @[myc01_core.scala 86:29]
  assign if_stage_io_jump_flag = id_stage_io_jump_flag; // @[myc01_core.scala 87:33]
  assign if_stage_io_jump_inst = id_stage_io_jump_inst; // @[myc01_core.scala 88:33]
  assign if_stage_io_id_pc = id_stage_io_id_pc_o; // @[myc01_core.scala 84:29]
  assign if_stage_io_id_BTB_hit = id_stage_io_BTB_hit_o; // @[myc01_core.scala 85:33]
  assign if_stage_io_inst_rdata = io_inst_rdata; // @[myc01_core.scala 247:27]
  assign if_stage_io_inst_data_ok = io_inst_data_ok; // @[myc01_core.scala 248:27]
  assign if_stage_io_stall = stall_ctrl_io_stall; // @[myc01_core.scala 209:36]
  assign if_stage_io_flush = excp_io_flush; // @[myc01_core.scala 220:29]
  assign if_stage_io_excaddr = excp_io_excaddr; // @[myc01_core.scala 219:29]
  assign ifid_reg_clock = clock;
  assign ifid_reg_reset = reset;
  assign ifid_reg_io_if_pc = if_stage_io_pc; // @[myc01_core.scala 64:34]
  assign ifid_reg_io_if_BTB_false = if_stage_io_BTB_false_o; // @[myc01_core.scala 66:34]
  assign ifid_reg_io_if_BTB_hit = if_stage_io_BTB_hit_o; // @[myc01_core.scala 65:34]
  assign ifid_reg_io_if_inst = if_stage_io_inst_o; // @[myc01_core.scala 67:34]
  assign ifid_reg_io_stall = stall_ctrl_io_stall; // @[myc01_core.scala 210:36]
  assign ifid_reg_io_flush = excp_io_flush; // @[myc01_core.scala 221:29]
  assign id_stage_io_id_pc_i = ifid_reg_io_id_pc; // @[myc01_core.scala 70:29]
  assign id_stage_io_BTB_false_i = ifid_reg_io_id_BTB_false; // @[myc01_core.scala 72:33]
  assign id_stage_io_id_inst_i = ifid_reg_io_id_inst; // @[myc01_core.scala 71:33]
  assign id_stage_io_rd1 = regfile_io_rd1; // @[myc01_core.scala 109:25]
  assign id_stage_io_rd2 = regfile_io_rd2; // @[myc01_core.scala 110:25]
  assign id_stage_io_exe2id_wreg = exe_stage_io_exe_wreg_o; // @[myc01_core.scala 76:30]
  assign id_stage_io_exe2id_wa = exe_stage_io_exe_wa_o; // @[myc01_core.scala 77:34]
  assign id_stage_io_exe2id_wd = exe_stage_io_exe_wd_o; // @[myc01_core.scala 78:34]
  assign id_stage_io_mem2id_wreg = mem_stage_io_mem_wreg_o; // @[myc01_core.scala 79:34]
  assign id_stage_io_mem2id_wa = mem_stage_io_mem_wa_o; // @[myc01_core.scala 80:34]
  assign id_stage_io_mem2id_wd = mem_stage_io_mem_dreg_o; // @[myc01_core.scala 81:34]
  assign id_stage_io_exe2id_mreg = exe_stage_io_exe_mreg_o; // @[myc01_core.scala 207:36]
  assign id_stage_io_mem2id_mreg = mem_stage_io_mem_mreg_o; // @[myc01_core.scala 208:36]
  assign id_stage_io_BTB_hit_i = ifid_reg_io_id_BTB_hit; // @[myc01_core.scala 73:29]
  assign id_stage_io_flush = excp_io_flush; // @[myc01_core.scala 222:29]
  assign idexe_reg_clock = clock;
  assign idexe_reg_reset = reset;
  assign idexe_reg_io_id_pc = id_stage_io_id_pc_o; // @[myc01_core.scala 91:33]
  assign idexe_reg_io_id_alutype = id_stage_io_id_alutype_o; // @[myc01_core.scala 92:33]
  assign idexe_reg_io_id_aluop = id_stage_io_id_aluop_o; // @[myc01_core.scala 93:33]
  assign idexe_reg_io_id_src1 = id_stage_io_id_src1_o; // @[myc01_core.scala 94:33]
  assign idexe_reg_io_id_src2 = id_stage_io_id_src2_o; // @[myc01_core.scala 95:33]
  assign idexe_reg_io_id_wa = id_stage_io_id_wa_o; // @[myc01_core.scala 96:33]
  assign idexe_reg_io_id_wreg = id_stage_io_id_wreg_o; // @[myc01_core.scala 97:33]
  assign idexe_reg_io_id_mreg = id_stage_io_id_mreg_o; // @[myc01_core.scala 98:37]
  assign idexe_reg_io_id_din = id_stage_io_id_din_o; // @[myc01_core.scala 99:37]
  assign idexe_reg_io_id_csr_addr = id_stage_io_csr_addr_o; // @[myc01_core.scala 101:37]
  assign idexe_reg_io_id_exccode = id_stage_io_id_exccode_o; // @[myc01_core.scala 102:37]
  assign idexe_reg_io_id_jump_addr = id_stage_io_jump_addr; // @[myc01_core.scala 100:37]
  assign idexe_reg_io_stall = stall_ctrl_io_stall; // @[myc01_core.scala 211:36]
  assign idexe_reg_io_flush = excp_io_flush; // @[myc01_core.scala 223:29]
  assign exe_stage_clock = clock;
  assign exe_stage_reset = reset;
  assign exe_stage_io_exe_pc_i = idexe_reg_io_exe_pc; // @[myc01_core.scala 113:34]
  assign exe_stage_io_exe_alutype_i = idexe_reg_io_exe_alutype; // @[myc01_core.scala 114:34]
  assign exe_stage_io_exe_aluop_i = idexe_reg_io_exe_aluop; // @[myc01_core.scala 115:34]
  assign exe_stage_io_exe_src1_i = idexe_reg_io_exe_src1; // @[myc01_core.scala 116:34]
  assign exe_stage_io_exe_src2_i = idexe_reg_io_exe_src2; // @[myc01_core.scala 117:34]
  assign exe_stage_io_exe_wa_i = idexe_reg_io_exe_wa; // @[myc01_core.scala 118:34]
  assign exe_stage_io_exe_wreg_i = idexe_reg_io_exe_wreg; // @[myc01_core.scala 119:34]
  assign exe_stage_io_exe_mreg_i = idexe_reg_io_exe_mreg; // @[myc01_core.scala 120:38]
  assign exe_stage_io_exe_din_i = idexe_reg_io_exe_din; // @[myc01_core.scala 121:38]
  assign exe_stage_io_csr_addr_i = idexe_reg_io_exe_csr_addr; // @[myc01_core.scala 122:38]
  assign exe_stage_io_csr_rd_i = excp_io_rd_o; // @[myc01_core.scala 129:23]
  assign exe_stage_io_exe_exccode_i = idexe_reg_io_exe_exccode; // @[myc01_core.scala 123:38]
  assign exe_stage_io_exe_jump_addr_i = idexe_reg_io_exe_jump_addr; // @[myc01_core.scala 124:38]
  assign exe_stage_io_mem2exe_csr_we = mem_stage_io_csr_we_o; // @[myc01_core.scala 132:37]
  assign exe_stage_io_mem2exe_csr_wa = mem_stage_io_csr_wa_o; // @[myc01_core.scala 133:37]
  assign exe_stage_io_mem2exe_csr_wd = mem_stage_io_csr_wd_o; // @[myc01_core.scala 134:37]
  assign exe_stage_io_wb2exe_csr_we = wb_stage_io_csr_we_o; // @[myc01_core.scala 135:37]
  assign exe_stage_io_wb2exe_csr_wa = wb_stage_io_csr_wa_o; // @[myc01_core.scala 136:37]
  assign exe_stage_io_wb2exe_csr_wd = wb_stage_io_csr_wd_o; // @[myc01_core.scala 137:37]
  assign exemem_reg_clock = clock;
  assign exemem_reg_reset = reset;
  assign exemem_reg_io_exe_pc = exe_stage_io_exe_pc_o; // @[myc01_core.scala 140:36]
  assign exemem_reg_io_exe_aluop = exe_stage_io_exe_aluop_o; // @[myc01_core.scala 141:32]
  assign exemem_reg_io_exe_wa = exe_stage_io_exe_wa_o; // @[myc01_core.scala 142:36]
  assign exemem_reg_io_exe_wreg = exe_stage_io_exe_wreg_o; // @[myc01_core.scala 143:32]
  assign exemem_reg_io_exe_wd = exe_stage_io_exe_wd_o; // @[myc01_core.scala 144:32]
  assign exemem_reg_io_exe_mreg = exe_stage_io_exe_mreg_o; // @[myc01_core.scala 145:32]
  assign exemem_reg_io_exe_din = exe_stage_io_exe_din_o; // @[myc01_core.scala 146:36]
  assign exemem_reg_io_exe_csr_we = exe_stage_io_csr_we_o; // @[myc01_core.scala 149:36]
  assign exemem_reg_io_exe_csr_wa = exe_stage_io_csr_wa_o; // @[myc01_core.scala 147:36]
  assign exemem_reg_io_exe_csr_wd = exe_stage_io_csr_wd_o; // @[myc01_core.scala 148:36]
  assign exemem_reg_io_exe_exccode = exe_stage_io_exe_exccode_o; // @[myc01_core.scala 150:36]
  assign exemem_reg_io_exe_jump_addr = exe_stage_io_exe_jump_addr_o; // @[myc01_core.scala 151:36]
  assign exemem_reg_io_stall = stall_ctrl_io_stall; // @[myc01_core.scala 212:36]
  assign exemem_reg_io_flush = excp_io_flush; // @[myc01_core.scala 224:29]
  assign mem_stage_io_mem_pc_i = exemem_reg_io_mem_pc; // @[myc01_core.scala 154:36]
  assign mem_stage_io_mem_aluop_i = exemem_reg_io_mem_aluop; // @[myc01_core.scala 155:36]
  assign mem_stage_io_mem_wa_i = exemem_reg_io_mem_wa; // @[myc01_core.scala 156:36]
  assign mem_stage_io_mem_wreg_i = exemem_reg_io_mem_wreg; // @[myc01_core.scala 157:36]
  assign mem_stage_io_mem_wd_i = exemem_reg_io_mem_wd; // @[myc01_core.scala 158:36]
  assign mem_stage_io_mem_mreg_i = exemem_reg_io_mem_mreg; // @[myc01_core.scala 159:36]
  assign mem_stage_io_mem_din_i = exemem_reg_io_mem_din; // @[myc01_core.scala 160:36]
  assign mem_stage_io_csr_we_i = exemem_reg_io_mem_csr_we; // @[myc01_core.scala 161:36]
  assign mem_stage_io_csr_wa_i = exemem_reg_io_mem_csr_wa; // @[myc01_core.scala 162:36]
  assign mem_stage_io_csr_wd_i = exemem_reg_io_mem_csr_wd; // @[myc01_core.scala 163:36]
  assign mem_stage_io_mem_exccode_i = exemem_reg_io_mem_exccode; // @[myc01_core.scala 164:36]
  assign mem_stage_io_jump_addr_i = exemem_reg_io_mem_jump_addr; // @[myc01_core.scala 165:36]
  assign mem_stage_io_data_rdata = io_data_rdata; // @[myc01_core.scala 260:27]
  assign mem_stage_io_data_data_ok = io_data_data_ok; // @[myc01_core.scala 261:27]
  assign mem_stage_io_data_plic = plic_io_rdata; // @[myc01_core.scala 237:23]
  assign memwb_reg_clock = clock;
  assign memwb_reg_reset = reset;
  assign memwb_reg_io_mem_wa = mem_stage_io_mem_wa_o; // @[myc01_core.scala 168:34]
  assign memwb_reg_io_mem_wreg = mem_stage_io_mem_wreg_o; // @[myc01_core.scala 169:38]
  assign memwb_reg_io_mem_dreg = mem_stage_io_mem_dreg_o; // @[myc01_core.scala 170:38]
  assign memwb_reg_io_mem_mreg = mem_stage_io_mem_mreg_o; // @[myc01_core.scala 171:38]
  assign memwb_reg_io_mem_dre = mem_stage_io_dre; // @[myc01_core.scala 172:38]
  assign memwb_reg_io_mem_load_unsign = mem_stage_io_load_unsign; // @[myc01_core.scala 173:38]
  assign memwb_reg_io_mem_csr_we = mem_stage_io_csr_we_o; // @[myc01_core.scala 174:38]
  assign memwb_reg_io_mem_csr_wa = mem_stage_io_csr_wa_o; // @[myc01_core.scala 175:38]
  assign memwb_reg_io_mem_csr_wd = mem_stage_io_csr_wd_o; // @[myc01_core.scala 176:38]
  assign memwb_reg_io_mem_dm = mem_stage_io_mem_dm; // @[myc01_core.scala 177:38]
  assign memwb_reg_io_mem_big_endian = mem_stage_io_mem_big_endian; // @[myc01_core.scala 178:38]
  assign memwb_reg_io_flush = excp_io_flush; // @[myc01_core.scala 225:29]
  assign memwb_reg_io_stall = stall_ctrl_io_stall; // @[myc01_core.scala 213:36]
  assign wb_stage_io_wb_wa_i = memwb_reg_io_wb_wa; // @[myc01_core.scala 181:36]
  assign wb_stage_io_wb_wreg_i = memwb_reg_io_wb_wreg; // @[myc01_core.scala 182:36]
  assign wb_stage_io_wb_dreg_i = memwb_reg_io_wb_dreg; // @[myc01_core.scala 183:32]
  assign wb_stage_io_wb_mreg_i = memwb_reg_io_wb_mreg; // @[myc01_core.scala 184:36]
  assign wb_stage_io_wb_dre_i = memwb_reg_io_wb_dre; // @[myc01_core.scala 185:36]
  assign wb_stage_io_wb_load_unsign = memwb_reg_io_wb_load_unsign; // @[myc01_core.scala 186:36]
  assign wb_stage_io_csr_we_i = memwb_reg_io_wb_csr_we; // @[myc01_core.scala 187:36]
  assign wb_stage_io_csr_wa_i = memwb_reg_io_wb_csr_wa; // @[myc01_core.scala 188:36]
  assign wb_stage_io_csr_wd_i = memwb_reg_io_wb_csr_wd; // @[myc01_core.scala 189:36]
  assign wb_stage_io_wb_big_endian = memwb_reg_io_wb_big_endian; // @[myc01_core.scala 191:36]
  assign wb_stage_io_dm = memwb_reg_io_wb_dm; // @[myc01_core.scala 190:36]
  assign regfile_clock = clock;
  assign regfile_reset = reset;
  assign regfile_io_wa = wb_stage_io_wb_wa_o; // @[myc01_core.scala 194:23]
  assign regfile_io_wd = wb_stage_io_wb_wd_o; // @[myc01_core.scala 195:23]
  assign regfile_io_we = wb_stage_io_wb_wreg_o; // @[myc01_core.scala 196:23]
  assign regfile_io_ra1 = id_stage_io_ra1; // @[myc01_core.scala 105:25]
  assign regfile_io_ra2 = id_stage_io_ra2; // @[myc01_core.scala 106:25]
  assign regfile_io_re1 = id_stage_io_rreg1; // @[myc01_core.scala 107:25]
  assign regfile_io_re2 = id_stage_io_rreg2; // @[myc01_core.scala 108:25]
  assign stall_ctrl_io_stallreq_id = id_stage_io_stallreq_id; // @[myc01_core.scala 204:36]
  assign stall_ctrl_io_stallreq_exe = exe_stage_io_stallreq_exe; // @[myc01_core.scala 205:36]
  assign stall_ctrl_io_stallreq_mem = mem_stage_io_stallreq_mem; // @[myc01_core.scala 206:36]
  assign excp_clock = clock;
  assign excp_reset = reset;
  assign excp_io_we_i = wb_stage_io_csr_we_o; // @[myc01_core.scala 199:23]
  assign excp_io_wa_i = wb_stage_io_csr_wa_o; // @[myc01_core.scala 200:23]
  assign excp_io_wd_i = wb_stage_io_csr_wd_o; // @[myc01_core.scala 201:23]
  assign excp_io_re_i = exe_stage_io_csr_re_o; // @[myc01_core.scala 127:23]
  assign excp_io_ra_i = exe_stage_io_csr_ra_o; // @[myc01_core.scala 128:23]
  assign excp_io_exccode_i = mem_stage_io_exccode_o; // @[myc01_core.scala 216:29]
  assign excp_io_pc_i = mem_stage_io_pc_o; // @[myc01_core.scala 217:29]
  assign excp_io_jump_addr_i = mem_stage_io_jump_addr_o; // @[myc01_core.scala 218:29]
  assign excp_io_mtime_int_i = clint_io_timer_int; // @[myc01_core.scala 226:29]
  assign excp_io_msoft_int_i = clint_io_software_int; // @[myc01_core.scala 227:29]
  assign excp_io_mext_int_i = plic_io_excint; // @[myc01_core.scala 228:29]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_we = mem_stage_io_data_we; // @[myc01_core.scala 232:24]
  assign clint_io_addr = mem_stage_io_daddr; // @[myc01_core.scala 231:24]
  assign clint_io_wd = mem_stage_io_din; // @[myc01_core.scala 233:24]
  assign plic_clock = clock;
  assign plic_reset = reset;
  assign plic_io_int_i_1 = io_int_i_1; // @[myc01_core.scala 265:20]
  assign plic_io_int_i_2 = io_int_i_2; // @[myc01_core.scala 266:20]
  assign plic_io_int_i_3 = io_int_i_3; // @[myc01_core.scala 267:20]
  assign plic_io_int_i_4 = io_int_i_4; // @[myc01_core.scala 268:20]
  assign plic_io_int_i_5 = io_int_i_5; // @[myc01_core.scala 269:20]
  assign plic_io_int_i_6 = io_int_i_6; // @[myc01_core.scala 270:20]
  assign plic_io_re = mem_stage_io_dce; // @[myc01_core.scala 236:23]
  assign plic_io_we = mem_stage_io_data_we; // @[myc01_core.scala 239:23]
  assign plic_io_wdata = mem_stage_io_din[2:0]; // @[myc01_core.scala 240:23]
  assign plic_io_addr = mem_stage_io_daddr; // @[myc01_core.scala 238:23]
endmodule
module axi_interface(
  input         clock,
  input         reset,
  input         io_inst_req,
  input         io_inst_we,
  input  [63:0] io_inst_addr,
  output [63:0] io_inst_rdata,
  output        io_inst_beat_ok,
  output        io_inst_data_ok,
  input         io_inst_uncached,
  input         io_data_req,
  input         io_data_we,
  input  [7:0]  io_data_wstrb,
  input  [63:0] io_data_addr,
  input  [63:0] io_data_wdata,
  output [63:0] io_data_rdata,
  output        io_data_beat_ok,
  output        io_data_data_ok,
  input         io_data_uncached,
  output [63:0] io_araddr,
  output [7:0]  io_arlen,
  output [2:0]  io_arsize,
  output [1:0]  io_arburst,
  output        io_arvalid,
  input         io_arready,
  input  [63:0] io_rdata,
  input         io_rlast,
  input         io_rvalid,
  output        io_rready,
  output [63:0] io_awaddr,
  output [2:0]  io_awsize,
  output        io_awvalid,
  input         io_awready,
  output [63:0] io_wdata,
  output [7:0]  io_wstrb,
  output        io_wvalid,
  input         io_bvalid,
  output        io_bready
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire  _T_1 = ~io_data_we; // @[axi_interface.scala 87:58]
  wire  data_rreq = io_data_req & _T_1; // @[axi_interface.scala 87:43]
  wire  data_wreq = io_data_req & io_data_we; // @[axi_interface.scala 88:43]
  wire  _T_5 = ~io_inst_we; // @[axi_interface.scala 89:58]
  wire  _T_6 = io_inst_req & _T_5; // @[axi_interface.scala 89:43]
  wire  _T_7 = ~data_rreq; // @[axi_interface.scala 89:81]
  wire  inst_rreq = _T_6 & _T_7; // @[axi_interface.scala 89:67]
  wire  r_hs = io_rready & io_rvalid; // @[axi_interface.scala 92:37]
  wire  b_hs = io_bready & io_bvalid; // @[axi_interface.scala 95:37]
  reg [63:0] read_buffer_addr; // @[axi_interface.scala 97:45]
  reg  read_buffer_dataORinst; // @[axi_interface.scala 98:41]
  reg [1:0] read_buffer_size; // @[axi_interface.scala 99:41]
  reg [1:0] read_buffer_burst; // @[axi_interface.scala 100:45]
  reg [7:0] read_buffer_len; // @[axi_interface.scala 101:45]
  reg [63:0] write_buffer_addr; // @[axi_interface.scala 103:45]
  reg [63:0] write_buffer_data; // @[axi_interface.scala 104:41]
  reg [1:0] write_buffer_size; // @[axi_interface.scala 105:41]
  reg [7:0] write_buffer_wstrb; // @[axi_interface.scala 106:41]
  reg [1:0] read_state; // @[axi_interface.scala 111:34]
  reg [1:0] write_state; // @[axi_interface.scala 112:34]
  wire  _T_18 = read_state == 2'h0; // @[axi_interface.scala 114:40]
  wire  _T_19 = read_state == 2'h2; // @[axi_interface.scala 114:78]
  wire  _T_21 = _T_19 & r_hs; // @[axi_interface.scala 114:99]
  wire  _T_23 = _T_21 & io_rlast; // @[axi_interface.scala 114:115]
  wire  allow_new_read = _T_18 | _T_23; // @[axi_interface.scala 114:62]
  wire  _T_24 = write_state == 2'h0; // @[axi_interface.scala 115:40]
  wire  _T_25 = write_state == 2'h2; // @[axi_interface.scala 115:78]
  wire  _T_27 = _T_25 & io_bvalid; // @[axi_interface.scala 115:100]
  wire  allow_new_write = _T_24 | _T_27; // @[axi_interface.scala 115:62]
  wire  _T_28 = read_state != 2'h0; // @[axi_interface.scala 118:43]
  wire  _T_29 = io_data_addr == read_buffer_addr; // @[axi_interface.scala 118:81]
  wire  _T_30 = _T_28 & _T_29; // @[axi_interface.scala 118:64]
  wire  read_write_conflict = _T_30 & io_data_we; // @[axi_interface.scala 118:103]
  wire  _T_32 = 2'h0 == read_state; // @[Conditional.scala 37:30]
  wire  _T_35 = inst_rreq | data_rreq; // @[axi_interface.scala 123:95]
  wire  _T_37 = 2'h1 == read_state; // @[Conditional.scala 37:30]
  wire  _T_40 = 2'h2 == read_state; // @[Conditional.scala 37:30]
  wire  _T_43 = 2'h0 == write_state; // @[Conditional.scala 37:30]
  wire  _T_45 = ~read_write_conflict; // @[axi_interface.scala 132:97]
  wire  _T_46 = data_wreq & _T_45; // @[axi_interface.scala 132:74]
  wire  _T_48 = 2'h1 == write_state; // @[Conditional.scala 37:30]
  wire  _T_51 = 2'h2 == write_state; // @[Conditional.scala 37:30]
  wire  _T_60 = ~io_data_uncached; // @[axi_interface.scala 144:80]
  wire  _T_61 = data_rreq & _T_60; // @[axi_interface.scala 144:60]
  wire  _T_63 = ~io_inst_uncached; // @[axi_interface.scala 145:104]
  wire  _T_64 = inst_rreq & _T_63; // @[axi_interface.scala 145:84]
  wire  _T_66 = _T_61 | _T_64; // @[Mux.scala 98:16]
  wire  write_back = _T_25 & b_hs; // @[axi_interface.scala 159:56]
  wire  _T_80 = ~read_buffer_dataORinst; // @[axi_interface.scala 167:51]
  wire  _T_82 = _T_80 & _T_21; // @[axi_interface.scala 167:59]
  wire  _T_90 = read_buffer_dataORinst & _T_21; // @[axi_interface.scala 170:60]
  wire  _T_97 = _T_90 & io_rlast; // @[axi_interface.scala 171:82]
  assign io_inst_rdata = io_rdata; // @[axi_interface.scala 166:21]
  assign io_inst_beat_ok = _T_80 & _T_21; // @[axi_interface.scala 167:25]
  assign io_inst_data_ok = _T_82 & io_rlast; // @[axi_interface.scala 168:25]
  assign io_data_rdata = io_rdata; // @[axi_interface.scala 169:21]
  assign io_data_beat_ok = _T_90 | write_back; // @[axi_interface.scala 170:25]
  assign io_data_data_ok = _T_97 | write_back; // @[axi_interface.scala 171:21]
  assign io_araddr = read_buffer_addr; // @[axi_interface.scala 176:16]
  assign io_arlen = read_buffer_len; // @[axi_interface.scala 177:16]
  assign io_arsize = {{1'd0}, read_buffer_size}; // @[axi_interface.scala 178:20]
  assign io_arburst = read_buffer_burst; // @[axi_interface.scala 179:16]
  assign io_arvalid = read_state == 2'h1; // @[axi_interface.scala 183:16]
  assign io_rready = 1'h1; // @[axi_interface.scala 185:16]
  assign io_awaddr = write_buffer_addr; // @[axi_interface.scala 188:16]
  assign io_awsize = {{1'd0}, write_buffer_size}; // @[axi_interface.scala 190:20]
  assign io_awvalid = write_state == 2'h1; // @[axi_interface.scala 195:16]
  assign io_wdata = write_buffer_data; // @[axi_interface.scala 198:15]
  assign io_wstrb = write_buffer_wstrb; // @[axi_interface.scala 199:15]
  assign io_wvalid = write_state == 2'h2; // @[axi_interface.scala 201:15]
  assign io_bready = 1'h1; // @[axi_interface.scala 203:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  read_buffer_addr = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  read_buffer_dataORinst = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  read_buffer_size = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  read_buffer_burst = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  read_buffer_len = _RAND_4[7:0];
  _RAND_5 = {2{`RANDOM}};
  write_buffer_addr = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  write_buffer_data = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  write_buffer_size = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  write_buffer_wstrb = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  read_state = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  write_state = _RAND_10[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      read_buffer_addr <= 64'h0;
    end else if (allow_new_read) begin
      if (data_rreq) begin
        read_buffer_addr <= io_data_addr;
      end else begin
        read_buffer_addr <= io_inst_addr;
      end
    end
    if (reset) begin
      read_buffer_dataORinst <= 1'h0;
    end else if (allow_new_read) begin
      read_buffer_dataORinst <= data_rreq;
    end
    if (reset) begin
      read_buffer_size <= 2'h0;
    end else if (allow_new_read) begin
      read_buffer_size <= 2'h3;
    end
    if (reset) begin
      read_buffer_burst <= 2'h0;
    end else if (allow_new_read) begin
      read_buffer_burst <= {{1'd0}, _T_66};
    end
    if (reset) begin
      read_buffer_len <= 8'h0;
    end else if (allow_new_read) begin
      read_buffer_len <= {{7'd0}, _T_66};
    end
    if (reset) begin
      write_buffer_addr <= 64'h0;
    end else if (allow_new_write) begin
      write_buffer_addr <= io_data_addr;
    end
    if (reset) begin
      write_buffer_data <= 64'h0;
    end else if (allow_new_write) begin
      write_buffer_data <= io_data_wdata;
    end
    if (reset) begin
      write_buffer_size <= 2'h0;
    end else if (allow_new_write) begin
      write_buffer_size <= 2'h3;
    end
    if (reset) begin
      write_buffer_wstrb <= 8'h0;
    end else if (allow_new_write) begin
      write_buffer_wstrb <= io_data_wstrb;
    end
    if (reset) begin
      read_state <= 2'h0;
    end else if (_T_32) begin
      if (_T_35) begin
        read_state <= 2'h1;
      end else begin
        read_state <= 2'h0;
      end
    end else if (_T_37) begin
      if (io_arready) begin
        read_state <= 2'h2;
      end else begin
        read_state <= 2'h1;
      end
    end else if (_T_40) begin
      if (io_rlast) begin
        read_state <= 2'h0;
      end else begin
        read_state <= 2'h2;
      end
    end
    if (reset) begin
      write_state <= 2'h0;
    end else if (_T_43) begin
      if (_T_46) begin
        write_state <= 2'h1;
      end else begin
        write_state <= 2'h0;
      end
    end else if (_T_48) begin
      if (io_awready) begin
        write_state <= 2'h2;
      end else begin
        write_state <= 2'h1;
      end
    end else if (_T_51) begin
      if (io_bvalid) begin
        write_state <= 2'h0;
      end else begin
        write_state <= 2'h2;
      end
    end
  end
endmodule
module cache(
  input         clock,
  input         reset,
  input         io_cpu_req,
  input  [63:0] io_cpu_addr,
  input         io_cpu_wr,
  input  [7:0]  io_cpu_wstrb,
  input  [63:0] io_cpu_wdata,
  output [63:0] io_cpu_rdata,
  output [63:0] io_operation_ok,
  input         io_cache_invalid,
  output        io_ram_req,
  output        io_ram_wr,
  output [7:0]  io_ram_wstrb,
  output [63:0] io_ram_addr,
  output [63:0] io_ram_wdata,
  input  [63:0] io_ram_rdata,
  input         io_ram_beat_ok,
  input         io_ram_data_ok,
  output        io_uncached
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [63:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [63:0] _RAND_63;
  reg [127:0] _RAND_64;
  reg [127:0] _RAND_65;
  reg [127:0] _RAND_66;
  reg [127:0] _RAND_67;
  reg [127:0] _RAND_68;
  reg [127:0] _RAND_69;
  reg [127:0] _RAND_70;
  reg [127:0] _RAND_71;
  reg [127:0] _RAND_72;
  reg [127:0] _RAND_73;
  reg [127:0] _RAND_74;
  reg [127:0] _RAND_75;
  reg [127:0] _RAND_76;
  reg [127:0] _RAND_77;
  reg [127:0] _RAND_78;
  reg [127:0] _RAND_79;
  reg [127:0] _RAND_80;
  reg [127:0] _RAND_81;
  reg [127:0] _RAND_82;
  reg [127:0] _RAND_83;
  reg [127:0] _RAND_84;
  reg [127:0] _RAND_85;
  reg [127:0] _RAND_86;
  reg [127:0] _RAND_87;
  reg [127:0] _RAND_88;
  reg [127:0] _RAND_89;
  reg [127:0] _RAND_90;
  reg [127:0] _RAND_91;
  reg [127:0] _RAND_92;
  reg [127:0] _RAND_93;
  reg [127:0] _RAND_94;
  reg [127:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
`endif // RANDOMIZE_REG_INIT
  wire [54:0] addr_tag = io_cpu_addr[63:9]; // @[cache.scala 35:34]
  wire [4:0] addr_index = io_cpu_addr[8:4]; // @[cache.scala 36:38]
  wire [3:0] addr_offset = io_cpu_addr[3:0]; // @[cache.scala 37:38]
  reg  V_0; // @[cache.scala 40:33]
  reg  V_1; // @[cache.scala 40:33]
  reg  V_2; // @[cache.scala 40:33]
  reg  V_3; // @[cache.scala 40:33]
  reg  V_4; // @[cache.scala 40:33]
  reg  V_5; // @[cache.scala 40:33]
  reg  V_6; // @[cache.scala 40:33]
  reg  V_7; // @[cache.scala 40:33]
  reg  V_8; // @[cache.scala 40:33]
  reg  V_9; // @[cache.scala 40:33]
  reg  V_10; // @[cache.scala 40:33]
  reg  V_11; // @[cache.scala 40:33]
  reg  V_12; // @[cache.scala 40:33]
  reg  V_13; // @[cache.scala 40:33]
  reg  V_14; // @[cache.scala 40:33]
  reg  V_15; // @[cache.scala 40:33]
  reg  V_16; // @[cache.scala 40:33]
  reg  V_17; // @[cache.scala 40:33]
  reg  V_18; // @[cache.scala 40:33]
  reg  V_19; // @[cache.scala 40:33]
  reg  V_20; // @[cache.scala 40:33]
  reg  V_21; // @[cache.scala 40:33]
  reg  V_22; // @[cache.scala 40:33]
  reg  V_23; // @[cache.scala 40:33]
  reg  V_24; // @[cache.scala 40:33]
  reg  V_25; // @[cache.scala 40:33]
  reg  V_26; // @[cache.scala 40:33]
  reg  V_27; // @[cache.scala 40:33]
  reg  V_28; // @[cache.scala 40:33]
  reg  V_29; // @[cache.scala 40:33]
  reg  V_30; // @[cache.scala 40:33]
  reg  V_31; // @[cache.scala 40:33]
  reg [54:0] Tag_0; // @[cache.scala 41:29]
  reg [54:0] Tag_1; // @[cache.scala 41:29]
  reg [54:0] Tag_2; // @[cache.scala 41:29]
  reg [54:0] Tag_3; // @[cache.scala 41:29]
  reg [54:0] Tag_4; // @[cache.scala 41:29]
  reg [54:0] Tag_5; // @[cache.scala 41:29]
  reg [54:0] Tag_6; // @[cache.scala 41:29]
  reg [54:0] Tag_7; // @[cache.scala 41:29]
  reg [54:0] Tag_8; // @[cache.scala 41:29]
  reg [54:0] Tag_9; // @[cache.scala 41:29]
  reg [54:0] Tag_10; // @[cache.scala 41:29]
  reg [54:0] Tag_11; // @[cache.scala 41:29]
  reg [54:0] Tag_12; // @[cache.scala 41:29]
  reg [54:0] Tag_13; // @[cache.scala 41:29]
  reg [54:0] Tag_14; // @[cache.scala 41:29]
  reg [54:0] Tag_15; // @[cache.scala 41:29]
  reg [54:0] Tag_16; // @[cache.scala 41:29]
  reg [54:0] Tag_17; // @[cache.scala 41:29]
  reg [54:0] Tag_18; // @[cache.scala 41:29]
  reg [54:0] Tag_19; // @[cache.scala 41:29]
  reg [54:0] Tag_20; // @[cache.scala 41:29]
  reg [54:0] Tag_21; // @[cache.scala 41:29]
  reg [54:0] Tag_22; // @[cache.scala 41:29]
  reg [54:0] Tag_23; // @[cache.scala 41:29]
  reg [54:0] Tag_24; // @[cache.scala 41:29]
  reg [54:0] Tag_25; // @[cache.scala 41:29]
  reg [54:0] Tag_26; // @[cache.scala 41:29]
  reg [54:0] Tag_27; // @[cache.scala 41:29]
  reg [54:0] Tag_28; // @[cache.scala 41:29]
  reg [54:0] Tag_29; // @[cache.scala 41:29]
  reg [54:0] Tag_30; // @[cache.scala 41:29]
  reg [54:0] Tag_31; // @[cache.scala 41:29]
  reg [127:0] Cache_line_0; // @[cache.scala 42:29]
  reg [127:0] Cache_line_1; // @[cache.scala 42:29]
  reg [127:0] Cache_line_2; // @[cache.scala 42:29]
  reg [127:0] Cache_line_3; // @[cache.scala 42:29]
  reg [127:0] Cache_line_4; // @[cache.scala 42:29]
  reg [127:0] Cache_line_5; // @[cache.scala 42:29]
  reg [127:0] Cache_line_6; // @[cache.scala 42:29]
  reg [127:0] Cache_line_7; // @[cache.scala 42:29]
  reg [127:0] Cache_line_8; // @[cache.scala 42:29]
  reg [127:0] Cache_line_9; // @[cache.scala 42:29]
  reg [127:0] Cache_line_10; // @[cache.scala 42:29]
  reg [127:0] Cache_line_11; // @[cache.scala 42:29]
  reg [127:0] Cache_line_12; // @[cache.scala 42:29]
  reg [127:0] Cache_line_13; // @[cache.scala 42:29]
  reg [127:0] Cache_line_14; // @[cache.scala 42:29]
  reg [127:0] Cache_line_15; // @[cache.scala 42:29]
  reg [127:0] Cache_line_16; // @[cache.scala 42:29]
  reg [127:0] Cache_line_17; // @[cache.scala 42:29]
  reg [127:0] Cache_line_18; // @[cache.scala 42:29]
  reg [127:0] Cache_line_19; // @[cache.scala 42:29]
  reg [127:0] Cache_line_20; // @[cache.scala 42:29]
  reg [127:0] Cache_line_21; // @[cache.scala 42:29]
  reg [127:0] Cache_line_22; // @[cache.scala 42:29]
  reg [127:0] Cache_line_23; // @[cache.scala 42:29]
  reg [127:0] Cache_line_24; // @[cache.scala 42:29]
  reg [127:0] Cache_line_25; // @[cache.scala 42:29]
  reg [127:0] Cache_line_26; // @[cache.scala 42:29]
  reg [127:0] Cache_line_27; // @[cache.scala 42:29]
  reg [127:0] Cache_line_28; // @[cache.scala 42:29]
  reg [127:0] Cache_line_29; // @[cache.scala 42:29]
  reg [127:0] Cache_line_30; // @[cache.scala 42:29]
  reg [127:0] Cache_line_31; // @[cache.scala 42:29]
  reg  req; // @[cache.scala 45:20]
  wire  _T_3 = io_operation_ok == 64'h1; // @[cache.scala 47:27]
  wire  _T_5 = ~req; // @[cache.scala 48:37]
  wire  _T_6 = io_cpu_req & _T_5; // @[cache.scala 48:30]
  wire  _T_7 = _T_6 | req; // @[Mux.scala 98:16]
  wire [54:0] _GEN_1 = 5'h1 == addr_index ? Tag_1 : Tag_0; // @[cache.scala 51:34]
  wire [54:0] _GEN_2 = 5'h2 == addr_index ? Tag_2 : _GEN_1; // @[cache.scala 51:34]
  wire [54:0] _GEN_3 = 5'h3 == addr_index ? Tag_3 : _GEN_2; // @[cache.scala 51:34]
  wire [54:0] _GEN_4 = 5'h4 == addr_index ? Tag_4 : _GEN_3; // @[cache.scala 51:34]
  wire [54:0] _GEN_5 = 5'h5 == addr_index ? Tag_5 : _GEN_4; // @[cache.scala 51:34]
  wire [54:0] _GEN_6 = 5'h6 == addr_index ? Tag_6 : _GEN_5; // @[cache.scala 51:34]
  wire [54:0] _GEN_7 = 5'h7 == addr_index ? Tag_7 : _GEN_6; // @[cache.scala 51:34]
  wire [54:0] _GEN_8 = 5'h8 == addr_index ? Tag_8 : _GEN_7; // @[cache.scala 51:34]
  wire [54:0] _GEN_9 = 5'h9 == addr_index ? Tag_9 : _GEN_8; // @[cache.scala 51:34]
  wire [54:0] _GEN_10 = 5'ha == addr_index ? Tag_10 : _GEN_9; // @[cache.scala 51:34]
  wire [54:0] _GEN_11 = 5'hb == addr_index ? Tag_11 : _GEN_10; // @[cache.scala 51:34]
  wire [54:0] _GEN_12 = 5'hc == addr_index ? Tag_12 : _GEN_11; // @[cache.scala 51:34]
  wire [54:0] _GEN_13 = 5'hd == addr_index ? Tag_13 : _GEN_12; // @[cache.scala 51:34]
  wire [54:0] _GEN_14 = 5'he == addr_index ? Tag_14 : _GEN_13; // @[cache.scala 51:34]
  wire [54:0] _GEN_15 = 5'hf == addr_index ? Tag_15 : _GEN_14; // @[cache.scala 51:34]
  wire [54:0] _GEN_16 = 5'h10 == addr_index ? Tag_16 : _GEN_15; // @[cache.scala 51:34]
  wire [54:0] _GEN_17 = 5'h11 == addr_index ? Tag_17 : _GEN_16; // @[cache.scala 51:34]
  wire [54:0] _GEN_18 = 5'h12 == addr_index ? Tag_18 : _GEN_17; // @[cache.scala 51:34]
  wire [54:0] _GEN_19 = 5'h13 == addr_index ? Tag_19 : _GEN_18; // @[cache.scala 51:34]
  wire [54:0] _GEN_20 = 5'h14 == addr_index ? Tag_20 : _GEN_19; // @[cache.scala 51:34]
  wire [54:0] _GEN_21 = 5'h15 == addr_index ? Tag_21 : _GEN_20; // @[cache.scala 51:34]
  wire [54:0] _GEN_22 = 5'h16 == addr_index ? Tag_22 : _GEN_21; // @[cache.scala 51:34]
  wire [54:0] _GEN_23 = 5'h17 == addr_index ? Tag_23 : _GEN_22; // @[cache.scala 51:34]
  wire [54:0] _GEN_24 = 5'h18 == addr_index ? Tag_24 : _GEN_23; // @[cache.scala 51:34]
  wire [54:0] _GEN_25 = 5'h19 == addr_index ? Tag_25 : _GEN_24; // @[cache.scala 51:34]
  wire [54:0] _GEN_26 = 5'h1a == addr_index ? Tag_26 : _GEN_25; // @[cache.scala 51:34]
  wire [54:0] _GEN_27 = 5'h1b == addr_index ? Tag_27 : _GEN_26; // @[cache.scala 51:34]
  wire [54:0] _GEN_28 = 5'h1c == addr_index ? Tag_28 : _GEN_27; // @[cache.scala 51:34]
  wire [54:0] _GEN_29 = 5'h1d == addr_index ? Tag_29 : _GEN_28; // @[cache.scala 51:34]
  wire [54:0] _GEN_30 = 5'h1e == addr_index ? Tag_30 : _GEN_29; // @[cache.scala 51:34]
  wire [54:0] _GEN_31 = 5'h1f == addr_index ? Tag_31 : _GEN_30; // @[cache.scala 51:34]
  wire  _T_9 = _GEN_31 == addr_tag; // @[cache.scala 51:34]
  wire  _GEN_33 = 5'h1 == addr_index ? V_1 : V_0; // @[cache.scala 51:64]
  wire  _GEN_34 = 5'h2 == addr_index ? V_2 : _GEN_33; // @[cache.scala 51:64]
  wire  _GEN_35 = 5'h3 == addr_index ? V_3 : _GEN_34; // @[cache.scala 51:64]
  wire  _GEN_36 = 5'h4 == addr_index ? V_4 : _GEN_35; // @[cache.scala 51:64]
  wire  _GEN_37 = 5'h5 == addr_index ? V_5 : _GEN_36; // @[cache.scala 51:64]
  wire  _GEN_38 = 5'h6 == addr_index ? V_6 : _GEN_37; // @[cache.scala 51:64]
  wire  _GEN_39 = 5'h7 == addr_index ? V_7 : _GEN_38; // @[cache.scala 51:64]
  wire  _GEN_40 = 5'h8 == addr_index ? V_8 : _GEN_39; // @[cache.scala 51:64]
  wire  _GEN_41 = 5'h9 == addr_index ? V_9 : _GEN_40; // @[cache.scala 51:64]
  wire  _GEN_42 = 5'ha == addr_index ? V_10 : _GEN_41; // @[cache.scala 51:64]
  wire  _GEN_43 = 5'hb == addr_index ? V_11 : _GEN_42; // @[cache.scala 51:64]
  wire  _GEN_44 = 5'hc == addr_index ? V_12 : _GEN_43; // @[cache.scala 51:64]
  wire  _GEN_45 = 5'hd == addr_index ? V_13 : _GEN_44; // @[cache.scala 51:64]
  wire  _GEN_46 = 5'he == addr_index ? V_14 : _GEN_45; // @[cache.scala 51:64]
  wire  _GEN_47 = 5'hf == addr_index ? V_15 : _GEN_46; // @[cache.scala 51:64]
  wire  _GEN_48 = 5'h10 == addr_index ? V_16 : _GEN_47; // @[cache.scala 51:64]
  wire  _GEN_49 = 5'h11 == addr_index ? V_17 : _GEN_48; // @[cache.scala 51:64]
  wire  _GEN_50 = 5'h12 == addr_index ? V_18 : _GEN_49; // @[cache.scala 51:64]
  wire  _GEN_51 = 5'h13 == addr_index ? V_19 : _GEN_50; // @[cache.scala 51:64]
  wire  _GEN_52 = 5'h14 == addr_index ? V_20 : _GEN_51; // @[cache.scala 51:64]
  wire  _GEN_53 = 5'h15 == addr_index ? V_21 : _GEN_52; // @[cache.scala 51:64]
  wire  _GEN_54 = 5'h16 == addr_index ? V_22 : _GEN_53; // @[cache.scala 51:64]
  wire  _GEN_55 = 5'h17 == addr_index ? V_23 : _GEN_54; // @[cache.scala 51:64]
  wire  _GEN_56 = 5'h18 == addr_index ? V_24 : _GEN_55; // @[cache.scala 51:64]
  wire  _GEN_57 = 5'h19 == addr_index ? V_25 : _GEN_56; // @[cache.scala 51:64]
  wire  _GEN_58 = 5'h1a == addr_index ? V_26 : _GEN_57; // @[cache.scala 51:64]
  wire  _GEN_59 = 5'h1b == addr_index ? V_27 : _GEN_58; // @[cache.scala 51:64]
  wire  _GEN_60 = 5'h1c == addr_index ? V_28 : _GEN_59; // @[cache.scala 51:64]
  wire  _GEN_61 = 5'h1d == addr_index ? V_29 : _GEN_60; // @[cache.scala 51:64]
  wire  _GEN_62 = 5'h1e == addr_index ? V_30 : _GEN_61; // @[cache.scala 51:64]
  wire  _GEN_63 = 5'h1f == addr_index ? V_31 : _GEN_62; // @[cache.scala 51:64]
  wire  _T_11 = _T_9 & _GEN_63; // @[cache.scala 51:47]
  wire  _T_12 = ~io_uncached; // @[cache.scala 51:88]
  wire  hit = _T_11 & _T_12; // @[cache.scala 51:73]
  wire  _T_14 = ~io_cpu_wr; // @[cache.scala 55:17]
  wire  _T_16 = _T_14 & hit; // @[cache.scala 55:25]
  wire  _T_18 = _T_16 & _T_12; // @[cache.scala 55:40]
  wire [127:0] _GEN_65 = 5'h1 == addr_index ? Cache_line_1 : Cache_line_0; // @[cache.scala 56:62]
  wire [127:0] _GEN_66 = 5'h2 == addr_index ? Cache_line_2 : _GEN_65; // @[cache.scala 56:62]
  wire [127:0] _GEN_67 = 5'h3 == addr_index ? Cache_line_3 : _GEN_66; // @[cache.scala 56:62]
  wire [127:0] _GEN_68 = 5'h4 == addr_index ? Cache_line_4 : _GEN_67; // @[cache.scala 56:62]
  wire [127:0] _GEN_69 = 5'h5 == addr_index ? Cache_line_5 : _GEN_68; // @[cache.scala 56:62]
  wire [127:0] _GEN_70 = 5'h6 == addr_index ? Cache_line_6 : _GEN_69; // @[cache.scala 56:62]
  wire [127:0] _GEN_71 = 5'h7 == addr_index ? Cache_line_7 : _GEN_70; // @[cache.scala 56:62]
  wire [127:0] _GEN_72 = 5'h8 == addr_index ? Cache_line_8 : _GEN_71; // @[cache.scala 56:62]
  wire [127:0] _GEN_73 = 5'h9 == addr_index ? Cache_line_9 : _GEN_72; // @[cache.scala 56:62]
  wire [127:0] _GEN_74 = 5'ha == addr_index ? Cache_line_10 : _GEN_73; // @[cache.scala 56:62]
  wire [127:0] _GEN_75 = 5'hb == addr_index ? Cache_line_11 : _GEN_74; // @[cache.scala 56:62]
  wire [127:0] _GEN_76 = 5'hc == addr_index ? Cache_line_12 : _GEN_75; // @[cache.scala 56:62]
  wire [127:0] _GEN_77 = 5'hd == addr_index ? Cache_line_13 : _GEN_76; // @[cache.scala 56:62]
  wire [127:0] _GEN_78 = 5'he == addr_index ? Cache_line_14 : _GEN_77; // @[cache.scala 56:62]
  wire [127:0] _GEN_79 = 5'hf == addr_index ? Cache_line_15 : _GEN_78; // @[cache.scala 56:62]
  wire [127:0] _GEN_80 = 5'h10 == addr_index ? Cache_line_16 : _GEN_79; // @[cache.scala 56:62]
  wire [127:0] _GEN_81 = 5'h11 == addr_index ? Cache_line_17 : _GEN_80; // @[cache.scala 56:62]
  wire [127:0] _GEN_82 = 5'h12 == addr_index ? Cache_line_18 : _GEN_81; // @[cache.scala 56:62]
  wire [127:0] _GEN_83 = 5'h13 == addr_index ? Cache_line_19 : _GEN_82; // @[cache.scala 56:62]
  wire [127:0] _GEN_84 = 5'h14 == addr_index ? Cache_line_20 : _GEN_83; // @[cache.scala 56:62]
  wire [127:0] _GEN_85 = 5'h15 == addr_index ? Cache_line_21 : _GEN_84; // @[cache.scala 56:62]
  wire [127:0] _GEN_86 = 5'h16 == addr_index ? Cache_line_22 : _GEN_85; // @[cache.scala 56:62]
  wire [127:0] _GEN_87 = 5'h17 == addr_index ? Cache_line_23 : _GEN_86; // @[cache.scala 56:62]
  wire [127:0] _GEN_88 = 5'h18 == addr_index ? Cache_line_24 : _GEN_87; // @[cache.scala 56:62]
  wire [127:0] _GEN_89 = 5'h19 == addr_index ? Cache_line_25 : _GEN_88; // @[cache.scala 56:62]
  wire [127:0] _GEN_90 = 5'h1a == addr_index ? Cache_line_26 : _GEN_89; // @[cache.scala 56:62]
  wire [127:0] _GEN_91 = 5'h1b == addr_index ? Cache_line_27 : _GEN_90; // @[cache.scala 56:62]
  wire [127:0] _GEN_92 = 5'h1c == addr_index ? Cache_line_28 : _GEN_91; // @[cache.scala 56:62]
  wire [127:0] _GEN_93 = 5'h1d == addr_index ? Cache_line_29 : _GEN_92; // @[cache.scala 56:62]
  wire [127:0] _GEN_94 = 5'h1e == addr_index ? Cache_line_30 : _GEN_93; // @[cache.scala 56:62]
  wire [127:0] _GEN_95 = 5'h1f == addr_index ? Cache_line_31 : _GEN_94; // @[cache.scala 56:62]
  wire [63:0] _T_23 = addr_offset[3] ? _GEN_95[63:0] : _GEN_95[127:64]; // @[cache.scala 56:16]
  wire  _T_26 = io_uncached & io_ram_data_ok; // @[cache.scala 57:31]
  wire [63:0] _T_27 = _T_26 ? io_ram_rdata : 64'h0; // @[Mux.scala 98:16]
  wire  _T_31 = req & _T_14; // @[cache.scala 62:31]
  wire  _T_32 = ~hit; // @[cache.scala 62:59]
  wire  _T_33 = _T_31 & _T_32; // @[cache.scala 62:52]
  wire  read_miss = _T_33 & _T_12; // @[cache.scala 62:67]
  wire  _T_36 = ~io_ram_data_ok; // @[cache.scala 65:58]
  wire  _T_37 = read_miss & _T_36; // @[cache.scala 65:40]
  wire  _T_40 = io_uncached & _T_36; // @[cache.scala 66:62]
  wire  _T_43 = req & io_cpu_wr; // @[cache.scala 67:54]
  wire  _T_45 = _T_43 & _T_36; // @[cache.scala 67:75]
  wire  _T_47 = _T_40 | _T_45; // @[Mux.scala 98:16]
  wire  _T_60 = _T_31 & _T_12; // @[cache.scala 72:56]
  wire  _T_62 = _T_60 | io_uncached; // @[cache.scala 72:79]
  wire [63:0] _T_71 = {io_cpu_addr[63:4],4'h0}; // @[Cat.scala 30:58]
  wire [63:0] _T_76 = _T_43 ? io_cpu_addr : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_77 = io_uncached ? io_cpu_addr : _T_76; // @[Mux.scala 98:16]
  wire  _T_89 = _T_43 & io_ram_data_ok; // @[cache.scala 82:75]
  wire  _T_91 = _T_26 | _T_89; // @[Mux.scala 98:16]
  wire  _T_92 = _T_16 | _T_91; // @[Mux.scala 98:16]
  reg [1:0] cnt; // @[cache.scala 88:20]
  reg [4:0] addr_index_temp; // @[cache.scala 91:32]
  wire  _T_109 = read_miss & io_ram_beat_ok; // @[cache.scala 97:32]
  wire  _T_110 = cnt == 2'h1; // @[cache.scala 98:16]
  wire [127:0] _GEN_97 = 5'h1 == addr_index_temp ? Cache_line_1 : Cache_line_0; // @[cache.scala 99:74]
  wire [127:0] _GEN_98 = 5'h2 == addr_index_temp ? Cache_line_2 : _GEN_97; // @[cache.scala 99:74]
  wire [127:0] _GEN_99 = 5'h3 == addr_index_temp ? Cache_line_3 : _GEN_98; // @[cache.scala 99:74]
  wire [127:0] _GEN_100 = 5'h4 == addr_index_temp ? Cache_line_4 : _GEN_99; // @[cache.scala 99:74]
  wire [127:0] _GEN_101 = 5'h5 == addr_index_temp ? Cache_line_5 : _GEN_100; // @[cache.scala 99:74]
  wire [127:0] _GEN_102 = 5'h6 == addr_index_temp ? Cache_line_6 : _GEN_101; // @[cache.scala 99:74]
  wire [127:0] _GEN_103 = 5'h7 == addr_index_temp ? Cache_line_7 : _GEN_102; // @[cache.scala 99:74]
  wire [127:0] _GEN_104 = 5'h8 == addr_index_temp ? Cache_line_8 : _GEN_103; // @[cache.scala 99:74]
  wire [127:0] _GEN_105 = 5'h9 == addr_index_temp ? Cache_line_9 : _GEN_104; // @[cache.scala 99:74]
  wire [127:0] _GEN_106 = 5'ha == addr_index_temp ? Cache_line_10 : _GEN_105; // @[cache.scala 99:74]
  wire [127:0] _GEN_107 = 5'hb == addr_index_temp ? Cache_line_11 : _GEN_106; // @[cache.scala 99:74]
  wire [127:0] _GEN_108 = 5'hc == addr_index_temp ? Cache_line_12 : _GEN_107; // @[cache.scala 99:74]
  wire [127:0] _GEN_109 = 5'hd == addr_index_temp ? Cache_line_13 : _GEN_108; // @[cache.scala 99:74]
  wire [127:0] _GEN_110 = 5'he == addr_index_temp ? Cache_line_14 : _GEN_109; // @[cache.scala 99:74]
  wire [127:0] _GEN_111 = 5'hf == addr_index_temp ? Cache_line_15 : _GEN_110; // @[cache.scala 99:74]
  wire [127:0] _GEN_112 = 5'h10 == addr_index_temp ? Cache_line_16 : _GEN_111; // @[cache.scala 99:74]
  wire [127:0] _GEN_113 = 5'h11 == addr_index_temp ? Cache_line_17 : _GEN_112; // @[cache.scala 99:74]
  wire [127:0] _GEN_114 = 5'h12 == addr_index_temp ? Cache_line_18 : _GEN_113; // @[cache.scala 99:74]
  wire [127:0] _GEN_115 = 5'h13 == addr_index_temp ? Cache_line_19 : _GEN_114; // @[cache.scala 99:74]
  wire [127:0] _GEN_116 = 5'h14 == addr_index_temp ? Cache_line_20 : _GEN_115; // @[cache.scala 99:74]
  wire [127:0] _GEN_117 = 5'h15 == addr_index_temp ? Cache_line_21 : _GEN_116; // @[cache.scala 99:74]
  wire [127:0] _GEN_118 = 5'h16 == addr_index_temp ? Cache_line_22 : _GEN_117; // @[cache.scala 99:74]
  wire [127:0] _GEN_119 = 5'h17 == addr_index_temp ? Cache_line_23 : _GEN_118; // @[cache.scala 99:74]
  wire [127:0] _GEN_120 = 5'h18 == addr_index_temp ? Cache_line_24 : _GEN_119; // @[cache.scala 99:74]
  wire [127:0] _GEN_121 = 5'h19 == addr_index_temp ? Cache_line_25 : _GEN_120; // @[cache.scala 99:74]
  wire [127:0] _GEN_122 = 5'h1a == addr_index_temp ? Cache_line_26 : _GEN_121; // @[cache.scala 99:74]
  wire [127:0] _GEN_123 = 5'h1b == addr_index_temp ? Cache_line_27 : _GEN_122; // @[cache.scala 99:74]
  wire [127:0] _GEN_124 = 5'h1c == addr_index_temp ? Cache_line_28 : _GEN_123; // @[cache.scala 99:74]
  wire [127:0] _GEN_125 = 5'h1d == addr_index_temp ? Cache_line_29 : _GEN_124; // @[cache.scala 99:74]
  wire [127:0] _GEN_126 = 5'h1e == addr_index_temp ? Cache_line_30 : _GEN_125; // @[cache.scala 99:74]
  wire [127:0] _GEN_127 = 5'h1f == addr_index_temp ? Cache_line_31 : _GEN_126; // @[cache.scala 99:74]
  wire [127:0] _T_112 = {_GEN_127[127:64],io_ram_rdata}; // @[Cat.scala 30:58]
  wire  _GEN_675 = 5'h0 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_192 = _GEN_675 | V_0; // @[cache.scala 101:32]
  wire  _GEN_676 = 5'h1 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_193 = _GEN_676 | V_1; // @[cache.scala 101:32]
  wire  _GEN_677 = 5'h2 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_194 = _GEN_677 | V_2; // @[cache.scala 101:32]
  wire  _GEN_678 = 5'h3 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_195 = _GEN_678 | V_3; // @[cache.scala 101:32]
  wire  _GEN_679 = 5'h4 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_196 = _GEN_679 | V_4; // @[cache.scala 101:32]
  wire  _GEN_680 = 5'h5 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_197 = _GEN_680 | V_5; // @[cache.scala 101:32]
  wire  _GEN_681 = 5'h6 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_198 = _GEN_681 | V_6; // @[cache.scala 101:32]
  wire  _GEN_682 = 5'h7 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_199 = _GEN_682 | V_7; // @[cache.scala 101:32]
  wire  _GEN_683 = 5'h8 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_200 = _GEN_683 | V_8; // @[cache.scala 101:32]
  wire  _GEN_684 = 5'h9 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_201 = _GEN_684 | V_9; // @[cache.scala 101:32]
  wire  _GEN_685 = 5'ha == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_202 = _GEN_685 | V_10; // @[cache.scala 101:32]
  wire  _GEN_686 = 5'hb == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_203 = _GEN_686 | V_11; // @[cache.scala 101:32]
  wire  _GEN_687 = 5'hc == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_204 = _GEN_687 | V_12; // @[cache.scala 101:32]
  wire  _GEN_688 = 5'hd == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_205 = _GEN_688 | V_13; // @[cache.scala 101:32]
  wire  _GEN_689 = 5'he == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_206 = _GEN_689 | V_14; // @[cache.scala 101:32]
  wire  _GEN_690 = 5'hf == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_207 = _GEN_690 | V_15; // @[cache.scala 101:32]
  wire  _GEN_691 = 5'h10 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_208 = _GEN_691 | V_16; // @[cache.scala 101:32]
  wire  _GEN_692 = 5'h11 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_209 = _GEN_692 | V_17; // @[cache.scala 101:32]
  wire  _GEN_693 = 5'h12 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_210 = _GEN_693 | V_18; // @[cache.scala 101:32]
  wire  _GEN_694 = 5'h13 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_211 = _GEN_694 | V_19; // @[cache.scala 101:32]
  wire  _GEN_695 = 5'h14 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_212 = _GEN_695 | V_20; // @[cache.scala 101:32]
  wire  _GEN_696 = 5'h15 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_213 = _GEN_696 | V_21; // @[cache.scala 101:32]
  wire  _GEN_697 = 5'h16 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_214 = _GEN_697 | V_22; // @[cache.scala 101:32]
  wire  _GEN_698 = 5'h17 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_215 = _GEN_698 | V_23; // @[cache.scala 101:32]
  wire  _GEN_699 = 5'h18 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_216 = _GEN_699 | V_24; // @[cache.scala 101:32]
  wire  _GEN_700 = 5'h19 == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_217 = _GEN_700 | V_25; // @[cache.scala 101:32]
  wire  _GEN_701 = 5'h1a == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_218 = _GEN_701 | V_26; // @[cache.scala 101:32]
  wire  _GEN_702 = 5'h1b == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_219 = _GEN_702 | V_27; // @[cache.scala 101:32]
  wire  _GEN_703 = 5'h1c == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_220 = _GEN_703 | V_28; // @[cache.scala 101:32]
  wire  _GEN_704 = 5'h1d == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_221 = _GEN_704 | V_29; // @[cache.scala 101:32]
  wire  _GEN_705 = 5'h1e == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_222 = _GEN_705 | V_30; // @[cache.scala 101:32]
  wire  _GEN_706 = 5'h1f == addr_index_temp; // @[cache.scala 101:32]
  wire  _GEN_223 = _GEN_706 | V_31; // @[cache.scala 101:32]
  wire [127:0] _T_114 = {io_ram_rdata,_GEN_127[63:0]}; // @[Cat.scala 30:58]
  wire  _GEN_352 = _T_110 ? 1'h0 : 1'h1; // @[cache.scala 98:24]
  wire  _T_119 = _T_43 & hit; // @[cache.scala 108:47]
  wire  _T_122 = _T_119 & addr_offset[3]; // @[cache.scala 108:62]
  wire  _T_123 = io_cpu_wstrb == 8'h80; // @[cache.scala 110:26]
  wire [63:0] _T_126 = _GEN_95[63:0] & 64'hffffffffffffff; // @[cache.scala 110:89]
  wire [63:0] _T_127 = io_cpu_wdata & 64'hff00000000000000; // @[cache.scala 110:127]
  wire [63:0] _T_128 = _T_126 | _T_127; // @[cache.scala 110:113]
  wire [127:0] _T_129 = {_GEN_95[127:64],_T_128}; // @[Cat.scala 30:58]
  wire  _T_130 = io_cpu_wstrb == 8'h40; // @[cache.scala 111:26]
  wire [63:0] _T_133 = _GEN_95[63:0] & 64'hff00ffffffffffff; // @[cache.scala 111:89]
  wire [63:0] _T_134 = io_cpu_wdata & 64'hff000000000000; // @[cache.scala 111:127]
  wire [63:0] _T_135 = _T_133 | _T_134; // @[cache.scala 111:113]
  wire [127:0] _T_136 = {_GEN_95[127:64],_T_135}; // @[Cat.scala 30:58]
  wire  _T_137 = io_cpu_wstrb == 8'h20; // @[cache.scala 112:26]
  wire [63:0] _T_140 = _GEN_95[63:0] & 64'hffff00ffffffffff; // @[cache.scala 112:89]
  wire [63:0] _T_141 = io_cpu_wdata & 64'hff0000000000; // @[cache.scala 112:127]
  wire [63:0] _T_142 = _T_140 | _T_141; // @[cache.scala 112:113]
  wire [127:0] _T_143 = {_GEN_95[127:64],_T_142}; // @[Cat.scala 30:58]
  wire  _T_144 = io_cpu_wstrb == 8'h10; // @[cache.scala 113:26]
  wire [63:0] _T_147 = _GEN_95[63:0] & 64'hffffff00ffffffff; // @[cache.scala 113:89]
  wire [63:0] _T_148 = io_cpu_wdata & 64'hff00000000; // @[cache.scala 113:127]
  wire [63:0] _T_149 = _T_147 | _T_148; // @[cache.scala 113:113]
  wire [127:0] _T_150 = {_GEN_95[127:64],_T_149}; // @[Cat.scala 30:58]
  wire  _T_151 = io_cpu_wstrb == 8'h8; // @[cache.scala 114:26]
  wire [63:0] _T_154 = _GEN_95[63:0] & 64'hffffffff00ffffff; // @[cache.scala 114:89]
  wire [63:0] _T_155 = io_cpu_wdata & 64'hff000000; // @[cache.scala 114:127]
  wire [63:0] _T_156 = _T_154 | _T_155; // @[cache.scala 114:113]
  wire [127:0] _T_157 = {_GEN_95[127:64],_T_156}; // @[Cat.scala 30:58]
  wire  _T_158 = io_cpu_wstrb == 8'h4; // @[cache.scala 115:26]
  wire [63:0] _T_161 = _GEN_95[63:0] & 64'hffffffffff00ffff; // @[cache.scala 115:89]
  wire [63:0] _T_162 = io_cpu_wdata & 64'hff0000; // @[cache.scala 115:127]
  wire [63:0] _T_163 = _T_161 | _T_162; // @[cache.scala 115:113]
  wire [127:0] _T_164 = {_GEN_95[127:64],_T_163}; // @[Cat.scala 30:58]
  wire  _T_165 = io_cpu_wstrb == 8'h2; // @[cache.scala 116:26]
  wire [63:0] _T_168 = _GEN_95[63:0] & 64'hffffffffffff00ff; // @[cache.scala 116:89]
  wire [63:0] _T_169 = io_cpu_wdata & 64'hff00; // @[cache.scala 116:127]
  wire [63:0] _T_170 = _T_168 | _T_169; // @[cache.scala 116:113]
  wire [127:0] _T_171 = {_GEN_95[127:64],_T_170}; // @[Cat.scala 30:58]
  wire  _T_172 = io_cpu_wstrb == 8'h1; // @[cache.scala 117:26]
  wire [63:0] _T_175 = _GEN_95[63:0] & 64'hffffffffffffff00; // @[cache.scala 117:89]
  wire [63:0] _T_176 = io_cpu_wdata & 64'hff; // @[cache.scala 117:127]
  wire [63:0] _T_177 = _T_175 | _T_176; // @[cache.scala 117:113]
  wire [127:0] _T_178 = {_GEN_95[127:64],_T_177}; // @[Cat.scala 30:58]
  wire  _T_179 = io_cpu_wstrb == 8'hc0; // @[cache.scala 118:26]
  wire [63:0] _T_182 = _GEN_95[63:0] & 64'hffffffffffff; // @[cache.scala 118:89]
  wire [63:0] _T_183 = io_cpu_wdata & 64'hffff000000000000; // @[cache.scala 118:127]
  wire [63:0] _T_184 = _T_182 | _T_183; // @[cache.scala 118:113]
  wire [127:0] _T_185 = {_GEN_95[127:64],_T_184}; // @[Cat.scala 30:58]
  wire  _T_186 = io_cpu_wstrb == 8'h30; // @[cache.scala 119:26]
  wire [63:0] _T_189 = _GEN_95[63:0] & 64'hffff0000ffffffff; // @[cache.scala 119:89]
  wire [63:0] _T_190 = io_cpu_wdata & 64'hffff00000000; // @[cache.scala 119:127]
  wire [63:0] _T_191 = _T_189 | _T_190; // @[cache.scala 119:113]
  wire [127:0] _T_192 = {_GEN_95[127:64],_T_191}; // @[Cat.scala 30:58]
  wire  _T_193 = io_cpu_wstrb == 8'hc; // @[cache.scala 120:26]
  wire [63:0] _T_196 = _GEN_95[63:0] & 64'hffffffff0000ffff; // @[cache.scala 120:89]
  wire [63:0] _T_197 = io_cpu_wdata & 64'hffff0000; // @[cache.scala 120:127]
  wire [63:0] _T_198 = _T_196 | _T_197; // @[cache.scala 120:113]
  wire [127:0] _T_199 = {_GEN_95[127:64],_T_198}; // @[Cat.scala 30:58]
  wire  _T_200 = io_cpu_wstrb == 8'h3; // @[cache.scala 121:26]
  wire [63:0] _T_203 = _GEN_95[63:0] & 64'hffffffffffff0000; // @[cache.scala 121:89]
  wire [63:0] _T_204 = io_cpu_wdata & 64'hffff; // @[cache.scala 121:127]
  wire [63:0] _T_205 = _T_203 | _T_204; // @[cache.scala 121:113]
  wire [127:0] _T_206 = {_GEN_95[127:64],_T_205}; // @[Cat.scala 30:58]
  wire  _T_207 = io_cpu_wstrb == 8'hf0; // @[cache.scala 122:26]
  wire [63:0] _T_210 = _GEN_95[63:0] & 64'hffffffff; // @[cache.scala 122:89]
  wire [63:0] _T_211 = io_cpu_wdata & 64'hffffffff00000000; // @[cache.scala 122:127]
  wire [63:0] _T_212 = _T_210 | _T_211; // @[cache.scala 122:113]
  wire [127:0] _T_213 = {_GEN_95[127:64],_T_212}; // @[Cat.scala 30:58]
  wire  _T_214 = io_cpu_wstrb == 8'hf; // @[cache.scala 123:26]
  wire [63:0] _T_217 = _GEN_95[63:0] & 64'hffffffff00000000; // @[cache.scala 123:89]
  wire [63:0] _T_218 = io_cpu_wdata & 64'hffffffff; // @[cache.scala 123:127]
  wire [63:0] _T_219 = _T_217 | _T_218; // @[cache.scala 123:113]
  wire [127:0] _T_220 = {_GEN_95[127:64],_T_219}; // @[Cat.scala 30:58]
  wire  _T_221 = io_cpu_wstrb == 8'hff; // @[cache.scala 124:26]
  wire [127:0] _T_227 = {_GEN_95[127:64],io_cpu_wdata}; // @[Cat.scala 30:58]
  wire [127:0] _T_228 = _T_221 ? _T_227 : 128'h0; // @[Mux.scala 98:16]
  wire [127:0] _T_229 = _T_214 ? _T_220 : _T_228; // @[Mux.scala 98:16]
  wire [127:0] _T_230 = _T_207 ? _T_213 : _T_229; // @[Mux.scala 98:16]
  wire [127:0] _T_231 = _T_200 ? _T_206 : _T_230; // @[Mux.scala 98:16]
  wire [127:0] _T_232 = _T_193 ? _T_199 : _T_231; // @[Mux.scala 98:16]
  wire [127:0] _T_233 = _T_186 ? _T_192 : _T_232; // @[Mux.scala 98:16]
  wire [127:0] _T_234 = _T_179 ? _T_185 : _T_233; // @[Mux.scala 98:16]
  wire [127:0] _T_235 = _T_172 ? _T_178 : _T_234; // @[Mux.scala 98:16]
  wire [127:0] _T_236 = _T_165 ? _T_171 : _T_235; // @[Mux.scala 98:16]
  wire [127:0] _T_237 = _T_158 ? _T_164 : _T_236; // @[Mux.scala 98:16]
  wire [127:0] _T_238 = _T_151 ? _T_157 : _T_237; // @[Mux.scala 98:16]
  wire [127:0] _T_239 = _T_144 ? _T_150 : _T_238; // @[Mux.scala 98:16]
  wire [127:0] _T_240 = _T_137 ? _T_143 : _T_239; // @[Mux.scala 98:16]
  wire [127:0] _T_241 = _T_130 ? _T_136 : _T_240; // @[Mux.scala 98:16]
  wire [127:0] _T_242 = _T_123 ? _T_129 : _T_241; // @[Mux.scala 98:16]
  wire  _T_249 = ~addr_offset[3]; // @[cache.scala 125:80]
  wire  _T_250 = _T_119 & _T_249; // @[cache.scala 125:62]
  wire [63:0] _T_253 = _GEN_95[127:64] & 64'hffffffffffffff; // @[cache.scala 127:72]
  wire [63:0] _T_255 = _T_253 | _T_127; // @[cache.scala 127:96]
  wire [127:0] _T_257 = {_T_255,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_260 = _GEN_95[127:64] & 64'hff00ffffffffffff; // @[cache.scala 128:72]
  wire [63:0] _T_262 = _T_260 | _T_134; // @[cache.scala 128:96]
  wire [127:0] _T_264 = {_T_262,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_267 = _GEN_95[127:64] & 64'hffff00ffffffffff; // @[cache.scala 129:72]
  wire [63:0] _T_269 = _T_267 | _T_141; // @[cache.scala 129:96]
  wire [127:0] _T_271 = {_T_269,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_274 = _GEN_95[127:64] & 64'hffffff00ffffffff; // @[cache.scala 130:72]
  wire [63:0] _T_276 = _T_274 | _T_148; // @[cache.scala 130:96]
  wire [127:0] _T_278 = {_T_276,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_281 = _GEN_95[127:64] & 64'hffffffff00ffffff; // @[cache.scala 131:72]
  wire [63:0] _T_283 = _T_281 | _T_155; // @[cache.scala 131:96]
  wire [127:0] _T_285 = {_T_283,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_288 = _GEN_95[127:64] & 64'hffffffffff00ffff; // @[cache.scala 132:72]
  wire [63:0] _T_290 = _T_288 | _T_162; // @[cache.scala 132:96]
  wire [127:0] _T_292 = {_T_290,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_295 = _GEN_95[127:64] & 64'hffffffffffff00ff; // @[cache.scala 133:72]
  wire [63:0] _T_297 = _T_295 | _T_169; // @[cache.scala 133:96]
  wire [127:0] _T_299 = {_T_297,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_302 = _GEN_95[127:64] & 64'hffffffffffffff00; // @[cache.scala 134:72]
  wire [63:0] _T_304 = _T_302 | _T_176; // @[cache.scala 134:96]
  wire [127:0] _T_306 = {_T_304,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_309 = _GEN_95[127:64] & 64'hffffffffffff; // @[cache.scala 135:72]
  wire [63:0] _T_311 = _T_309 | _T_183; // @[cache.scala 135:96]
  wire [127:0] _T_313 = {_T_311,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_316 = _GEN_95[127:64] & 64'hffff0000ffffffff; // @[cache.scala 136:72]
  wire [63:0] _T_318 = _T_316 | _T_190; // @[cache.scala 136:96]
  wire [127:0] _T_320 = {_T_318,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_323 = _GEN_95[127:64] & 64'hffffffff0000ffff; // @[cache.scala 137:72]
  wire [63:0] _T_325 = _T_323 | _T_197; // @[cache.scala 137:96]
  wire [127:0] _T_327 = {_T_325,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_330 = _GEN_95[127:64] & 64'hffffffffffff0000; // @[cache.scala 138:72]
  wire [63:0] _T_332 = _T_330 | _T_204; // @[cache.scala 138:96]
  wire [127:0] _T_334 = {_T_332,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_337 = _GEN_95[127:64] & 64'hffffffff; // @[cache.scala 139:72]
  wire [63:0] _T_339 = _T_337 | _T_211; // @[cache.scala 139:96]
  wire [127:0] _T_341 = {_T_339,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_344 = _GEN_95[127:64] & 64'hffffffff00000000; // @[cache.scala 140:72]
  wire [63:0] _T_346 = _T_344 | _T_218; // @[cache.scala 140:96]
  wire [127:0] _T_348 = {_T_346,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [127:0] _T_355 = {io_cpu_wdata,_GEN_95[63:0]}; // @[Cat.scala 30:58]
  wire [127:0] _T_356 = _T_221 ? _T_355 : 128'h0; // @[Mux.scala 98:16]
  wire [127:0] _T_357 = _T_214 ? _T_348 : _T_356; // @[Mux.scala 98:16]
  wire [127:0] _T_358 = _T_207 ? _T_341 : _T_357; // @[Mux.scala 98:16]
  wire [127:0] _T_359 = _T_200 ? _T_334 : _T_358; // @[Mux.scala 98:16]
  wire [127:0] _T_360 = _T_193 ? _T_327 : _T_359; // @[Mux.scala 98:16]
  wire [127:0] _T_361 = _T_186 ? _T_320 : _T_360; // @[Mux.scala 98:16]
  wire [127:0] _T_362 = _T_179 ? _T_313 : _T_361; // @[Mux.scala 98:16]
  wire [127:0] _T_363 = _T_172 ? _T_306 : _T_362; // @[Mux.scala 98:16]
  wire [127:0] _T_364 = _T_165 ? _T_299 : _T_363; // @[Mux.scala 98:16]
  wire [127:0] _T_365 = _T_158 ? _T_292 : _T_364; // @[Mux.scala 98:16]
  wire [127:0] _T_366 = _T_151 ? _T_285 : _T_365; // @[Mux.scala 98:16]
  wire [127:0] _T_367 = _T_144 ? _T_278 : _T_366; // @[Mux.scala 98:16]
  wire [127:0] _T_368 = _T_137 ? _T_271 : _T_367; // @[Mux.scala 98:16]
  wire [127:0] _T_369 = _T_130 ? _T_264 : _T_368; // @[Mux.scala 98:16]
  wire [127:0] _T_370 = _T_123 ? _T_257 : _T_369; // @[Mux.scala 98:16]
  assign io_cpu_rdata = _T_18 ? _T_23 : _T_27; // @[cache.scala 54:16]
  assign io_operation_ok = {{63'd0}, _T_92}; // @[cache.scala 79:19]
  assign io_ram_req = _T_37 | _T_47; // @[cache.scala 64:14]
  assign io_ram_wr = _T_62 ? 1'h0 : _T_43; // @[cache.scala 71:15]
  assign io_ram_wstrb = _T_43 ? io_cpu_wstrb : 8'h0; // @[cache.scala 84:16]
  assign io_ram_addr = read_miss ? _T_71 : _T_77; // @[cache.scala 75:15]
  assign io_ram_wdata = _T_43 ? io_cpu_wdata : 64'h0; // @[cache.scala 85:16]
  assign io_uncached = _T_31 & io_cpu_addr[63]; // @[cache.scala 70:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  V_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  V_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  V_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  V_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  V_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  V_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  V_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  V_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  V_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  V_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  V_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  V_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  V_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  V_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  V_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  V_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  V_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  V_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  V_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  V_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  V_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  V_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  V_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  V_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  V_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  V_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  V_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  V_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  V_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  V_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  V_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  V_31 = _RAND_31[0:0];
  _RAND_32 = {2{`RANDOM}};
  Tag_0 = _RAND_32[54:0];
  _RAND_33 = {2{`RANDOM}};
  Tag_1 = _RAND_33[54:0];
  _RAND_34 = {2{`RANDOM}};
  Tag_2 = _RAND_34[54:0];
  _RAND_35 = {2{`RANDOM}};
  Tag_3 = _RAND_35[54:0];
  _RAND_36 = {2{`RANDOM}};
  Tag_4 = _RAND_36[54:0];
  _RAND_37 = {2{`RANDOM}};
  Tag_5 = _RAND_37[54:0];
  _RAND_38 = {2{`RANDOM}};
  Tag_6 = _RAND_38[54:0];
  _RAND_39 = {2{`RANDOM}};
  Tag_7 = _RAND_39[54:0];
  _RAND_40 = {2{`RANDOM}};
  Tag_8 = _RAND_40[54:0];
  _RAND_41 = {2{`RANDOM}};
  Tag_9 = _RAND_41[54:0];
  _RAND_42 = {2{`RANDOM}};
  Tag_10 = _RAND_42[54:0];
  _RAND_43 = {2{`RANDOM}};
  Tag_11 = _RAND_43[54:0];
  _RAND_44 = {2{`RANDOM}};
  Tag_12 = _RAND_44[54:0];
  _RAND_45 = {2{`RANDOM}};
  Tag_13 = _RAND_45[54:0];
  _RAND_46 = {2{`RANDOM}};
  Tag_14 = _RAND_46[54:0];
  _RAND_47 = {2{`RANDOM}};
  Tag_15 = _RAND_47[54:0];
  _RAND_48 = {2{`RANDOM}};
  Tag_16 = _RAND_48[54:0];
  _RAND_49 = {2{`RANDOM}};
  Tag_17 = _RAND_49[54:0];
  _RAND_50 = {2{`RANDOM}};
  Tag_18 = _RAND_50[54:0];
  _RAND_51 = {2{`RANDOM}};
  Tag_19 = _RAND_51[54:0];
  _RAND_52 = {2{`RANDOM}};
  Tag_20 = _RAND_52[54:0];
  _RAND_53 = {2{`RANDOM}};
  Tag_21 = _RAND_53[54:0];
  _RAND_54 = {2{`RANDOM}};
  Tag_22 = _RAND_54[54:0];
  _RAND_55 = {2{`RANDOM}};
  Tag_23 = _RAND_55[54:0];
  _RAND_56 = {2{`RANDOM}};
  Tag_24 = _RAND_56[54:0];
  _RAND_57 = {2{`RANDOM}};
  Tag_25 = _RAND_57[54:0];
  _RAND_58 = {2{`RANDOM}};
  Tag_26 = _RAND_58[54:0];
  _RAND_59 = {2{`RANDOM}};
  Tag_27 = _RAND_59[54:0];
  _RAND_60 = {2{`RANDOM}};
  Tag_28 = _RAND_60[54:0];
  _RAND_61 = {2{`RANDOM}};
  Tag_29 = _RAND_61[54:0];
  _RAND_62 = {2{`RANDOM}};
  Tag_30 = _RAND_62[54:0];
  _RAND_63 = {2{`RANDOM}};
  Tag_31 = _RAND_63[54:0];
  _RAND_64 = {4{`RANDOM}};
  Cache_line_0 = _RAND_64[127:0];
  _RAND_65 = {4{`RANDOM}};
  Cache_line_1 = _RAND_65[127:0];
  _RAND_66 = {4{`RANDOM}};
  Cache_line_2 = _RAND_66[127:0];
  _RAND_67 = {4{`RANDOM}};
  Cache_line_3 = _RAND_67[127:0];
  _RAND_68 = {4{`RANDOM}};
  Cache_line_4 = _RAND_68[127:0];
  _RAND_69 = {4{`RANDOM}};
  Cache_line_5 = _RAND_69[127:0];
  _RAND_70 = {4{`RANDOM}};
  Cache_line_6 = _RAND_70[127:0];
  _RAND_71 = {4{`RANDOM}};
  Cache_line_7 = _RAND_71[127:0];
  _RAND_72 = {4{`RANDOM}};
  Cache_line_8 = _RAND_72[127:0];
  _RAND_73 = {4{`RANDOM}};
  Cache_line_9 = _RAND_73[127:0];
  _RAND_74 = {4{`RANDOM}};
  Cache_line_10 = _RAND_74[127:0];
  _RAND_75 = {4{`RANDOM}};
  Cache_line_11 = _RAND_75[127:0];
  _RAND_76 = {4{`RANDOM}};
  Cache_line_12 = _RAND_76[127:0];
  _RAND_77 = {4{`RANDOM}};
  Cache_line_13 = _RAND_77[127:0];
  _RAND_78 = {4{`RANDOM}};
  Cache_line_14 = _RAND_78[127:0];
  _RAND_79 = {4{`RANDOM}};
  Cache_line_15 = _RAND_79[127:0];
  _RAND_80 = {4{`RANDOM}};
  Cache_line_16 = _RAND_80[127:0];
  _RAND_81 = {4{`RANDOM}};
  Cache_line_17 = _RAND_81[127:0];
  _RAND_82 = {4{`RANDOM}};
  Cache_line_18 = _RAND_82[127:0];
  _RAND_83 = {4{`RANDOM}};
  Cache_line_19 = _RAND_83[127:0];
  _RAND_84 = {4{`RANDOM}};
  Cache_line_20 = _RAND_84[127:0];
  _RAND_85 = {4{`RANDOM}};
  Cache_line_21 = _RAND_85[127:0];
  _RAND_86 = {4{`RANDOM}};
  Cache_line_22 = _RAND_86[127:0];
  _RAND_87 = {4{`RANDOM}};
  Cache_line_23 = _RAND_87[127:0];
  _RAND_88 = {4{`RANDOM}};
  Cache_line_24 = _RAND_88[127:0];
  _RAND_89 = {4{`RANDOM}};
  Cache_line_25 = _RAND_89[127:0];
  _RAND_90 = {4{`RANDOM}};
  Cache_line_26 = _RAND_90[127:0];
  _RAND_91 = {4{`RANDOM}};
  Cache_line_27 = _RAND_91[127:0];
  _RAND_92 = {4{`RANDOM}};
  Cache_line_28 = _RAND_92[127:0];
  _RAND_93 = {4{`RANDOM}};
  Cache_line_29 = _RAND_93[127:0];
  _RAND_94 = {4{`RANDOM}};
  Cache_line_30 = _RAND_94[127:0];
  _RAND_95 = {4{`RANDOM}};
  Cache_line_31 = _RAND_95[127:0];
  _RAND_96 = {1{`RANDOM}};
  req = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  cnt = _RAND_97[1:0];
  _RAND_98 = {1{`RANDOM}};
  addr_index_temp = _RAND_98[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      V_0 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_0 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_0 <= _GEN_192;
      end
    end
    if (reset) begin
      V_1 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_1 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_1 <= _GEN_193;
      end
    end
    if (reset) begin
      V_2 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_2 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_2 <= _GEN_194;
      end
    end
    if (reset) begin
      V_3 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_3 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_3 <= _GEN_195;
      end
    end
    if (reset) begin
      V_4 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_4 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_4 <= _GEN_196;
      end
    end
    if (reset) begin
      V_5 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_5 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_5 <= _GEN_197;
      end
    end
    if (reset) begin
      V_6 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_6 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_6 <= _GEN_198;
      end
    end
    if (reset) begin
      V_7 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_7 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_7 <= _GEN_199;
      end
    end
    if (reset) begin
      V_8 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_8 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_8 <= _GEN_200;
      end
    end
    if (reset) begin
      V_9 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_9 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_9 <= _GEN_201;
      end
    end
    if (reset) begin
      V_10 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_10 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_10 <= _GEN_202;
      end
    end
    if (reset) begin
      V_11 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_11 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_11 <= _GEN_203;
      end
    end
    if (reset) begin
      V_12 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_12 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_12 <= _GEN_204;
      end
    end
    if (reset) begin
      V_13 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_13 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_13 <= _GEN_205;
      end
    end
    if (reset) begin
      V_14 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_14 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_14 <= _GEN_206;
      end
    end
    if (reset) begin
      V_15 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_15 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_15 <= _GEN_207;
      end
    end
    if (reset) begin
      V_16 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_16 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_16 <= _GEN_208;
      end
    end
    if (reset) begin
      V_17 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_17 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_17 <= _GEN_209;
      end
    end
    if (reset) begin
      V_18 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_18 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_18 <= _GEN_210;
      end
    end
    if (reset) begin
      V_19 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_19 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_19 <= _GEN_211;
      end
    end
    if (reset) begin
      V_20 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_20 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_20 <= _GEN_212;
      end
    end
    if (reset) begin
      V_21 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_21 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_21 <= _GEN_213;
      end
    end
    if (reset) begin
      V_22 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_22 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_22 <= _GEN_214;
      end
    end
    if (reset) begin
      V_23 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_23 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_23 <= _GEN_215;
      end
    end
    if (reset) begin
      V_24 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_24 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_24 <= _GEN_216;
      end
    end
    if (reset) begin
      V_25 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_25 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_25 <= _GEN_217;
      end
    end
    if (reset) begin
      V_26 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_26 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_26 <= _GEN_218;
      end
    end
    if (reset) begin
      V_27 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_27 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_27 <= _GEN_219;
      end
    end
    if (reset) begin
      V_28 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_28 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_28 <= _GEN_220;
      end
    end
    if (reset) begin
      V_29 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_29 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_29 <= _GEN_221;
      end
    end
    if (reset) begin
      V_30 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_30 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_30 <= _GEN_222;
      end
    end
    if (reset) begin
      V_31 <= 1'h0;
    end else if (io_cache_invalid) begin
      V_31 <= 1'h0;
    end else if (_T_109) begin
      if (_T_110) begin
        V_31 <= _GEN_223;
      end
    end
    if (reset) begin
      Tag_0 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h0 == addr_index_temp) begin
            Tag_0 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_1 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1 == addr_index_temp) begin
            Tag_1 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_2 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h2 == addr_index_temp) begin
            Tag_2 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_3 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h3 == addr_index_temp) begin
            Tag_3 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_4 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h4 == addr_index_temp) begin
            Tag_4 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_5 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h5 == addr_index_temp) begin
            Tag_5 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_6 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h6 == addr_index_temp) begin
            Tag_6 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_7 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h7 == addr_index_temp) begin
            Tag_7 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_8 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h8 == addr_index_temp) begin
            Tag_8 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_9 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h9 == addr_index_temp) begin
            Tag_9 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_10 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'ha == addr_index_temp) begin
            Tag_10 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_11 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'hb == addr_index_temp) begin
            Tag_11 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_12 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'hc == addr_index_temp) begin
            Tag_12 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_13 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'hd == addr_index_temp) begin
            Tag_13 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_14 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'he == addr_index_temp) begin
            Tag_14 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_15 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'hf == addr_index_temp) begin
            Tag_15 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_16 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h10 == addr_index_temp) begin
            Tag_16 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_17 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h11 == addr_index_temp) begin
            Tag_17 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_18 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h12 == addr_index_temp) begin
            Tag_18 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_19 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h13 == addr_index_temp) begin
            Tag_19 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_20 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h14 == addr_index_temp) begin
            Tag_20 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_21 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h15 == addr_index_temp) begin
            Tag_21 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_22 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h16 == addr_index_temp) begin
            Tag_22 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_23 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h17 == addr_index_temp) begin
            Tag_23 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_24 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h18 == addr_index_temp) begin
            Tag_24 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_25 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h19 == addr_index_temp) begin
            Tag_25 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_26 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1a == addr_index_temp) begin
            Tag_26 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_27 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1b == addr_index_temp) begin
            Tag_27 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_28 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1c == addr_index_temp) begin
            Tag_28 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_29 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1d == addr_index_temp) begin
            Tag_29 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_30 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1e == addr_index_temp) begin
            Tag_30 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Tag_31 <= 55'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1f == addr_index_temp) begin
            Tag_31 <= addr_tag;
          end
        end
      end
    end
    if (reset) begin
      Cache_line_0 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h0 == addr_index_temp) begin
            Cache_line_0 <= _T_112;
          end
        end else if (5'h0 == addr_index_temp) begin
          Cache_line_0 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h0 == addr_index) begin
          if (_T_123) begin
            Cache_line_0 <= _T_129;
          end else if (_T_130) begin
            Cache_line_0 <= _T_136;
          end else if (_T_137) begin
            Cache_line_0 <= _T_143;
          end else if (_T_144) begin
            Cache_line_0 <= _T_150;
          end else if (_T_151) begin
            Cache_line_0 <= _T_157;
          end else if (_T_158) begin
            Cache_line_0 <= _T_164;
          end else if (_T_165) begin
            Cache_line_0 <= _T_171;
          end else if (_T_172) begin
            Cache_line_0 <= _T_178;
          end else if (_T_179) begin
            Cache_line_0 <= _T_185;
          end else if (_T_186) begin
            Cache_line_0 <= _T_192;
          end else if (_T_193) begin
            Cache_line_0 <= _T_199;
          end else if (_T_200) begin
            Cache_line_0 <= _T_206;
          end else if (_T_207) begin
            Cache_line_0 <= _T_213;
          end else if (_T_214) begin
            Cache_line_0 <= _T_220;
          end else if (_T_221) begin
            Cache_line_0 <= _T_227;
          end else begin
            Cache_line_0 <= 128'h0;
          end
        end
      end else if (_T_250) begin
        if (5'h0 == addr_index) begin
          if (_T_123) begin
            Cache_line_0 <= _T_257;
          end else if (_T_130) begin
            Cache_line_0 <= _T_264;
          end else if (_T_137) begin
            Cache_line_0 <= _T_271;
          end else if (_T_144) begin
            Cache_line_0 <= _T_278;
          end else if (_T_151) begin
            Cache_line_0 <= _T_285;
          end else if (_T_158) begin
            Cache_line_0 <= _T_292;
          end else if (_T_165) begin
            Cache_line_0 <= _T_299;
          end else if (_T_172) begin
            Cache_line_0 <= _T_306;
          end else if (_T_179) begin
            Cache_line_0 <= _T_313;
          end else if (_T_186) begin
            Cache_line_0 <= _T_320;
          end else if (_T_193) begin
            Cache_line_0 <= _T_327;
          end else if (_T_200) begin
            Cache_line_0 <= _T_334;
          end else if (_T_207) begin
            Cache_line_0 <= _T_341;
          end else if (_T_214) begin
            Cache_line_0 <= _T_348;
          end else if (_T_221) begin
            Cache_line_0 <= _T_355;
          end else begin
            Cache_line_0 <= 128'h0;
          end
        end
      end
    end
    if (reset) begin
      Cache_line_1 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1 == addr_index_temp) begin
            Cache_line_1 <= _T_112;
          end
        end else if (5'h1 == addr_index_temp) begin
          Cache_line_1 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h1 == addr_index) begin
          if (_T_123) begin
            Cache_line_1 <= _T_129;
          end else if (_T_130) begin
            Cache_line_1 <= _T_136;
          end else if (_T_137) begin
            Cache_line_1 <= _T_143;
          end else if (_T_144) begin
            Cache_line_1 <= _T_150;
          end else if (_T_151) begin
            Cache_line_1 <= _T_157;
          end else if (_T_158) begin
            Cache_line_1 <= _T_164;
          end else if (_T_165) begin
            Cache_line_1 <= _T_171;
          end else if (_T_172) begin
            Cache_line_1 <= _T_178;
          end else if (_T_179) begin
            Cache_line_1 <= _T_185;
          end else if (_T_186) begin
            Cache_line_1 <= _T_192;
          end else if (_T_193) begin
            Cache_line_1 <= _T_199;
          end else if (_T_200) begin
            Cache_line_1 <= _T_206;
          end else if (_T_207) begin
            Cache_line_1 <= _T_213;
          end else if (_T_214) begin
            Cache_line_1 <= _T_220;
          end else if (_T_221) begin
            Cache_line_1 <= _T_227;
          end else begin
            Cache_line_1 <= 128'h0;
          end
        end
      end else if (_T_250) begin
        if (5'h1 == addr_index) begin
          if (_T_123) begin
            Cache_line_1 <= _T_257;
          end else if (_T_130) begin
            Cache_line_1 <= _T_264;
          end else if (_T_137) begin
            Cache_line_1 <= _T_271;
          end else if (_T_144) begin
            Cache_line_1 <= _T_278;
          end else if (_T_151) begin
            Cache_line_1 <= _T_285;
          end else if (_T_158) begin
            Cache_line_1 <= _T_292;
          end else if (_T_165) begin
            Cache_line_1 <= _T_299;
          end else if (_T_172) begin
            Cache_line_1 <= _T_306;
          end else if (_T_179) begin
            Cache_line_1 <= _T_313;
          end else if (_T_186) begin
            Cache_line_1 <= _T_320;
          end else if (_T_193) begin
            Cache_line_1 <= _T_327;
          end else if (_T_200) begin
            Cache_line_1 <= _T_334;
          end else if (_T_207) begin
            Cache_line_1 <= _T_341;
          end else if (_T_214) begin
            Cache_line_1 <= _T_348;
          end else if (_T_221) begin
            Cache_line_1 <= _T_355;
          end else begin
            Cache_line_1 <= 128'h0;
          end
        end
      end
    end
    if (reset) begin
      Cache_line_2 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h2 == addr_index_temp) begin
            Cache_line_2 <= _T_112;
          end
        end else if (5'h2 == addr_index_temp) begin
          Cache_line_2 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h2 == addr_index) begin
          if (_T_123) begin
            Cache_line_2 <= _T_129;
          end else if (_T_130) begin
            Cache_line_2 <= _T_136;
          end else if (_T_137) begin
            Cache_line_2 <= _T_143;
          end else if (_T_144) begin
            Cache_line_2 <= _T_150;
          end else if (_T_151) begin
            Cache_line_2 <= _T_157;
          end else if (_T_158) begin
            Cache_line_2 <= _T_164;
          end else if (_T_165) begin
            Cache_line_2 <= _T_171;
          end else if (_T_172) begin
            Cache_line_2 <= _T_178;
          end else if (_T_179) begin
            Cache_line_2 <= _T_185;
          end else if (_T_186) begin
            Cache_line_2 <= _T_192;
          end else if (_T_193) begin
            Cache_line_2 <= _T_199;
          end else if (_T_200) begin
            Cache_line_2 <= _T_206;
          end else if (_T_207) begin
            Cache_line_2 <= _T_213;
          end else if (_T_214) begin
            Cache_line_2 <= _T_220;
          end else if (_T_221) begin
            Cache_line_2 <= _T_227;
          end else begin
            Cache_line_2 <= 128'h0;
          end
        end
      end else if (_T_250) begin
        if (5'h2 == addr_index) begin
          if (_T_123) begin
            Cache_line_2 <= _T_257;
          end else if (_T_130) begin
            Cache_line_2 <= _T_264;
          end else if (_T_137) begin
            Cache_line_2 <= _T_271;
          end else if (_T_144) begin
            Cache_line_2 <= _T_278;
          end else if (_T_151) begin
            Cache_line_2 <= _T_285;
          end else if (_T_158) begin
            Cache_line_2 <= _T_292;
          end else if (_T_165) begin
            Cache_line_2 <= _T_299;
          end else if (_T_172) begin
            Cache_line_2 <= _T_306;
          end else if (_T_179) begin
            Cache_line_2 <= _T_313;
          end else if (_T_186) begin
            Cache_line_2 <= _T_320;
          end else if (_T_193) begin
            Cache_line_2 <= _T_327;
          end else if (_T_200) begin
            Cache_line_2 <= _T_334;
          end else if (_T_207) begin
            Cache_line_2 <= _T_341;
          end else if (_T_214) begin
            Cache_line_2 <= _T_348;
          end else if (_T_221) begin
            Cache_line_2 <= _T_355;
          end else begin
            Cache_line_2 <= 128'h0;
          end
        end
      end
    end
    if (reset) begin
      Cache_line_3 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h3 == addr_index_temp) begin
            Cache_line_3 <= _T_112;
          end
        end else if (5'h3 == addr_index_temp) begin
          Cache_line_3 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h3 == addr_index) begin
          if (_T_123) begin
            Cache_line_3 <= _T_129;
          end else if (_T_130) begin
            Cache_line_3 <= _T_136;
          end else if (_T_137) begin
            Cache_line_3 <= _T_143;
          end else if (_T_144) begin
            Cache_line_3 <= _T_150;
          end else if (_T_151) begin
            Cache_line_3 <= _T_157;
          end else if (_T_158) begin
            Cache_line_3 <= _T_164;
          end else if (_T_165) begin
            Cache_line_3 <= _T_171;
          end else if (_T_172) begin
            Cache_line_3 <= _T_178;
          end else if (_T_179) begin
            Cache_line_3 <= _T_185;
          end else if (_T_186) begin
            Cache_line_3 <= _T_192;
          end else if (_T_193) begin
            Cache_line_3 <= _T_199;
          end else if (_T_200) begin
            Cache_line_3 <= _T_206;
          end else if (_T_207) begin
            Cache_line_3 <= _T_213;
          end else if (_T_214) begin
            Cache_line_3 <= _T_220;
          end else if (_T_221) begin
            Cache_line_3 <= _T_227;
          end else begin
            Cache_line_3 <= 128'h0;
          end
        end
      end else if (_T_250) begin
        if (5'h3 == addr_index) begin
          if (_T_123) begin
            Cache_line_3 <= _T_257;
          end else if (_T_130) begin
            Cache_line_3 <= _T_264;
          end else if (_T_137) begin
            Cache_line_3 <= _T_271;
          end else if (_T_144) begin
            Cache_line_3 <= _T_278;
          end else if (_T_151) begin
            Cache_line_3 <= _T_285;
          end else if (_T_158) begin
            Cache_line_3 <= _T_292;
          end else if (_T_165) begin
            Cache_line_3 <= _T_299;
          end else if (_T_172) begin
            Cache_line_3 <= _T_306;
          end else if (_T_179) begin
            Cache_line_3 <= _T_313;
          end else if (_T_186) begin
            Cache_line_3 <= _T_320;
          end else if (_T_193) begin
            Cache_line_3 <= _T_327;
          end else if (_T_200) begin
            Cache_line_3 <= _T_334;
          end else if (_T_207) begin
            Cache_line_3 <= _T_341;
          end else if (_T_214) begin
            Cache_line_3 <= _T_348;
          end else if (_T_221) begin
            Cache_line_3 <= _T_355;
          end else begin
            Cache_line_3 <= 128'h0;
          end
        end
      end
    end
    if (reset) begin
      Cache_line_4 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h4 == addr_index_temp) begin
            Cache_line_4 <= _T_112;
          end
        end else if (5'h4 == addr_index_temp) begin
          Cache_line_4 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h4 == addr_index) begin
          Cache_line_4 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h4 == addr_index) begin
          Cache_line_4 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_5 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h5 == addr_index_temp) begin
            Cache_line_5 <= _T_112;
          end
        end else if (5'h5 == addr_index_temp) begin
          Cache_line_5 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h5 == addr_index) begin
          Cache_line_5 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h5 == addr_index) begin
          Cache_line_5 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_6 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h6 == addr_index_temp) begin
            Cache_line_6 <= _T_112;
          end
        end else if (5'h6 == addr_index_temp) begin
          Cache_line_6 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h6 == addr_index) begin
          Cache_line_6 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h6 == addr_index) begin
          Cache_line_6 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_7 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h7 == addr_index_temp) begin
            Cache_line_7 <= _T_112;
          end
        end else if (5'h7 == addr_index_temp) begin
          Cache_line_7 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h7 == addr_index) begin
          Cache_line_7 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h7 == addr_index) begin
          Cache_line_7 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_8 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h8 == addr_index_temp) begin
            Cache_line_8 <= _T_112;
          end
        end else if (5'h8 == addr_index_temp) begin
          Cache_line_8 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h8 == addr_index) begin
          Cache_line_8 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h8 == addr_index) begin
          Cache_line_8 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_9 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h9 == addr_index_temp) begin
            Cache_line_9 <= _T_112;
          end
        end else if (5'h9 == addr_index_temp) begin
          Cache_line_9 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h9 == addr_index) begin
          Cache_line_9 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h9 == addr_index) begin
          Cache_line_9 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_10 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'ha == addr_index_temp) begin
            Cache_line_10 <= _T_112;
          end
        end else if (5'ha == addr_index_temp) begin
          Cache_line_10 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'ha == addr_index) begin
          Cache_line_10 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'ha == addr_index) begin
          Cache_line_10 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_11 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'hb == addr_index_temp) begin
            Cache_line_11 <= _T_112;
          end
        end else if (5'hb == addr_index_temp) begin
          Cache_line_11 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'hb == addr_index) begin
          Cache_line_11 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'hb == addr_index) begin
          Cache_line_11 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_12 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'hc == addr_index_temp) begin
            Cache_line_12 <= _T_112;
          end
        end else if (5'hc == addr_index_temp) begin
          Cache_line_12 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'hc == addr_index) begin
          Cache_line_12 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'hc == addr_index) begin
          Cache_line_12 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_13 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'hd == addr_index_temp) begin
            Cache_line_13 <= _T_112;
          end
        end else if (5'hd == addr_index_temp) begin
          Cache_line_13 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'hd == addr_index) begin
          Cache_line_13 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'hd == addr_index) begin
          Cache_line_13 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_14 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'he == addr_index_temp) begin
            Cache_line_14 <= _T_112;
          end
        end else if (5'he == addr_index_temp) begin
          Cache_line_14 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'he == addr_index) begin
          Cache_line_14 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'he == addr_index) begin
          Cache_line_14 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_15 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'hf == addr_index_temp) begin
            Cache_line_15 <= _T_112;
          end
        end else if (5'hf == addr_index_temp) begin
          Cache_line_15 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'hf == addr_index) begin
          Cache_line_15 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'hf == addr_index) begin
          Cache_line_15 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_16 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h10 == addr_index_temp) begin
            Cache_line_16 <= _T_112;
          end
        end else if (5'h10 == addr_index_temp) begin
          Cache_line_16 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h10 == addr_index) begin
          Cache_line_16 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h10 == addr_index) begin
          Cache_line_16 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_17 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h11 == addr_index_temp) begin
            Cache_line_17 <= _T_112;
          end
        end else if (5'h11 == addr_index_temp) begin
          Cache_line_17 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h11 == addr_index) begin
          Cache_line_17 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h11 == addr_index) begin
          Cache_line_17 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_18 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h12 == addr_index_temp) begin
            Cache_line_18 <= _T_112;
          end
        end else if (5'h12 == addr_index_temp) begin
          Cache_line_18 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h12 == addr_index) begin
          Cache_line_18 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h12 == addr_index) begin
          Cache_line_18 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_19 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h13 == addr_index_temp) begin
            Cache_line_19 <= _T_112;
          end
        end else if (5'h13 == addr_index_temp) begin
          Cache_line_19 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h13 == addr_index) begin
          Cache_line_19 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h13 == addr_index) begin
          Cache_line_19 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_20 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h14 == addr_index_temp) begin
            Cache_line_20 <= _T_112;
          end
        end else if (5'h14 == addr_index_temp) begin
          Cache_line_20 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h14 == addr_index) begin
          Cache_line_20 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h14 == addr_index) begin
          Cache_line_20 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_21 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h15 == addr_index_temp) begin
            Cache_line_21 <= _T_112;
          end
        end else if (5'h15 == addr_index_temp) begin
          Cache_line_21 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h15 == addr_index) begin
          Cache_line_21 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h15 == addr_index) begin
          Cache_line_21 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_22 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h16 == addr_index_temp) begin
            Cache_line_22 <= _T_112;
          end
        end else if (5'h16 == addr_index_temp) begin
          Cache_line_22 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h16 == addr_index) begin
          Cache_line_22 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h16 == addr_index) begin
          Cache_line_22 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_23 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h17 == addr_index_temp) begin
            Cache_line_23 <= _T_112;
          end
        end else if (5'h17 == addr_index_temp) begin
          Cache_line_23 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h17 == addr_index) begin
          Cache_line_23 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h17 == addr_index) begin
          Cache_line_23 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_24 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h18 == addr_index_temp) begin
            Cache_line_24 <= _T_112;
          end
        end else if (5'h18 == addr_index_temp) begin
          Cache_line_24 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h18 == addr_index) begin
          Cache_line_24 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h18 == addr_index) begin
          Cache_line_24 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_25 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h19 == addr_index_temp) begin
            Cache_line_25 <= _T_112;
          end
        end else if (5'h19 == addr_index_temp) begin
          Cache_line_25 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h19 == addr_index) begin
          Cache_line_25 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h19 == addr_index) begin
          Cache_line_25 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_26 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1a == addr_index_temp) begin
            Cache_line_26 <= _T_112;
          end
        end else if (5'h1a == addr_index_temp) begin
          Cache_line_26 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h1a == addr_index) begin
          Cache_line_26 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h1a == addr_index) begin
          Cache_line_26 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_27 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1b == addr_index_temp) begin
            Cache_line_27 <= _T_112;
          end
        end else if (5'h1b == addr_index_temp) begin
          Cache_line_27 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h1b == addr_index) begin
          Cache_line_27 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h1b == addr_index) begin
          Cache_line_27 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_28 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1c == addr_index_temp) begin
            Cache_line_28 <= _T_112;
          end
        end else if (5'h1c == addr_index_temp) begin
          Cache_line_28 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h1c == addr_index) begin
          Cache_line_28 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h1c == addr_index) begin
          Cache_line_28 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_29 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1d == addr_index_temp) begin
            Cache_line_29 <= _T_112;
          end
        end else if (5'h1d == addr_index_temp) begin
          Cache_line_29 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h1d == addr_index) begin
          Cache_line_29 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h1d == addr_index) begin
          Cache_line_29 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_30 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1e == addr_index_temp) begin
            Cache_line_30 <= _T_112;
          end
        end else if (5'h1e == addr_index_temp) begin
          Cache_line_30 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h1e == addr_index) begin
          Cache_line_30 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h1e == addr_index) begin
          Cache_line_30 <= _T_370;
        end
      end
    end
    if (reset) begin
      Cache_line_31 <= 128'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        if (_T_110) begin
          if (5'h1f == addr_index_temp) begin
            Cache_line_31 <= _T_112;
          end
        end else if (5'h1f == addr_index_temp) begin
          Cache_line_31 <= _T_114;
        end
      end else if (_T_122) begin
        if (5'h1f == addr_index) begin
          Cache_line_31 <= _T_242;
        end
      end else if (_T_250) begin
        if (5'h1f == addr_index) begin
          Cache_line_31 <= _T_370;
        end
      end
    end
    if (reset) begin
      req <= 1'h0;
    end else if (_T_3) begin
      req <= 1'h0;
    end else begin
      req <= _T_7;
    end
    if (reset) begin
      cnt <= 2'h0;
    end else if (!(io_cache_invalid)) begin
      if (_T_109) begin
        cnt <= {{1'd0}, _GEN_352};
      end
    end
    if (reset) begin
      addr_index_temp <= 5'h0;
    end else if (!(_T_37)) begin
      addr_index_temp <= addr_index;
    end
  end
endmodule
module myc01_wrapper(
  input         clock,
  input         reset,
  output [3:0]  io_arid,
  output [63:0] io_araddr,
  output [7:0]  io_arlen,
  output [2:0]  io_arsize,
  output [1:0]  io_arburst,
  output [1:0]  io_arlock,
  output [3:0]  io_arcache,
  output [2:0]  io_arprot,
  output        io_arvalid,
  input         io_arready,
  input  [3:0]  io_rid,
  input  [63:0] io_rdata,
  input  [1:0]  io_rresp,
  input         io_rlast,
  input         io_rvalid,
  output        io_rready,
  output [3:0]  io_awid,
  output [63:0] io_awaddr,
  output [7:0]  io_awlen,
  output [2:0]  io_awsize,
  output [1:0]  io_awburst,
  output [1:0]  io_awlock,
  output [3:0]  io_awcache,
  output [2:0]  io_awprot,
  output        io_awvalid,
  input         io_awready,
  output [3:0]  io_wid,
  output [63:0] io_wdata,
  output [7:0]  io_wstrb,
  output        io_wlast,
  output        io_wvalid,
  input         io_wready,
  input  [3:0]  io_bid,
  input  [1:0]  io_bresp,
  input         io_bvalid,
  output        io_bready,
  input         io_int_i_1,
  input         io_int_i_2,
  input         io_int_i_3,
  input         io_int_i_4,
  input         io_int_i_5,
  input         io_int_i_6
);
  wire  myc01_core_clock; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_reset; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_inst_req; // @[myc01_wrapper.scala 72:28]
  wire [63:0] myc01_core_io_inst_addr; // @[myc01_wrapper.scala 72:28]
  wire [63:0] myc01_core_io_inst_rdata; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_inst_data_ok; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_icache_invalid; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_data_req; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_data_we; // @[myc01_wrapper.scala 72:28]
  wire [7:0] myc01_core_io_data_wstrb; // @[myc01_wrapper.scala 72:28]
  wire [63:0] myc01_core_io_data_addr; // @[myc01_wrapper.scala 72:28]
  wire [63:0] myc01_core_io_data_wdata; // @[myc01_wrapper.scala 72:28]
  wire [63:0] myc01_core_io_data_rdata; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_data_data_ok; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_int_i_1; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_int_i_2; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_int_i_3; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_int_i_4; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_int_i_5; // @[myc01_wrapper.scala 72:28]
  wire  myc01_core_io_int_i_6; // @[myc01_wrapper.scala 72:28]
  wire  axi_interface_clock; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_reset; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_inst_req; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_inst_we; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_inst_addr; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_inst_rdata; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_inst_beat_ok; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_inst_data_ok; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_inst_uncached; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_data_req; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_data_we; // @[myc01_wrapper.scala 73:31]
  wire [7:0] axi_interface_io_data_wstrb; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_data_addr; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_data_wdata; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_data_rdata; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_data_beat_ok; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_data_data_ok; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_data_uncached; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_araddr; // @[myc01_wrapper.scala 73:31]
  wire [7:0] axi_interface_io_arlen; // @[myc01_wrapper.scala 73:31]
  wire [2:0] axi_interface_io_arsize; // @[myc01_wrapper.scala 73:31]
  wire [1:0] axi_interface_io_arburst; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_arvalid; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_arready; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_rdata; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_rlast; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_rvalid; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_rready; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_awaddr; // @[myc01_wrapper.scala 73:31]
  wire [2:0] axi_interface_io_awsize; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_awvalid; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_awready; // @[myc01_wrapper.scala 73:31]
  wire [63:0] axi_interface_io_wdata; // @[myc01_wrapper.scala 73:31]
  wire [7:0] axi_interface_io_wstrb; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_wvalid; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_bvalid; // @[myc01_wrapper.scala 73:31]
  wire  axi_interface_io_bready; // @[myc01_wrapper.scala 73:31]
  wire  icache_clock; // @[myc01_wrapper.scala 74:25]
  wire  icache_reset; // @[myc01_wrapper.scala 74:25]
  wire  icache_io_cpu_req; // @[myc01_wrapper.scala 74:25]
  wire [63:0] icache_io_cpu_addr; // @[myc01_wrapper.scala 74:25]
  wire  icache_io_cpu_wr; // @[myc01_wrapper.scala 74:25]
  wire [7:0] icache_io_cpu_wstrb; // @[myc01_wrapper.scala 74:25]
  wire [63:0] icache_io_cpu_wdata; // @[myc01_wrapper.scala 74:25]
  wire [63:0] icache_io_cpu_rdata; // @[myc01_wrapper.scala 74:25]
  wire [63:0] icache_io_operation_ok; // @[myc01_wrapper.scala 74:25]
  wire  icache_io_cache_invalid; // @[myc01_wrapper.scala 74:25]
  wire  icache_io_ram_req; // @[myc01_wrapper.scala 74:25]
  wire  icache_io_ram_wr; // @[myc01_wrapper.scala 74:25]
  wire [7:0] icache_io_ram_wstrb; // @[myc01_wrapper.scala 74:25]
  wire [63:0] icache_io_ram_addr; // @[myc01_wrapper.scala 74:25]
  wire [63:0] icache_io_ram_wdata; // @[myc01_wrapper.scala 74:25]
  wire [63:0] icache_io_ram_rdata; // @[myc01_wrapper.scala 74:25]
  wire  icache_io_ram_beat_ok; // @[myc01_wrapper.scala 74:25]
  wire  icache_io_ram_data_ok; // @[myc01_wrapper.scala 74:25]
  wire  icache_io_uncached; // @[myc01_wrapper.scala 74:25]
  wire  dcache_clock; // @[myc01_wrapper.scala 75:25]
  wire  dcache_reset; // @[myc01_wrapper.scala 75:25]
  wire  dcache_io_cpu_req; // @[myc01_wrapper.scala 75:25]
  wire [63:0] dcache_io_cpu_addr; // @[myc01_wrapper.scala 75:25]
  wire  dcache_io_cpu_wr; // @[myc01_wrapper.scala 75:25]
  wire [7:0] dcache_io_cpu_wstrb; // @[myc01_wrapper.scala 75:25]
  wire [63:0] dcache_io_cpu_wdata; // @[myc01_wrapper.scala 75:25]
  wire [63:0] dcache_io_cpu_rdata; // @[myc01_wrapper.scala 75:25]
  wire [63:0] dcache_io_operation_ok; // @[myc01_wrapper.scala 75:25]
  wire  dcache_io_cache_invalid; // @[myc01_wrapper.scala 75:25]
  wire  dcache_io_ram_req; // @[myc01_wrapper.scala 75:25]
  wire  dcache_io_ram_wr; // @[myc01_wrapper.scala 75:25]
  wire [7:0] dcache_io_ram_wstrb; // @[myc01_wrapper.scala 75:25]
  wire [63:0] dcache_io_ram_addr; // @[myc01_wrapper.scala 75:25]
  wire [63:0] dcache_io_ram_wdata; // @[myc01_wrapper.scala 75:25]
  wire [63:0] dcache_io_ram_rdata; // @[myc01_wrapper.scala 75:25]
  wire  dcache_io_ram_beat_ok; // @[myc01_wrapper.scala 75:25]
  wire  dcache_io_ram_data_ok; // @[myc01_wrapper.scala 75:25]
  wire  dcache_io_uncached; // @[myc01_wrapper.scala 75:25]
  myc01_core myc01_core ( // @[myc01_wrapper.scala 72:28]
    .clock(myc01_core_clock),
    .reset(myc01_core_reset),
    .io_inst_req(myc01_core_io_inst_req),
    .io_inst_addr(myc01_core_io_inst_addr),
    .io_inst_rdata(myc01_core_io_inst_rdata),
    .io_inst_data_ok(myc01_core_io_inst_data_ok),
    .io_icache_invalid(myc01_core_io_icache_invalid),
    .io_data_req(myc01_core_io_data_req),
    .io_data_we(myc01_core_io_data_we),
    .io_data_wstrb(myc01_core_io_data_wstrb),
    .io_data_addr(myc01_core_io_data_addr),
    .io_data_wdata(myc01_core_io_data_wdata),
    .io_data_rdata(myc01_core_io_data_rdata),
    .io_data_data_ok(myc01_core_io_data_data_ok),
    .io_int_i_1(myc01_core_io_int_i_1),
    .io_int_i_2(myc01_core_io_int_i_2),
    .io_int_i_3(myc01_core_io_int_i_3),
    .io_int_i_4(myc01_core_io_int_i_4),
    .io_int_i_5(myc01_core_io_int_i_5),
    .io_int_i_6(myc01_core_io_int_i_6)
  );
  axi_interface axi_interface ( // @[myc01_wrapper.scala 73:31]
    .clock(axi_interface_clock),
    .reset(axi_interface_reset),
    .io_inst_req(axi_interface_io_inst_req),
    .io_inst_we(axi_interface_io_inst_we),
    .io_inst_addr(axi_interface_io_inst_addr),
    .io_inst_rdata(axi_interface_io_inst_rdata),
    .io_inst_beat_ok(axi_interface_io_inst_beat_ok),
    .io_inst_data_ok(axi_interface_io_inst_data_ok),
    .io_inst_uncached(axi_interface_io_inst_uncached),
    .io_data_req(axi_interface_io_data_req),
    .io_data_we(axi_interface_io_data_we),
    .io_data_wstrb(axi_interface_io_data_wstrb),
    .io_data_addr(axi_interface_io_data_addr),
    .io_data_wdata(axi_interface_io_data_wdata),
    .io_data_rdata(axi_interface_io_data_rdata),
    .io_data_beat_ok(axi_interface_io_data_beat_ok),
    .io_data_data_ok(axi_interface_io_data_data_ok),
    .io_data_uncached(axi_interface_io_data_uncached),
    .io_araddr(axi_interface_io_araddr),
    .io_arlen(axi_interface_io_arlen),
    .io_arsize(axi_interface_io_arsize),
    .io_arburst(axi_interface_io_arburst),
    .io_arvalid(axi_interface_io_arvalid),
    .io_arready(axi_interface_io_arready),
    .io_rdata(axi_interface_io_rdata),
    .io_rlast(axi_interface_io_rlast),
    .io_rvalid(axi_interface_io_rvalid),
    .io_rready(axi_interface_io_rready),
    .io_awaddr(axi_interface_io_awaddr),
    .io_awsize(axi_interface_io_awsize),
    .io_awvalid(axi_interface_io_awvalid),
    .io_awready(axi_interface_io_awready),
    .io_wdata(axi_interface_io_wdata),
    .io_wstrb(axi_interface_io_wstrb),
    .io_wvalid(axi_interface_io_wvalid),
    .io_bvalid(axi_interface_io_bvalid),
    .io_bready(axi_interface_io_bready)
  );
  cache icache ( // @[myc01_wrapper.scala 74:25]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_cpu_req(icache_io_cpu_req),
    .io_cpu_addr(icache_io_cpu_addr),
    .io_cpu_wr(icache_io_cpu_wr),
    .io_cpu_wstrb(icache_io_cpu_wstrb),
    .io_cpu_wdata(icache_io_cpu_wdata),
    .io_cpu_rdata(icache_io_cpu_rdata),
    .io_operation_ok(icache_io_operation_ok),
    .io_cache_invalid(icache_io_cache_invalid),
    .io_ram_req(icache_io_ram_req),
    .io_ram_wr(icache_io_ram_wr),
    .io_ram_wstrb(icache_io_ram_wstrb),
    .io_ram_addr(icache_io_ram_addr),
    .io_ram_wdata(icache_io_ram_wdata),
    .io_ram_rdata(icache_io_ram_rdata),
    .io_ram_beat_ok(icache_io_ram_beat_ok),
    .io_ram_data_ok(icache_io_ram_data_ok),
    .io_uncached(icache_io_uncached)
  );
  cache dcache ( // @[myc01_wrapper.scala 75:25]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_cpu_req(dcache_io_cpu_req),
    .io_cpu_addr(dcache_io_cpu_addr),
    .io_cpu_wr(dcache_io_cpu_wr),
    .io_cpu_wstrb(dcache_io_cpu_wstrb),
    .io_cpu_wdata(dcache_io_cpu_wdata),
    .io_cpu_rdata(dcache_io_cpu_rdata),
    .io_operation_ok(dcache_io_operation_ok),
    .io_cache_invalid(dcache_io_cache_invalid),
    .io_ram_req(dcache_io_ram_req),
    .io_ram_wr(dcache_io_ram_wr),
    .io_ram_wstrb(dcache_io_ram_wstrb),
    .io_ram_addr(dcache_io_ram_addr),
    .io_ram_wdata(dcache_io_ram_wdata),
    .io_ram_rdata(dcache_io_ram_rdata),
    .io_ram_beat_ok(dcache_io_ram_beat_ok),
    .io_ram_data_ok(dcache_io_ram_data_ok),
    .io_uncached(dcache_io_uncached)
  );
  assign io_arid = 4'h0; // @[myc01_wrapper.scala 118:31]
  assign io_araddr = axi_interface_io_araddr; // @[myc01_wrapper.scala 119:31]
  assign io_arlen = axi_interface_io_arlen; // @[myc01_wrapper.scala 120:31]
  assign io_arsize = axi_interface_io_arsize; // @[myc01_wrapper.scala 121:31]
  assign io_arburst = axi_interface_io_arburst; // @[myc01_wrapper.scala 122:31]
  assign io_arlock = 2'h0; // @[myc01_wrapper.scala 123:31]
  assign io_arcache = 4'h0; // @[myc01_wrapper.scala 124:31]
  assign io_arprot = 3'h0; // @[myc01_wrapper.scala 125:31]
  assign io_arvalid = axi_interface_io_arvalid; // @[myc01_wrapper.scala 126:31]
  assign io_rready = 1'h1; // @[myc01_wrapper.scala 134:31]
  assign io_awid = 4'h0; // @[myc01_wrapper.scala 136:31]
  assign io_awaddr = axi_interface_io_awaddr; // @[myc01_wrapper.scala 137:31]
  assign io_awlen = 8'h0; // @[myc01_wrapper.scala 138:31]
  assign io_awsize = axi_interface_io_awsize; // @[myc01_wrapper.scala 139:31]
  assign io_awburst = 2'h0; // @[myc01_wrapper.scala 140:31]
  assign io_awlock = 2'h0; // @[myc01_wrapper.scala 141:31]
  assign io_awcache = 4'h0; // @[myc01_wrapper.scala 142:31]
  assign io_awprot = 3'h0; // @[myc01_wrapper.scala 143:31]
  assign io_awvalid = axi_interface_io_awvalid; // @[myc01_wrapper.scala 144:31]
  assign io_wid = 4'h0; // @[myc01_wrapper.scala 147:31]
  assign io_wdata = axi_interface_io_wdata; // @[myc01_wrapper.scala 148:31]
  assign io_wstrb = axi_interface_io_wstrb; // @[myc01_wrapper.scala 149:31]
  assign io_wlast = 1'h1; // @[myc01_wrapper.scala 150:31]
  assign io_wvalid = axi_interface_io_wvalid; // @[myc01_wrapper.scala 151:31]
  assign io_bready = 1'h1; // @[myc01_wrapper.scala 157:31]
  assign myc01_core_clock = clock;
  assign myc01_core_reset = reset;
  assign myc01_core_io_inst_rdata = icache_io_cpu_rdata; // @[myc01_wrapper.scala 83:36]
  assign myc01_core_io_inst_data_ok = icache_io_operation_ok[0]; // @[myc01_wrapper.scala 84:36]
  assign myc01_core_io_data_rdata = dcache_io_cpu_rdata; // @[myc01_wrapper.scala 92:36]
  assign myc01_core_io_data_data_ok = dcache_io_operation_ok[0]; // @[myc01_wrapper.scala 93:36]
  assign myc01_core_io_int_i_1 = io_int_i_1; // @[myc01_wrapper.scala 159:17]
  assign myc01_core_io_int_i_2 = io_int_i_2; // @[myc01_wrapper.scala 160:17]
  assign myc01_core_io_int_i_3 = io_int_i_3; // @[myc01_wrapper.scala 161:17]
  assign myc01_core_io_int_i_4 = io_int_i_4; // @[myc01_wrapper.scala 162:17]
  assign myc01_core_io_int_i_5 = io_int_i_5; // @[myc01_wrapper.scala 163:17]
  assign myc01_core_io_int_i_6 = io_int_i_6; // @[myc01_wrapper.scala 164:17]
  assign axi_interface_clock = clock;
  assign axi_interface_reset = reset;
  assign axi_interface_io_inst_req = icache_io_ram_req; // @[myc01_wrapper.scala 97:33]
  assign axi_interface_io_inst_we = icache_io_ram_wr; // @[myc01_wrapper.scala 98:33]
  assign axi_interface_io_inst_addr = icache_io_ram_addr; // @[myc01_wrapper.scala 100:33]
  assign axi_interface_io_inst_uncached = icache_io_uncached; // @[myc01_wrapper.scala 105:33]
  assign axi_interface_io_data_req = dcache_io_ram_req; // @[myc01_wrapper.scala 107:33]
  assign axi_interface_io_data_we = dcache_io_ram_wr; // @[myc01_wrapper.scala 108:33]
  assign axi_interface_io_data_wstrb = dcache_io_ram_wstrb; // @[myc01_wrapper.scala 109:33]
  assign axi_interface_io_data_addr = dcache_io_ram_addr; // @[myc01_wrapper.scala 110:33]
  assign axi_interface_io_data_wdata = dcache_io_ram_wdata; // @[myc01_wrapper.scala 111:33]
  assign axi_interface_io_data_uncached = dcache_io_uncached; // @[myc01_wrapper.scala 115:33]
  assign axi_interface_io_arready = io_arready; // @[myc01_wrapper.scala 127:31]
  assign axi_interface_io_rdata = io_rdata; // @[myc01_wrapper.scala 130:31]
  assign axi_interface_io_rlast = io_rlast; // @[myc01_wrapper.scala 132:31]
  assign axi_interface_io_rvalid = io_rvalid; // @[myc01_wrapper.scala 133:31]
  assign axi_interface_io_awready = io_awready; // @[myc01_wrapper.scala 145:31]
  assign axi_interface_io_bvalid = io_bvalid; // @[myc01_wrapper.scala 156:31]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_cpu_req = myc01_core_io_inst_req; // @[myc01_wrapper.scala 78:36]
  assign icache_io_cpu_addr = myc01_core_io_inst_addr; // @[myc01_wrapper.scala 79:36]
  assign icache_io_cpu_wr = 1'h0; // @[myc01_wrapper.scala 80:36]
  assign icache_io_cpu_wstrb = 8'h0; // @[myc01_wrapper.scala 81:36]
  assign icache_io_cpu_wdata = 64'h0; // @[myc01_wrapper.scala 82:36]
  assign icache_io_cache_invalid = myc01_core_io_icache_invalid; // @[myc01_wrapper.scala 85:38]
  assign icache_io_ram_rdata = axi_interface_io_inst_rdata; // @[myc01_wrapper.scala 102:33]
  assign icache_io_ram_beat_ok = axi_interface_io_inst_beat_ok; // @[myc01_wrapper.scala 103:33]
  assign icache_io_ram_data_ok = axi_interface_io_inst_data_ok; // @[myc01_wrapper.scala 104:33]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_cpu_req = myc01_core_io_data_req; // @[myc01_wrapper.scala 87:36]
  assign dcache_io_cpu_addr = myc01_core_io_data_addr; // @[myc01_wrapper.scala 88:36]
  assign dcache_io_cpu_wr = myc01_core_io_data_we; // @[myc01_wrapper.scala 89:36]
  assign dcache_io_cpu_wstrb = myc01_core_io_data_wstrb; // @[myc01_wrapper.scala 90:36]
  assign dcache_io_cpu_wdata = myc01_core_io_data_wdata; // @[myc01_wrapper.scala 91:36]
  assign dcache_io_cache_invalid = 1'h0; // @[myc01_wrapper.scala 94:34]
  assign dcache_io_ram_rdata = axi_interface_io_data_rdata; // @[myc01_wrapper.scala 112:33]
  assign dcache_io_ram_beat_ok = axi_interface_io_data_beat_ok; // @[myc01_wrapper.scala 113:33]
  assign dcache_io_ram_data_ok = axi_interface_io_data_data_ok; // @[myc01_wrapper.scala 114:33]
endmodule
