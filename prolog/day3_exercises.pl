/*
  Exercises from day 3
*/

/*
  Reading and writing
*/

print_row([]) :-
	write('|').

print_row([H|T]) :-
	write('|'),
	write(H),
	/*write('\t'),*/
	print_row(T).

print_2d_array([]).
print_2d_array([Line1|Rest]) :-
	nl,
	print_row(Line1),
	print_2d_array(Rest),
	nl.
/*print_2d_array([[3,4,5], [1,2], [5,6,876]]). */

/*
  3x2 Sudoku
*/

valid_set_3x2(List) :-
	fd_domain(List, 1, 6),
	fd_all_different(List).
valid_3x2([]).
valid_3x2([First|Rest]) :-
	valid_set_3x2(First),
	valid_3x2(Rest).

sudoku_3x2(Puzzle, Solution) :-
	Solution = Puzzle,
	Puzzle=[[S1,  S2,  S3,  S4,  S5,  S6 ],
		[S7,  S8,  S9,  S10, S11, S12],
		[S13, S14, S15, S16, S17, S18],
		[S19, S20, S21, S22, S23, S24]],
	Row1 = [S1,  S2,  S3,  S4,  S5,  S6 ],
	Row2 = [S7,  S8,  S9,  S10, S11, S12],
	Row3 = [S13, S14, S15, S16, S17, S18],
	Row4 = [S19, S20, S21, S22, S23, S24],
	Col1 = [S1,S7,S13,S19],
	Col2 = [S2,S8,S14,S20],
	Col3 = [S3,S9,S15,S21],
	Col4 = [S4,S10,S16,S22],
	Col5 = [S5,S11,S17,S23],
	Col6 = [S6,S12,S18,S24],
	Block1=[S1,S2,S3,S7,S8,S9],
	Block2=[S4,S5,S6,S10,S11,S12],
	Block3=[S13,S14,S15,S19,S20,S21],
	Block4=[S16,S17,S18,S22,S23,S24],
	valid_3x2([Row1, Row2, Row3, Row4,
		  Col1, Col2, Col3, Col4, Col5, Col6,
		  Block1,Block2,Block3,Block4]),
	print_2d_array(Puzzle).
	


/*
  3x2
  [[1,2,3,4,5,6],[_,_,_,_,_,_],[_,_,_,_,_,_],[_,_,_,_,_,_]]
*/

/*
  Now let's do a 3x3
*/

in_range([], _, _).
in_range([H|T], Min, Max) :-
	H >= Min,
	H =< Max,
	in_range(T, Min, Max).

find_valid(List, Answer) :-
	Answer = List,
	fd_domain(List, 1, 9),
	fd_all_different(List).

nine_different([A1,A2,A3,A4,A5,A6,A7,A8,A9]) :-
	A1\=A2, A1\=A3, A1\=A4, A1\=A5, A1\=A6, A1\=A7, A1\=A8, A1\=A9,
	A2\=A3, A2\=A4, A2\=A5, A2\=A6, A2\=A7, A2\=A8, A2\=A9,
	A3\=A4, A3\=A5, A3\=A6, A3\=A7, A3\=A8, A3\=A9,
	A4\=A5, A4\=A6, A4\=A7, A4\=A8, A4\=A9,
	A5\=A6, A5\=A7, A5\=A8, A5\=A9,
	A6\=A7, A6\=A8, A6\=A9,
	A7\=A8, A7\=A9,
	A8\=A9.

four_different([A1, A2, A3, A4]) :-
	A1\=A2,A1\=A3,A1\=A4,
	A2\=A3,A2\=A4,
	A3\=A4.

all_in_set([], _).
all_in_set([H|T], Set) :-
	member(H, Set),
	all_in_set(T, Set).

valid_3x3([]).
valid_3x3([First|Rest]) :-
	all_in_set(First, [1,2,3,4,5,6,7,8,9]),
	nine_different(First),
	valid_3x3(Rest).

valid_2x2([]).
valid_2x2([First|Rest]):-
	all_in_set(First, [1,2,3,4]),
	four_different(First),
	valid_2x2(Rest).

col(_, [], []).
col(N, [Row|Rows], [FirstCol|RestCols]) :-
	nth(N, Row, FirstCol),
	col(N, Rows, RestCols).

squ1([[A,B,C,_,_,_,_,_,_],
      [D,E,F,_,_,_,_,_,_],
      [G,H,I,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_]],
     [A,B,C,D,E,F,G,H,I]).

squ2([[_,_,_,A,B,C,_,_,_],
      [_,_,_,D,E,F,_,_,_],
      [_,_,_,G,H,I,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_]],
     [A,B,C,D,E,F,G,H,I]).
squ3([[_,_,_,_,_,_,A,B,C],
      [_,_,_,_,_,_,D,E,F],
      [_,_,_,_,_,_,G,H,I],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_]],
     [A,B,C,D,E,F,G,H,I]).
squ4([[_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [A,B,C,_,_,_,_,_,_],
      [D,E,F,_,_,_,_,_,_],
      [G,H,I,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_]],
     [A,B,C,D,E,F,G,H,I]).
squ5([[_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,A,B,C,_,_,_],
      [_,_,_,D,E,F,_,_,_],
      [_,_,_,G,H,I,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_]],
     [A,B,C,D,E,F,G,H,I]).
squ6([[_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,A,B,C],
      [_,_,_,_,_,_,D,E,F],
      [_,_,_,_,_,_,G,H,I],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_]],
     [A,B,C,D,E,F,G,H,I]).
squ7([[_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [A,B,C,_,_,_,_,_,_],
      [D,E,F,_,_,_,_,_,_],
      [G,H,I,_,_,_,_,_,_]],
     [A,B,C,D,E,F,G,H,I]).
squ8([[_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,A,B,C,_,_,_],
      [_,_,_,D,E,F,_,_,_],
      [_,_,_,G,H,I,_,_,_]],
     [A,B,C,D,E,F,G,H,I]).
squ9([[_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,_,_,_],
      [_,_,_,_,_,_,A,B,C],
      [_,_,_,_,_,_,D,E,F],
      [_,_,_,_,_,_,G,H,I]],
     [A,B,C,D,E,F,G,H,I]).

sudoku_3x3(Puzzle, Solution) :-
	Solution = Puzzle,
	nth(1, Puzzle, Row1),
	nth(2, Puzzle, Row2),
	nth(3, Puzzle, Row3),
	nth(4, Puzzle, Row4),
	nth(5, Puzzle, Row5),
	nth(6, Puzzle, Row6),
	nth(7, Puzzle, Row7),
	nth(8, Puzzle, Row8),
	nth(9, Puzzle, Row9),	
	col(1, Puzzle, Col1),
	col(2, Puzzle, Col2),
	col(3, Puzzle, Col3),
	col(4, Puzzle, Col4),
	col(5, Puzzle, Col5),
	col(6, Puzzle, Col6),
	col(7, Puzzle, Col7),
	col(8, Puzzle, Col8),
	col(9, Puzzle, Col9),
	squ1(  Puzzle, Squ1),
	squ2(  Puzzle, Squ2),
	squ3(  Puzzle, Squ3),
	squ4(  Puzzle, Squ4),
	squ5(  Puzzle, Squ5),
	squ6(  Puzzle, Squ6),
	squ7(  Puzzle, Squ7),
	squ8(  Puzzle, Squ8),
	squ9(  Puzzle, Squ9),
	valid_3x3([Row1, Row2, Row3, Row4, Row5, Row6, Row7, Row8, Row9,
		   Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9,
		   Squ1, Squ2, Squ3, Squ4, Squ5, Squ6, Squ7, Squ8, Squ9]),
	print_2d_array(Solution).

tls([[A,B,_,_],
     [C,D,_,_],
     [_,_,_,_],
     [_,_,_,_]], [A,B,C,D]).

trs([[_,_,A,B],
     [_,_,C,D],
     [_,_,_,_],
     [_,_,_,_]], [A,B,C,D]).

bls([[_,_,_,_],
     [_,_,_,_],
     [A,B,_,_],
     [C,D,_,_]], [A,B,C,D]).

brs([[_,_,_,_],
     [_,_,_,_],
     [_,_,A,B],
     [_,_,C,D]], [A,B,C,D]).


sudoku_2x2(Puzzle, Solution) :-
	Solution = Puzzle,
	nth(1, Puzzle, Row1),
	nth(2, Puzzle, Row2),
	nth(3, Puzzle, Row3),
	nth(4, Puzzle, Row4),
	col(1, Puzzle, Col1),
	col(2, Puzzle, Col2),
	col(3, Puzzle, Col3),
	col(4, Puzzle, Col4),
	tls(Puzzle, TL),
	trs(Puzzle, TR),
	bls(Puzzle, BL),
	brs(Puzzle, BR),
	valid_2x2([Row1, Row2, Row3, Row4, Col1, Col2, Col3, Col4, TL, TR, BL, BR]),
	print_2d_array(Solution).
	

/*
[[_,  _,  _,  _,  _,  _,  _,  _,  _],
 [_,  _,  _,  _,  _,  _,  _,  _,  _],
 [_,  _,  _,  _,  _,  _,  _,  _,  _],
 [_,  _,  _,  _,  _,  _,  _,  _,  _], 
 [_,  _,  _,  _,  _,  _,  _,  _,  _], 
 [_,  _,  _,  _,  _,  _,  _,  _,  _], 
 [_,  _,  _,  _,  _,  _,  _,  _,  _], 
 [_,  _,  _,  _,  _,  _,  _,  _,  _], 
 [_,  _,  _,  _,  _,  _,  _,  _,  _]]

Completed:
[[6,3,8,2,1,9,7,4,5],
[7,4,9,3,5,8,6,2,1],
[2,1,5,7,6,4,3,8,9],
[3,9,2,6,4,1,8,5,7],
[5,6,7,8,9,3,2,1,4],
[4,8,1,5,2,7,9,6,3],
[8,2,3,4,7,5,1,9,6],
[9,5,6,1,3,2,4,7,8],
[1,7,4,9,8,6,5,3,2]]

Trivial:
[[_,_,8,2,1,9,7,4,5],
 [_,_,9,3,5,8,6,2,1],
 [2,1,5,7,6,4,3,8,9],
 [3,9,2,6,4,1,8,5,7],
 [5,6,7,8,9,3,2,1,4],
 [4,8,1,5,2,7,9,6,_],
 [8,2,3,4,7,5,1,9,_],
 [9,5,6,1,3,2,4,7,_],
 [1,7,4,9,8,6,5,3,_]]
  
  
Easy:
 [[6,_,_,2,_,_,7,4,_],
  [_,_,9,3,5,8,_,_,_],
  [2,1,_,_,6,_,3,_,9],
  [_,9,_,6,_,_,8,5,7],
  [_,_,7,8,_,3,2,_,_],
  [4,8,1,_,_,7,_,6,_],
  [8,_,3,_,7,_,_,9,6],
  [_,_,_,1,3,2,_,_,_],
  [_,7,4,_,_,_,_,_,2]]

Very hard:
[[3,  _,  _,  _,  2,  _,  _,  _,  _],
 [_,  _,  8,  _,  _,  6,  _,  _,  _],
 [_,  _,  6,  3,  4,  9,  _,  _,  _],
 [6,  4,  _,  _,  _,  _,  8,  1,  _], 
 [_,  2,  _,  _,  _,  _,  _,  4,  _], 
 [_,  7,  1,  _,  _,  _,  _,  9,  2], 
 [_,  _,  _,  1,  8,  7,  3,  _,  _], 
 [_,  _,  _,  5,  _,  _,  1,  _,  _], 
 [_,  _,  _,  _,  6,  _,  _,  _,  4]]

  
*/