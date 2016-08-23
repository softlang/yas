% Generic traversal to collect a list by extraction from each subterm
collect(Pred, Term, List0) :-
  ( apply(Pred, [Term, List1]) -> true; List1 = [] ),
  Term =.. [_|Terms],
  map(collect(Pred), Terms, Lists),
  concat(Lists, List2),
  append(List1, List2, List0).

% Generic traversal to replace potentially each term
replace(Pred, Term1, Term3) :-
  Term1 =.. [F|Terms1],
  map(replace(Pred), Terms1, Terms2),
  Term2 =.. [F|Terms2],
  ( apply(Pred, [Term2, Term3]) -> true ; Term3 = Term2 ).

% Top-down traversal
topdown(P, X, Z) :-
    apply(P, [X, Y]),
    ( ( atomic(Y); var(Y) ) ->
	  Z = Y
        ; Y =.. [F|Ts1],
	  map(topdown(P), Ts1, Ts2),
	  Z =.. [F|Ts2] ).
