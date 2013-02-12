/* Day 2 self-study */

Fib := Object clone

Fib reset := method (
        self last := 1
        self current :=1 )

Fib result := method (self current)

Fib getNext := method (
        old := current
        current = current + last
        last = old )

Fib iterGetNth := method(n,
        for (i,3,n,1, getNext)
                current)

Fib recGetNth := method (n, if (n<=2, current,
        getNext
        recGetNth(n - 1)))

f := Fib clone
f reset
//f recGetNth(7) println

/*And now a little more traditionally*/
fibonacci := method(a,b,n,
        if (n<=2, b, fibonacci(b, a+b, (n-1))))

getNthFib := method(n,fibonacci (1,1,n))

getNthFib(30) println

/* This is not the way to do it - no tail call optimisation possible */
bad_fib := method (n,
        if(n<2, 1, (bad_fib (n-1)) + (bad_fib (n-2))))
//bad_fib(30) println

/*
timings
bad_fib
real	0m9.662s
user	0m9.479s
sys	0m0.182s
artemis-6:io chaz$ time io day2.io
832040

recGetNth
real	0m0.077s
user	0m0.073s
sys	0m0.003s

125 times faster. This gets exponentially worse.

*/