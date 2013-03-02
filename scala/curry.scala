/*
	If this language is in any way logical, we should be able to do this...
*/

def plusN(n: Int) = {x: Int => x + n}

var plus4 = plusN(4)

println(plus4(7))
//Should be ll.