% Strategic traversal schemes
fulltd(S,X,Y) :- sequ(S, all(fulltd(S)), X, Y).
fullbu(S,X,Y) :- sequ(all(fullbu(S)), S, X, Y).
stoptd(S,X,Y) :- choice(S, all(stoptd(S)), X, Y).
oncetd(S,X,Y) :- choice(S, one(oncetd(S)), X, Y).
oncebu(S,X,Y) :- choice(one(oncebu(S)), S, X, Y).
innermost(S,X,Y) :- repeat(oncebu(S),X,Y).

% Basic strategy combinators
sequ(S1,S2,X,Z) :- apply(S1,[X,Y]), apply(S2,[Y,Z]).
choice(S1,S2,X,Y) :- once(apply(S1,[X,Y]); apply(S2,[X,Y])).
all(S,X,Y) :- X =.. [F|LX], map(S, LX, LY), Y =.. [F|LY].
one(S,X,Y) :-
    X =.. [F|LX],
    once((
        append(LX1, [EX|LX2], LX),
        apply(S, [EX,EY]),
        append(LX1, [EY|LX2], LY))),
    Y =.. [F|LY].

% Helper strategy combinators
try(S,X,Y) :- choice(S,(=),X,Y).
vary(S, V, X, Y) :- choice(S, sequ(V, S), X, Y).
repeat(S,X,Y) :- try(sequ(S,repeat(S)),X,Y).
