-module(day1).
-export([count_words/1,
	 count_to_10/1,
	 pass_fail/1]).
-import(io).
-import(string).

%string:tokens is the key to this...
count_words(S) ->
     num_tokens(string:tokens(S, " ")).

num_tokens([]) ->
     0;
num_tokens([_|T]) ->
    1 + num_tokens(T).

count_to_10(10) ->
    io:format("~B\n", [10]);

count_to_10(N) ->
    io:format("~B\n", [N]),
    count_to_10(1+N).

pass_fail(success) ->
    io:format("~s\n", ["Success!"]);
pass_fail({error, Message}) ->
    io:format("~s\n", [Message]).
