:- module(tdlApply, []).

apply(id, X, X).
apply(replace(X, Y), X, Y).
apply(subterms(Ds), X, Y) :-
    X =.. [F|Xs],
    map(tdlApply:apply, Ds, Xs, Ys),
    Y =.. [F|Ys].
apply(list(Ds), X, Y) :-
    applyl(Ds, X, Y).

applyl(nil, [], []).
applyl(cons(D, Ds), [X|Xs], [Y|Ys]) :-
    apply(D, X, Y),
    applyl(Ds, Xs, Ys).
applyl(sub(X, Ds), [X|Xs], Ys) :-
    applyl(Ds, Xs, Ys).
applyl(add(Y, Ds), Xs, [Y|Ys]) :-
    applyl(Ds, Xs, Ys).
