object Prob37 {
  
  var primes = List(1, 2, 3, 5, 7)


  def main(args: Array[String]) = {
    val l = Range(13, 999).filter(_ % 2 != 0).filter( (v:Int) => {
      val t = v.toString.split("").toList.filter(_ != "").map( _.toInt)
      primes.contains(t.head) && primes.contains(t.last) && isPrime(v)
    })
    println(l)
  }

  def isPrime(v:Int):Boolean = {
    if (primes.max < v) {
      Range(primes.max, v).foreach(
	if (isPrime(_)) {
	  primes = _ :: primes
	}
      )
    }
    primes.exists( v % _ != 0) && v == primes.max
  }
  
}
