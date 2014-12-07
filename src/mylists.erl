-module(mylists).
-compile(export_all).
-compile({no_auto_import,[max/2]}).

duplicate(0, _) -> [];
duplicate(N, X) -> [X|duplicate(N - 1, X)].

filter(_, []) -> [];
filter(Pred, [Hd|Tail]) ->
	case Pred(Hd) of
		true -> [Hd|filter(Pred, Tail)];
		false -> filter(Pred, Tail)
	end.
	
filtermap(_, []) -> [];
filtermap(Filter, [Hd|Tail]) ->
	case Filter(Hd) of
		true -> [Hd|filtermap(Filter, Tail)];
		{true, Value} -> [Value|filtermap(Filter,Tail)];
		false -> filtermap(Filter, Tail)
	end.
	
foldl(_, Acc, []) -> Acc;
foldl(Fun, Acc, [Hd|Tail]) -> foldl(Fun, Acc + Fun(Hd), Tail).

last([Hd|[]]) -> Hd;
last([_|Tail]) -> last(Tail).

max([Hd|Tail]) -> max(Hd, Tail).

max(Hd, []) -> Hd;
max(Max, [Hd|Tail]) when Max < Hd -> max(Hd, Tail);
max(Max, [_|Tail]) -> max(Max, Tail).

member(_, []) -> false;
member(Term, [Term|_]) -> true;
member(Term, [_|Tail]) -> member(Term, Tail).

nth(N, List) -> nth(1, N, List).

nth(N, N, [Hd|_]) -> Hd;
nth(M, N, [_|Tail]) -> nth(M + 1, N, Tail).

partition(Pred, List) -> partition(Pred, {[], []}, List).
partition(_, Result, []) -> Result;
partition(Pred, {Satisflying, NotSatisflying}, [Hd|Tail]) ->
	case Pred(Hd) of
		true -> partition(Pred, {Satisflying ++ [Hd], NotSatisflying}, Tail);
		false -> partition(Pred, {Satisflying, NotSatisflying ++ [Hd]}, Tail)
	end.

prefix([], _List) -> true;
prefix([Hd|A], [Hd|B]) -> prefix(A, B);
prefix(_, _) -> false.

reverse(List) -> reverse([], List).

reverse(List, []) -> List;
reverse(Prefix, [Hd|Tail]) -> reverse([Hd|Prefix], Tail).
	
	
	
	