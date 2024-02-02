//GenVerilog.scala

package myc01.core

import chisel3._
import define.myc01_core_define._

object if_stage_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating if_stage")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new if_stage)
  }
}
//sbt 'test:runMain myc01.core.if_stage_Gen'

object ifid_reg_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating ifid_reg")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new ifid_reg)
  }
}
//sbt 'test:runMain myc01.core.ifid_reg_Gen'

object id_stage_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating id_stage")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new id_stage)
  }
}
//sbt 'test:runMain myc01.core.id_stage_Gen'

object idexe_reg_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating idexe_reg")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new idexe_reg)
  }
}
//sbt 'test:runMain myc01.core.idexe_reg_Gen'

object exe_stage_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating exe_stage")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new exe_stage)
  }
}
//sbt 'test:runMain myc01.core.exe_stage_Gen'

object exemem_reg_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating exemem_reg")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new exemem_reg)
  }
}
//sbt 'test:runMain myc01.core.exemem_reg_Gen'

object mem_stage_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating mem_stage")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new mem_stage)
  }
}
//sbt 'test:runMain myc01.core.mem_stage_Gen'

object memwb_reg_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating memwb_reg")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new memwb_reg)
  }
}
//sbt 'test:runMain myc01.core.memwb_reg_Gen'

object wb_stage_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating wb_stage")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new wb_stage)
  }
}
//sbt 'test:runMain myc01.core.wb_stage_Gen'

object regfile_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating regfile")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new regfile)
  }
}
//sbt 'test:runMain myc01.core.regfile_Gen'


object myc01_core_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating myc01_core")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new myc01_core)
  }
}
//sbt 'test:runMain myc01.core.myc01_core_Gen'

/*
//关闭优化
object myc01_core_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating myc01_core")
   chisel3.Driver.execute(args, () => new myc01_core)
  }
}
//sbt 'test:runMain myc01.core.myc01_core_Gen -X mverilog'
*/

object myc01_wrapper_Gen{
   def main(args: Array[String]): Unit = {
    println("Generating myc01_wrapper")
   chisel3.Driver.execute(Array("--target-dir", "generated"), () => new myc01_wrapper)
  }
}
//sbt 'test:runMain myc01.core.myc01_wrapper_Gen'
