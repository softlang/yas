% BEGIN ...
:- module(bnlTextEvaluator, []).

:- use_module(library(clpr)).

evaluate(X, Val) :-
  number(Val, X, []).
% END ...
number(Val0) -->
  bits(Pos1, Len1, Val1),
  rest(Val2),
  { { Pos1 =:= Len1 - 1 } },
  { { Val0 =:= Val1 + Val2 } }.
bits(Pos, Len, Val) -->
  bit(Pos, Val),
  { { Len =:= 1 } }.
bits(Pos0, Len0, Val0) -->
  bit(Pos0, Val1),
  bits(Pos1, Len1, Val2),
  { { Pos1 =:= Pos0 - 1 } },
  { { Len0 =:= Len1 + 1 } },
  { { Val0 =:= Val1 + Val2 } }.
bit(_Pos, Val) --> ['0'], { { Val =:= 0 } }.
bit(Pos, Val) --> ['1'], { { Val =:= 2 ^ Pos } }.
rest(Val) --> { { Val =:= 0 } }.
rest(Val) -->
  ['.'],
  bits(Pos, _Len, Val),
  { { Pos =:= -1 } }.
