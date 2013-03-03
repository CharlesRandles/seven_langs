/*
	Do stuff to the contents of a bunch of URLs
*/

import scala.io._
import scala.actors._
import Actor._

class HtmlPageInfo (_size: Int, _links : List[String]) {

      val size = _size
      val links = _links

      def getSize(): Int = size
      def getLinks() : List[String] = links
      def getNumLinks(): Int = links.length
}

object PageLoader {
       def getPageInfo(url: String): HtmlPageInfo = {

       	   val page = Source.fromURL(url).mkString
	   parsePage(page)
       }

       def parsePage(source: String) : HtmlPageInfo = {
       	   val length = source.length
	   val links = getLinks(source)
	   val info = new HtmlPageInfo(length, links)
	   info
       }

       def getLinks(source : String) : List[String] = {
       	   val regex="""href="(.+)"""".r
	   var links=List() : List[String]
	   for (link <- regex.findAllIn(source)) {
	       println(link)
	       links ::= link.split(" ")(0)
	   }
	   links
       }
}

val urls = List("http://burblechaz.com/may07.html",
		"http://fractalthoughts.com/blog/")

def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("Method took " + (end - start)/1000000000.0 + " seconds")
}

def getPageSizeSequentially() = {
    for (url <- urls) {
    	val info = PageLoader.getPageInfo(url)
    	println("Size for " + url + " is " + info.getSize,
		 " page has " + info.getNumLinks + " links" )
    }
}

def getPageSizeConcurrently() = {

    val caller = self

    for (url <- urls) {
    	actor {caller ! (url, PageLoader.getPageInfo(url)) }
    }

    for (i<-1 to urls.size) {
    	receive {
		case (url, info: HtmlPageInfo) =>
		     println("Size for " + url + " is " + info.getSize +
		     		   " bytes and the page has " + info.getNumLinks + " links")
	}
    }
}

println("Concurrent run")
timeMethod {getPageSizeConcurrently}
