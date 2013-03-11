-module(day2).
-export([lookup/2,
	 lang_type/1,
	 prices/1,
	 winner/1,
	 three_match/5,
	 p_wins/2,
	 full_board/1]).
-import(lists).

%Langs = [{ruby,"object-oriented"},
%	 {io,"prototype"},
%	 {prolog,"predicate logic"},
%	 {scala,"hybrid OO/Functional"}].

lookup(Key, KeyVals) ->
    lists:nth(1, 
	      lists:map(fun({_,B}) -> B end,
			lists:filter(fun({K,_}) ->
					     K==Key end, KeyVals))).

lang_type(Name) ->
    lookup(Name,  [{ruby,"object-oriented"},
		   {io,"prototype"},
		   {prolog,"predicate logic"},
		   {scala,"hybrid OO/Functional"}]).

prices(Shopping_List) ->
    [ {Item, Quantity * Price} || {Item, Quantity, Price} <- Shopping_List ].

%Shopping_List = [{"Mangos", 4, 3.00}, {"Avocados", 2, 2.50 }, {"Lettuce", 1, 2.30}]

%Tic-tac-toe again. Joy.
three_match(P1,P2,P3, Board, Player) ->
    (lists:nth(P1, Board) == Player) and
    (lists:nth(P1, Board) == lists:nth(P2, Board)) and
    (lists:nth(P2, Board) == lists:nth(P3, Board)).

p_wins(Board, Player) ->
    three_match(1,2,3, Board, Player) or
    three_match(4,5,6, Board, Player) or
    three_match(7,8,9, Board, Player) or
    three_match(1,4,7, Board, Player) or
    three_match(2,5,8, Board, Player) or
    three_match(3,6,9, Board, Player) or
    three_match(1,5,9, Board, Player) or
    three_match(3,5,7, Board, Player).

full_board(Board) ->
    lists:all(fun(P) -> (P==x) or (P==o) end ,  Board).

%This is actually reasonably clean.
winner(Board) ->
    Outcome = {p_wins(Board, x), p_wins(Board, o), full_board(Board)},
    case Outcome of
	{true, false, _} ->
	    x;
	{false, true, _} ->
	    o;
	{false,false, true} ->
	    tied;
	{false, false,false} ->
	    still_playing;
	 {true,true, _}->
	    invalid_board
    end.

    
