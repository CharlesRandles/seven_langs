/*
        Lists should use ["square", "brackets"]
*/

//Stuff this into the current context
squareBrackets := method(args,
        call message arguments //Which turns out to be precisely what we want
        )

l := [1,2,3]
l type println
l println
