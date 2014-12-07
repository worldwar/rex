-module(mylists_tests).
-include_lib("eunit/include/eunit.hrl").

test_map(X) ->
	if 
		X > 10 -> {true, 1};
		true -> false
	end.
	
is_even(X) -> X rem 2 == 0.
	
identity(X) -> X.

multiply(X, Y) -> X * Y.

multiply_two(X) -> multiply(X, 2).

filter_test() ->
	?assertEqual([5, 10], mylists:filter(fun(X) -> X rem 5 == 0 end, [1, 5, 10 , 14])),
	?assertEqual([], mylists:filter(fun(X) -> X rem 5 end, [])).

filtermap_test() ->
	?assertEqual([1, 1, 1], mylists:filtermap(fun test_map/1, [11, 0, 9 ,10, 40, 90])).
		
foldl_test() ->
	?assertEqual(25, mylists:foldl(fun identity/1, 0, [1,2,3,4,5,10])),
	?assertEqual(50, mylists:foldl(fun multiply_two/1, 0, [1, 2, 3, 4, 5, 10])).
		
last_test() ->
	?assertEqual(1, mylists:last([1,2,3,1])),
	?assertEqual([1], mylists:last([1, 2, 3, [1]])).
	
max_test() ->
	?assertEqual(9, mylists:max([1, 2, 4, 9])).
	
member_test() ->
	?assertEqual(true, mylists:member(4,[1,2,3,4,5,6])),
	?assertEqual(false, mylists:member(7, [1,2,3,4,5,6])).
	
nth_test() ->
	?assertEqual(3, mylists:nth(3, [1,4,3])).
	
partition_test() ->
	?assertEqual({[2,6,8,4,0], [1,5,7,3]}, mylists:partition(fun is_even/1, [1,2,5,7,6,8,4,3,0])).
		
prefix_test() ->
	?assertEqual(true, mylists:prefix([1,2,3], [1,2,3,4])),
	?assertEqual(true, mylists:prefix([1,2,3], [1,2,3])),
	?assertEqual(true, mylists:prefix([], [1,2,3])),
	?assertEqual(false, mylists:prefix([1,2,3], [1,2,4])),
	?assertEqual(false, mylists:prefix([1], [])),
	?assertEqual(false, mylists:prefix([1], [[1], 2])).		

reverse_test() ->
	?assertEqual([2,1], mylists:reverse([1,2])),
	?assertEqual([1], mylists:reverse([1])),
	?assertEqual([], mylists:reverse([])),
	?assertEqual([[1,2], [2,1]], mylists:reverse([[2,1], [1,2]])),
	?assertEqual([a, b, c, 1, 2], mylists:reverse([2,1,c,b,a])).
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	