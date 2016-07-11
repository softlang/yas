:- module(ddlEq, []).

% Order of tables does not matter
eq(Ts1, Ts2) :-
    map(ddlEq:sortTable, Ts1, Ts3),
    map(ddlEq:sortTable, Ts2, Ts4),
    sort(Ts3, Ts5),
    sort(Ts4, Ts5).

% Order of columns does not matter
sortTable((TN, Cs1), (CN, Cs2)) :-
    sort(Cs1, Cs2).
