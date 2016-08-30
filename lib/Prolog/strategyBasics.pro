sequ(S1,S2,X,Z) :- apply(S1,[X,Y]), apply(S2,[Y,Z]).
choice(S1,S2,X,Y) :- once(apply(S1,[X,Y]); apply(S2,[X,Y])).
try(S,X,Y) :- choice(S,(=),X,Y).
repeat(S,X,Y) :- try(sequ(S,repeat(S)),X,Y).
% BEGIN ...
% Try strategy; try additional preprocessor in case of failure
vary(V, S, X, Y) :-
  choice(S, sequ(V, S), X, Y).
% END ...
all(S,X,Y) :- X =.. [F|LX], map(S, LX, LY), Y =.. [F|LY].
one(S,X,Y) :-
    X =.. [F|LX],
    once((
	append(LX1, [EX|LX2], LX),
	apply(S, [EX,EY]),
	append(LX1, [EY|LX2], LY))),
    Y =.. [F|LY].
