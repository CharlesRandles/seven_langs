def whileLoop {
    var i = 1
    while (i<=3) {
    	  println(i)
	  i+=1
    }   
}

def forLoop {
    for(i<-0 until args.length) {
    	     println(args(i))
    }
}

def foreachLoop {
    args.foreach { arg =>
    		 println(arg)
	}
}

whileLoop
foreachLoop 