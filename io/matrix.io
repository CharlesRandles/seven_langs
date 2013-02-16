/*
        A matrix implementation;
        It's a simple list that knows its width and height
*/

Matrix := Object clone

//A helper - makes a list of nils
Matrix makeList := method (len,val,
        l := list()
        for (i,0,len, l push(val))
        l)

//Keep our data as a member, and remember our size
Matrix init := method(
        data ::= list()
        width ::= 0
        height ::= 0)

Matrix dim := method(x,y,
        width = x
        height  = y
        for (i,0,y-1,
                data push(makeList(x-1, nil))))

Matrix set := method (x,y,val,
        (data at(y)) atPut(x, val))

Matrix get := method(x,y,
        row := data at(y)
        row at(x))

//Keep your i's and j's straight.
Matrix transpose := method(
        m := Matrix clone
        m dim(height, width)
        for (i, 0 , height - 1,
           for (j, 0, width - 1,
                m set(i,j, get(j,i))))
        m)


//Mostly for debugging
Matrix prettyPrint := method (
        for (i, 0, height - 1,
           for (j, 0, width -1,
                "|" print
                (get(j,i) print
                "\t" print))
           "|" println))

m := Matrix clone
m dim(2,2)
m set(0,0,"foo")
m set(1,0,"bar")
m set(0,1,"baz")
m set(1,1,"quux")
m println

m get(0,0) println
m get(0,1) println
m get(1,0) println
m get(1,1) println

m prettyPrint

"**************" println

t := m transpose

t prettyPrint