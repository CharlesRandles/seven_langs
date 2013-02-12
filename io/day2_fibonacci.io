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
f recGetNth(7) println

/*And now a little more brutally*/
fibonacci := method(a,b,n,
        if (n<=2, b, fibonacci(b, a+b, (n-1))))

getNthFib := method(n,fibonacci (1,1,n))

getNthFib(10) println
