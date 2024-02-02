circuit ifid_reg :
  module ifid_reg :
    input clock : Clock
    input reset : UInt<1>
    input io_if_pc : UInt<32>
    output io_id_pc : UInt<32>
  
    reg pc_reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc_reg) @[ifid_reg.scala 15:23]
    io_id_pc <= pc_reg @[ifid_reg.scala 18:12]
    pc_reg <= mux(reset, UInt<32>("h0"), io_if_pc) @[ifid_reg.scala 16:10]
