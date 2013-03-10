-module(recursion).
-export([fib/1, fact/1, stupid_fib/1]).

fact(1) ->
    1;
fact(N) ->
    N * fact(N-1).

fib(N)->
    fibonacci(1,1,N).

fibonacci(_,B,1)->
    B;
fibonacci(A,B,N) ->
    fibonacci(B, A+B, N-1).

stupid_fib(1) ->
    1;
stupid_fib(2) ->
    2;
stupid_fib(N) ->
    stupid_fib(N-1) + stupid_fib(N-2).




