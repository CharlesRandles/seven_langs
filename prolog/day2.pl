/*
  Day 2 exercises
*/

/* Factorial. */

factorial(0,1).
factorial(N,F) :-
	N > 0,
	N1 is N-1,
	factorial(N1, F1),
	F is N * F1.

/* Fibonacci */
fibonacci(1,1).
fibonacci(2,1).
fibonacci(N, F) :-
	N > 2,
	N1 is N-1,
	N2 is N-2,
	fibonacci(N1, F1),
	fibonacci(N2, F2),
	F is F1 + F2.

/* Towers of Hanoi is but a google away... */

/* Negation vastly expands the search space for the solver */

/* Reverse a list */
my_reverse([],[]).
my_reverse([H], [H]).
my_reverse([H|T], RevList) :-
	my_reverse(T, RT),
	append(RT, [H], RevList).

/* Find the smallest number in a list*/
my_smallest([L], L).
my_smallest([A,B], S) :- A < B, S is A; S is B. /* Smallest item in a pair */
my_smallest([H|T], S) :-
	my_smallest(T, TS), /* What's the smallest thing in the tail? */
	my_smallest([H,TS], S). /* Is head smaller than the smallest in the tail? */

/* World's nastiest sort. It's a MinSort, so actually third-nastiest. */
remove_item(_, [], []).
remove_item(X, [X|T], Shorter) :-
	   remove_item(X, T, Shorter).
remove_item(X, [H|T], Shorter) :-
	remove_item(X, T, ShorterTail),
	append([H], ShorterTail, Shorter).

min_sort([], []).
min_sort(List, Sorted) :-
	my_smallest(List, Smallest),
	remove_item(Smallest, List, Rest),
	min_sort(Rest, RestSorted),
	Sorted = [Smallest | RestSorted].
