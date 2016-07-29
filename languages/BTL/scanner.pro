btlScanner([], []).

btlScanner([C|String], L) :-
    member(C, [10, 32]),
    btlScanner(String, L).

btlScanner(String1, [Token|L]) :-
    btlToken(Token),
    atom_codes(Token, String2),
    append(String2, String3, String1),
    btlScanner(String3, L).

btlToken('true').
btlToken('false').
btlToken('zero').
btlToken('succ').
btlToken('pred').
btlToken('iszero').
btlToken('if').
btlToken('then').
btlToken('else').
btlToken('(').
btlToken(')').
