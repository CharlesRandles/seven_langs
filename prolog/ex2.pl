/* Exercises from http://www-users.york.ac.uk/~sjh1/courses/L334css/complete/complete2su6.html */

/* 2 */
my_first(X,Y) :-
	X = [H|_],
	Y=H.

my_second(X,Y) :-
	X = [_|[H2|_]],
	Y=H2.

/* 3 */
fifth(X, Y) :-
	X=[_|[_|[_|[_|[E|_]]]]],
	Y=E.

/* 4 */
my_is_list([]).
my_is_list([_]).

/* 5 */
cons(A,B,[A|B]).

/* When you have learned to snatch the error code from the trap frame...*/
concatenate([], List, List).
concatenate([H|T], List, [H|T2]) :-
	concatenate(T, List, T2).

my_member([X], X).
my_member([_|T], M) :- my_member(T, M).

/* 6 */
my_delete(_,[],[]).
my_delete(X, [X|T], T).
my_delete(X, [H|T], NL) :- my_delete(X, T, DT), append([H], DT, NL).

/* 7 */
	