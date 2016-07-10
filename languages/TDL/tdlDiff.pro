:- module(tdlDiff, []).

diff(X, X, id).
diff(X, Y, replace(X, Y)) :-
    \+ X = Y,
    \+ is_list(X),
    \+ is_list(Y),
    \+ (X =.. [F|_], Y =.. [F|_]).
diff(X, Y, subterms(Ds)) :-
    \+ X = Y,
    \+ is_list(X),
    \+ is_list(Y),
    X =.. [F|Xs],
    Y =.. [F|Ys],
    map(tdlDiff:diff, Xs, Ys, Ds).
diff(X, Y, list(Ds)) :-
    \+ X = Y,
    is_list(X),
    is_list(Y),
    diffL(X, Y, Ds).

diffL([], [], nil).
diffL([H|Xs], [H|Ys], cons(id, Ds)) :-
    diffL(Xs, Ys, Ds).
diffL([X|Xs], [Y|Ys], cons(D, Ds)) :-
    \+ X = Y,
    length(Xs, L),
    length(Ys, L),
    diff(X, Y, D),
    diffL(Xs, Ys, Ds).
diffL([X|Xs], Ys, sub(X, Ds)) :-
    \+ Ys = [X|_],
    length(Xs, XL),
    length(Ys, YL),
    XL >= YL,
    diffL(Xs, Ys, Ds).
diffL(Xs, [Y|Ys], add(Y, Ds)) :-
    \+ Xs = [Y|_],
    length(Xs, XL),
    length(Ys, YL),
    XL =< YL,
    diffL(Xs, Ys, Ds).
