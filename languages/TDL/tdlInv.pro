:- module(tdlInv, []).

inv(id, id).
inv(replace(X, Y), replace(Y, X)).
inv(subterms(Ds1), subterms(Ds2)) :-
    map(tdlInv:inv, Ds1, Ds2).
inv(list(Ds1), list(Ds2)) :-
    invl(Ds1, Ds2).

invl(nil, nil).
invl(cons(D1, Ds1), cons(D2, Ds2)) :-
    inv(D1, D2),
    invl(Ds1, Ds2).
invl(sub(X, Ds1), add(X, Ds2)) :-
    invl(Ds1, Ds2).
invl(add(X, Ds1), sub(X, Ds2)) :-
    invl(Ds1, Ds2).
