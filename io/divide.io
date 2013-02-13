/*
        Let's break the whole of algebra!
        2/0 currently gives inf
        We'll make it give 0.
        This means numbers, which were a group and a ring and a field
        become none of those.
        If you're going to destroy an entire algebra...
*/

//Let's create an entirely new operator. For fun.
OperatorTable addOperator ("\\", 2) //Same precedence as /

Number \ = method (a,b,
        if (b==0, b, a/b) //There. We did it. We broke algebra! I hope you feel happy.
)

a := 2/0
"Before we obliterate number theory, 2/0=" print
a println

b := 2\0
"Are you feeling proud? 2\0=" print
b println

