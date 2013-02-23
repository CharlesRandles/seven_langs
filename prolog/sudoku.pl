/* Sudoku
* Sample sudokus:

?- sudoku([[X,Y], [A, B]]).
?- sudoku([[A1, A2, 2, 3], [B1, B2, B3, B4], [C1, C2, C3, C4], [3, 4, D3, D4]]).
?- sudoku([
    [A1, A2,  2,  3, A5],
    [B1,  1, B3,  5, B5],
    [C1, C2, C3,  1, C5],
    [ 3,  4, D3, D4, D5],
    [E1, E2, E3, E4,  2]
    ]).
?- sudoku([
    [ 5, A2,  2,  3, A5, A6],
    [ 2,  1, B3,  5, B5, B6],
    [ 4, C2, C3,  1, C5, C6],
    [ 3,  4, D3, D4, D5, D6],
    [ 1, E2,  3, E4,  2, E6],
    [ 6, F2, F4, F4, F5, F6]
    ]).
?- sudoku([
            [ 1, A2,  2,  3, A5, A6, A7,  9,  4],
            [ 2,  9, B3,  7, B5,  8, B7, B8, B9],
            [ 3, C2, C3,  1, C5, C6,  4, C8,  2],
            [ 4,  5, D3, D4, D5, D6, D7, D8, D9],
            [ 5, E2, E3, E4,  2, E6, E7, E8,  7],
            [ 6, F2, F3,  9, F5, F6, F7, F8, F9],
            [ 7,  3, G3, G4, G5, G6,  2, G8, G9],
            [ 8, H2, H3, H4,  1, H6, H7, H8, H9],
            [ 9, I2, I3, I4, I5, I6, I7,  8, I9]
           ]).
?- sudoku([[1]]).
?- sudoku([[X]]).

*/

/* The list of valid numbers in this sudoku */
:- dynamic(number_pool/1).


sudoku(Puzzle) :-
    nl,
    print_solution(Puzzle),nl,nl,
    prep(Puzzle, MaxNum),
    populate(Puzzle, [], Solution, MaxNum),       /* Generate a solution */
    print_solution(Solution).

prep(Puzzle, L) :-
    length(Puzzle, L),                  /* How big is the grid? */
    valid_numbers(L, ValidNumbers),     /* What numbers are available for the variables? */
    retractall(number_pool(_)),         /* just to be on the safe side */
    assertz(number_pool(ValidNumbers)),
    !.                                  /* don't even think about backtracking across assert/retract... */

valid_numbers(0, []):- !.
valid_numbers(N, [N|T]) :-
    M is N - 1,
    valid_numbers(M, T).

populate([],_, [], _).
populate([Row|T], SolSoFar, [PopRow|S], MaxNum ) :-
    number_pool(ValidNumbers),
    populate_row(Row, PopRow, ValidNumbers),
    PartialSol = [PopRow | SolSoFar],
    append(PartialSol, T, ColumnsToTest),   /* not very efficient -- but more efficient than not testing */
    check_columns(0, MaxNum, ColumnsToTest),/* check that cell values in this row fit across columns */
    populate(T, PartialSol, S, MaxNum).     /* including values added to previous rows */
    


populate_row([],[], _).
populate_row([H|T], [H|R], ValidNumbers):-   /* current element is an atom, so keep it */
    nonvar(H), !,
    remove(H, ValidNumbers, Remaining),      /* remove it from the number pool for this row */
    populate_row(T, R, Remaining).
populate_row([_|T], [N|R], ValidNumbers):-  /* current element is a variable, so generate value */
    member(N, ValidNumbers),                /* this will backtrack through all solutions */
    remove(N, ValidNumbers, Remaining),     /* we don't want this value again in this row */
    populate_row(T, R, Remaining).

remove(_, [], _) :- !, fail.   /* Element not found. Indicates unsolvable puzzle. */
remove(H, [H|T], T) :- !.
remove(E, [H|T], [H|R]) :-
    remove(E, T, R).


check_columns(L, L, _) :- !.
check_columns(N, L, SolSoFar) :-
    M is N + 1,             /* increment here so that single-cell Sudoku is correct */
    get_column(SolSoFar, M, Col),
    strip_variables(Col, NewCol),
    unique(NewCol),
    check_columns(M, L, SolSoFar).


/* for each row, get me the Nth element. Put elements into a list. */
get_column([], _, []).
get_column([Row|T], N,[E |Es]) :-
    nth_element(N, Row, E),
    get_column(T, N, Es).

strip_variables([], []).
strip_variables([H|T], L):-
    var(H), !,
    strip_variables(T, L).
strip_variables([H|T], [H|L]) :-
    strip_variables(T, L).

nth_element(1, [H|_], H) :- !.
nth_element(N, [_|T], E) :-
    M is N - 1,
    nth_element(M, T, E).
    
unique([]).
unique([H|T]) :-
    member(H, T),
    !, fail.           /* No need to check the rest of the list. */
unique([_|T]) :-
    unique(T).

print_solution([]):- nl.
print_solution([H|T]) :-
    print(H), nl,
    print_solution(T).

