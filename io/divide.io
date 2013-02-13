/*
        Let's break the whole of algebra!
        2/0 currently gives inf
        We'll make it give 0.
        This means numbers, which were a group and a ring and a field
        become none of those.
        If you're going to destroy an entire algebra...
*/

"7 / 0 = " print
(7/0) println

//Grab the old block
oldSlash := Number getSlot ("/")

//Destroy algebra!
Number / := method(a, if((a==0), a, self oldSlash a))
"7 / 0 = " print
(7/0) println
