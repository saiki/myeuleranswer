import scala.io.Source

object Prob42 {
  val chardefs = "abcdefghijklmnopqrstuvwxyz".split("").toList

  var triangles = List(1, 3, 6, 10, 15, 21, 28, 36, 45, 55).reverse

  def main(args: Array[String]) {
    val source = Source.fromFile("words.txt")
    val lines = source.getLines
    var count = lines.foldLeft(0)( (c:Int, l:String) =>  {
        c + l.split(",").map(_.replace("\"", "")).count((w:String) => isTriangle(calc(w)))
      }
    )
    println("count: %d".format(count))
  }

  def calc(word: String):Int = {
    word.toLowerCase.split("").toList.foldLeft(0)( _ + chardefs.indexOf(_))
  }

  def isTriangle(n:Int):Boolean = {
    while (triangles.max < n) {
      triangles = (triangles.length * (triangles.length + 1) / 2) :: triangles
    }
    triangles.contains(n)
  }

}
