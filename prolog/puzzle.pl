check_four([1,2,3,4]).
check_four([1,2,4,3]).
check_four([1,3,2,4]).
check_four([1,3,4,2]).
check_four([1,4,2,3]).
check_four([1,4,3,2]).
check_four([2,1,3,4]).
check_four([2,1,4,3]).
check_four([2,1,4,3]).
check_four([2,1,3,4]).
check_four([2,3,1,4]).
check_four([2,3,4,1]).
check_four([3,1,2,4]).
check_four([3,1,4,2]).
check_four([3,2,1,4]).
check_four([3,2,4,1]).
check_four([3,4,1,2]).
check_four([3,4,2,1]).
check_four([4,1,2,3]).
check_four([4,1,3,2]).
check_four([4,2,1,3]).
check_four([4,2,3,1]).
check_four([4,3,1,2]).
check_four([4,3,2,1]).

sudoku([A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,AC,AD,AE,AF]) :-
	check_four([A0, A1, A2, A3]), /* Rows */
	check_four([A4, A5, A6, A7]),
	check_four([A8, A9, AA, AB]),
	check_four([AA, A1, A2, A3]),

	check_four([A0, A4, A8, AC]), /* cols */
	check_four([A1, A5, A9, AD]),
	check_four([A2, A6, AA, AE]),
	check_four([A3, A7, AB, AF]),

	check_four([A0, A1, A4, A5]), /* squares */
	check_four([A2, A3, A6, A7]),
	check_four([A8, A9, AC, AD]),
	check_four([AA, AB, AE, AF]).

	
	


/*
sudoku([1,2,3,4,
        3,4,1,2,
        A,B,C,D,
        E,F,G,H]).
sudoku([1,2,3,4,4,3,2,1,A,B,C,D, E,F,G,H]).

*/	  