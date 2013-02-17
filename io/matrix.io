/*
        A matrix implementation;
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

Matrix fromData := method(newData,
        m := Matrix clone
        m height = newData size
        m width = (newData at(0)) size
        m data = newData
        m)

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

//All we need to dump is our data list
Matrix serialize := method(fileName,
        File with(fileName) open write(data serialized) close)

Matrix unserialize := method(fileName,
        fromData(doFile(fileName)))

//Mostly for debugging
Matrix prettyPrint := method (
        for (i, 0, height - 1,
           for (j, 0, width -1,
                "|" print
                (get(j,i) print
                "\t" print))
           "|" println))

m := Matrix fromData(list(list("foo", "bar"), list("baz", "quux")))
m prettyPrint

"**************" println

t := m transpose

t prettyPrint
m data asString println

"#############" println
t serialize("transposed.dat")
Matrix unserialize("transposed.dat") prettyPrint

"$$$$$$$$$$$$$$"println
x := Matrix fromData(list(list(1,2,4), list(3,7,11), list(8,5,3), list(14, 28, 57)))
x prettyPrint
"Transposed:" println
x transpose prettyPrint
