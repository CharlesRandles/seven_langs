count([], 0).
count([_|Tail], Count) :- count(Tail, TailCount), Count is TailCount + 1.

sum([], 0).
sum([Head|Tail], Sum) :- sum(Tail, TailSum), Sum is Head + TailSum.
average(List, A) :- count(List, Count), sum(List, Sum), A is Sum / Count.

concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :-
  concatenate(Tail1, List, Tail2).

chaz_last([X], X).
chaz_last([_|Tail], X) :- chaz_last(Tail, X).

chaz_nth([X|_], 1, X).
chaz_nth([H|T], N, V) :- chaz_nth(T, N2, V2), N2 is N - 1.

fifth(L, V) :- chaz_nth(L, 5, V).