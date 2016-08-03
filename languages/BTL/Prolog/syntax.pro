% BEGIN ...
:- module(btlSyntax, []).
% END ...
isExpr(true).
isExpr(false).
isExpr(zero).
isExpr(succ(E)) :- isExpr(E).
isExpr(pred(E)) :- isExpr(E).
isExpr(iszero(E)) :- isExpr(E).
isExpr(if(E0, E1, E2)) :- isExpr(E0), isExpr(E1), isExpr(E2).
