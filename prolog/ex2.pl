/* 2 */

my_first(X,Y) :-
	X = [H|_],
	Y=H.

my_second(X,Y) :-
	X = [_|[H2|_]],
	Y=H2.

/* 3 */

fifth(X, Y) :-
	X=[A|[B|[C|[D|[E|_]]]]],
	Y=E.

/* 4 */
is_list([]).
is_list([_]).

/* 5 */
cons(A,B,[A|B]).