/* Variable-grid Sudoku
*
* Sample sudokus:

?- sudoku([[X,Y], [A, B]]).
?- sudoku([
    [4, A2, A3, A4],
    [2, B2, B3, B4],
    [3, C2, C3, C4],
    [1, D2, D3, D4]]).
?- sudoku([
    [ 1, 4 ,  5,  2,  6,  7,  3,  8,  9],
    [ 3, B2, B3,  1, B5, B6,  2, B8, B9],
    [ 2, C2, C3,  4, C5, C6,  5, C8, C9],
    [ 4, D2, D3,  5, D5, D6,  6, D8, D9],
    [ 5,  1,  8,  6,  3,  4,  7,  9,  2],
    [ 6, F2, F3,  7, F5, F6,  8, F8, F9],
    [ 7, G2, G3,  8, G5, G6,  9, G8, G9],
    [ 8, H2, H3,  9, H5, H6,  1, H8, H9],
    [ 9,  5,  1,  3,  7,  2,  4,  6,  8]
    ]).

?- sudoku(
    [[6,_,_,2,_,_,7,4,_],
    [_,_,9,3,5,8,_,_,_],
    [2,1,_,_,6,_,3,_,9],
    [_,9,_,6,_,_,8,5,7],
    [_,_,7,8,_,3,2,_,_],
    [4,8,1,_,_,7,_,6,_],
    [8,_,3,_,7,_,_,9,6],
    [_,_,_,1,3,2,_,_,_],
    [_,7,4,_,_,_,_,_,2]]).

?- sudoku([
            [ 1, A2, A3,  2, A5, A6,  3, A8, A9],
            [ 2, B2, B3,  3, B5, B6,  4, B8, B9],
            [ 3, C2, C3,  4, C5, C6,  5, C8, C9],
            [ 4, D2, D3,  5, D5, D6,  6, D8, D9],
            [ 5, E2, E3,  6, E5, E6,  7, E8, E9],
            [ 6, F2, F3,  7, F5, F6,  8, F8, F9],
            [ 7, G2, G3,  8, G5, G6,  9, G8, G9],
            [ 8, H2, H3,  9, H5, H6,  1, H8, H9],
            [ 9, I2, I3,  1, I5, I6,  2, I8, I9]
           ]).
?- sudoku([[1]]).
?- sudoku([[X]]).


?- sudoku(
[[3,  _,  _,  _,  2,  _,  _,  _,  _],
[_,  _,  8,  _,  _,  6,  _,  _,  _],
[_,  _,  6,  3,  4,  9,  _,  _,  _],
[6,  4,  _,  _,  _,  _,  8,  1,  _],
[_,  2,  _,  _,  _,  _,  _,  4,  _],
[_,  7,  1,  _,  _,  _,  _,  9,  2],
[_,  _,  _,  1,  8,  7,  3,  _,  _],
[_,  _,  _,  5,  _,  _,  1,  _,  _],
[_,  _,  _,  _,  6,  _,  _,  _,  4]]
).

*/

/* The list of valid numbers in this sudoku */
:- dynamic(number_pool/1).

sudoku(P) :-
    prep(P, MaxNum, Puzzle),
    nl,
    populate(Puzzle, [], Solution, MaxNum),
    nl,
    print_solution(Solution).


prep(P, L, Puzzle) :-
    format_puzzle(P, 1, Puzzle),
    length(P, L),                  /* How big is the grid? */
    get_number_pool(L),
    !.                             /* absolutely no backtracking in prep  */

format_puzzle([],_, []).
format_puzzle([Row | Rows], RowCounter, [R1 | Rs]):-
    format_row(Row, RowCounter, 1, R1),
    RC is RowCounter + 1,
    format_puzzle(Rows, RC, Rs).

format_row([], _, _, []).
format_row([Cell | Cells], RowCounter, ColumnCounter, [(RowCounter, ColumnCounter, Cell)| OtherCells]) :-
    CC is ColumnCounter + 1,
    format_row(Cells, RowCounter, CC, OtherCells).


get_number_pool(L) :-
    valid_numbers(L, ValidNumbers),     /* What numbers are available for the variables? */
    retractall(number_pool(_)),         /* just to be on the safe side */
    assertz(number_pool(ValidNumbers)),
    !.                                  /* don't even think about backtracking across assert/retract... */

valid_numbers(0, []):- !.
valid_numbers(N, [N|T]) :-
    M is N - 1,
    valid_numbers(M, T).

populate([], _, [], _).
populate([Row|T], SolSoFar, [PopRow|S], MaxNum ) :-
    number_pool(ValidNumbers),
    populate_row(Row, PopRow, ValidNumbers),
    PartialSol = [PopRow | SolSoFar],
    append(PartialSol, T, ColumnsToTest),   /* not very efficient -- but more efficient than not testing */
    check_columns(0, MaxNum, ColumnsToTest),/* check that cell values in this row fit across columns */
    Row = [(RI, _C, _V) | _T],
    check_subsquares(RI, 1, MaxNum, PartialSol),     /* including values added to previous rows */
    populate(T, PartialSol, S, MaxNum).     

check_subsquares(RowIndex, ColIndex, MaxNum, PartialSol) :-
    SubSqSize is round(sqrt(MaxNum)),
    X is mod(RowIndex, SubSqSize),
    X = 0, !,                                               /* need to check the squares */
    FirstRowIndex is RowIndex-SubSqSize + 1,
    subsquares(FirstRowIndex, ColIndex, SubSqSize, MaxNum, PartialSol, SubSquares), /* get me a list of subsquares */
    unique_subsquares(SubSquares).
check_subsquares(_,_,_,_).


subsquares(_, ColIndex, _, MaxNum, _, []) :-
    ColIndex > MaxNum, !.                    /* done all subsquares up to current row */
subsquares(RowIndex, ColIndex, SubSqSize, MaxNum, SolSoFar, [Square | Squares]) :-
    subsquare(RowIndex, ColIndex, SubSqSize, SolSoFar, Square),
    CI is ColIndex + SubSqSize,
    subsquares(RowIndex, CI, SubSqSize, MaxNum, SolSoFar, Squares).


subsquare(FirstRI, FirstCI, SubSqSize, SolSoFar, SubSquare) :-
    EndRI is FirstRI + SubSqSize-1,
    EndCI is FirstCI + SubSqSize-1,
    get_subrows(FirstRI, FirstCI, EndRI, EndCI, SolSoFar, SubRows),
    flatten(SubRows, SubSquare).

get_subrows(_,_,_,_,[], []).
get_subrows(RowIndex, ColIndex, EndRI, EndCI, [Row|OtherRows], [SubRow|SubRows]) :-
    get_cells(RowIndex, ColIndex, EndRI, EndCI, Row, SubRow),
    get_subrows(RowIndex, ColIndex, EndRI, EndCI, OtherRows, SubRows).

/* get all applicable cells from a single row */
get_cells(_, _, _, _, [],[]).
get_cells(RowIndex, ColIndex, EndRI, EndCI, [(R,C,V)|Cells], [(R,C,V)|SingleSubrow]) :-
    between(RowIndex,EndRI, R),
    between(ColIndex,EndCI, C),
    !,
    get_cells(RowIndex, ColIndex, EndRI, EndCI, Cells, SingleSubrow).
get_cells(RowIndex, ColIndex, EndRI, EndCI, [_|Cells], SingleSubrow) :-
    get_cells(RowIndex, ColIndex, EndRI, EndCI, Cells, SingleSubrow).


unique_subsquares([]).
unique_subsquares([Square | Squares]) :-
    strip_variables(Square, Sq),
    unique(Sq),
    unique_subsquares(Squares).

populate_row([],[], _).
populate_row([(R,C,V)|T], [(R,C,V)|Rest], ValidNumbers):-   /* current element is an atom, so keep it */
    nonvar(V), !,
    remove(V, ValidNumbers, Remaining),      /* remove it from the number pool for this row */
    populate_row(T, Rest, Remaining).
populate_row([(R,C,_)|T], [(R,C,N)|Rest], ValidNumbers):-  /* current element is a variable, so generate value */
    member(N, ValidNumbers),                /* this will backtrack through all solutions */
    remove(N, ValidNumbers, Remaining),     /* we don't want this value again in this row */
    populate_row(T, Rest, Remaining).

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


/* for each row, get me the Nth element (Value only). Put elements into a list. */
get_column([], _, []).
get_column([Row|T], N,[E |Es]) :-
    nth(N, Row, E),
    get_column(T, N, Es).

strip_variables([], []).
strip_variables([(_R,_C, H)|T], L):-
    var(H), !,
    strip_variables(T, L).
strip_variables([H|T], [H|L]) :-
    strip_variables(T, L).

unique([]).
unique([(_R, _C, V)|T]) :-
    member((_R1, _C1, V), T),
    !, fail.           /* No need to check the rest of the list. */
unique([_|T]) :-
    unique(T).

print_solution([]):- nl.
print_solution([H|T]) :-
    print_row(H), nl,
    print_solution(T).

print_row([]).
print_row([(_R, _C, V) | Cells]) :-
    print(V), print(' '),
    print_row(Cells).

