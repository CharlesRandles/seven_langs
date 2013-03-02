/*
	Use foldLeft to compute the total size of a list of strings.
*/

import scala.io.Source.fromFile

def totalLength(words: List[String]) : Int = 
    words.foldLeft(0)((sum, word) => sum + word.length)

val words = "For Brutus is an honourable man"

println("totalLength is " + totalLength(words.split(" ").toList))

/*
• Write a Censor trait with a method that will replace the curse words Shoot and Darn with Pucky and Beans alternatives. 
  Use a map to store the curse words and their alternatives.
• Load the curse words and alternatives from a file.
*/

def loadMap(fileName: String): Map[String,String] = {
    var pair = "" -> ""
    var m = Map("" -> "")
    for (line <- fromFile(fileName).getLines) {
    	pair = line.split(",")(0) -> line.split(",")(1)
	println(pair)
	m = m+pair
	println(m)
    }
    m
}

trait Censor{

      val fileName = "censor.txt"
      var censorMap = loadMap(fileName)
 
      def censor(word: String) :String = 
      	  if (censorMap.contains(word.toLowerCase)) {
	     censorMap(word.toLowerCase)
	  } else {
	    word
	  }

      def censorList(l: List[String]) = l.map(censor)
}

class BasicList(l: List[String]) {
      var list = l
      def print {
	  println(list.foldLeft("")((sentence, word)=>sentence + " " + word).trim)
      }
}

class CleanList(l: List[String]) extends BasicList(l) with Censor {

      list = censorList(l)

}

val rudeWords = "Shoot ! The darn critter got clean away !"
val cl = new CleanList(rudeWords.split(" ").toList)
println(rudeWords)
cl.print
