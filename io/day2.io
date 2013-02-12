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
        for (i,1,n,1, getNext)
                current)

Fib recGetNth := method (n, if (n==0, current,
        getNext
        recGetNth(n - 1)))

f := Fib clone
f reset
f recGetNth(7) println


