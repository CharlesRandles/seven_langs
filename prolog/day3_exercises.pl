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
	write('\t\t
	     '),
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

valid_set_3x3(List) :-
	fd_domain(List, 1, 9),
	fd_all_different(List).
valid_3x3([]).
valid_3x3([First|Rest]) :-
	fd_domain(First, 1, 9),
	fd_all_different(First),
	valid_3x3(Rest).

col(_, [], []).
col(N, [Row|Rows], [FirstCol|RestCols]) :-
	nth(N, Row, FirstCol),
	col(N, Rows, RestCols).

squ1([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A1, A2, A3, A10, A11, A12, A19, A20, A21]).

squ2([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A4, A5, A6, A13, A14, A15, A22, A23, A24]).

squ3([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A7, A8, A9, A17, A17, A18, A25, A26, A27]).
    
squ4([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A28, A29, A30, A37, A38, A39, A46, A47, A48]).

squ5([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A31, A32, A33, A40, A41, A42, A49, A50, A51]).

squ6([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A34, A35, A36, A43, A44, A45, A52, A53, A54]).

squ7([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A55, A56, A57, A64, A65, A66, A73, A74, A75]).

squ8([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A58, A59, A60, A67, A68, A69, A76, A77, A78]).

squ9([[A1,   A2,   A3,   A4,   A5,   A6,   A7,   A8,   A9], 
      [A10,  A11,  A12,  A13,  A14,  A15,  A16,  A17,  A18], 
      [A19,  A20,  A21,  A22,  A23,  A24,  A25,  A26,  A27], 
      [A28,  A29,  A30,  A31,  A32,  A33,  A34,  A35,  A36], 
      [A37,  A38,  A39,  A40,  A41,  A42,  A43,  A44,  A45], 
      [A46,  A47,  A48,  A49,  A50,  A51,  A52,  A53,  A54], 
      [A55,  A56,  A57,  A58,  A59,  A60,  A61,  A62,  A63], 
      [A64,  A65,  A66,  A67,  A68,  A69,  A70,  A71,  A72], 
      [A73,  A74,  A75,  A76,  A77,  A78,  A79,  A80,  A81]],     
     [A61, A62, A63, A70, A71, A72, A79, A80, A81]).


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