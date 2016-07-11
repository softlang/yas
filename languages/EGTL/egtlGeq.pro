:- module(egtlGeq, []).

geq((L, N, Ss1), (L, N, Ss2)) :-
    geq(Ss1, Ss2).
geq([], []).
geq([S|Ss1], [S|Ss2]) :-
    geq(Ss1, Ss2).
geq([option(Ss1)|Ss2], Ss3) :-
    append(Ss1, Ss4, Ss3),
    geq(Ss2, Ss4).
% ...
