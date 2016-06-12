:- module(bnlTextConverter, []).

convert(X, Term) :-
  number(Term, X, []).

number(Val1+Val2) -->
  bits(Len1-1, Len1, Val1),
  rest(Val2).

bits(Pos, 1, Val) -->
  bit(Pos, Val).

bits(Pos0, Len1+1, Val1+Val2) -->
  bit(Pos0, Val1),
  bits(Pos0-1, Len1, Val2).

bit(_Pos, 0) --> ['0'].
bit(Pos, 2^Pos) --> ['1'].

rest(0) --> [].
rest(Val) -->
  ['.'],
  bits(-1, _Len, Val).
