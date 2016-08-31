% BEGIN ...
:- module(bnlTermEvaluator, []).
:- use_module(library(clpr)).
% END ...
number(number(Bits, Rest), Val0) :-
  bits(Bits, Pos1, Len1, Val1),
  rest(Rest, Val2),
  { Pos1 =:= Len1 - 1 },
  { Val0 =:= Val1 + Val2 }.
bits(single(Bit), Pos, Len, Val) :-
  bit(Bit, Pos, Val),
  { Len =:= 1 }.
bits(many(Bit, Bits), Pos0, Len0, Val0) :-
  bit(Bit, Pos0, Val1),
  bits(Bits, Pos1, Len1, Val2),
  { Pos1 =:= Pos0 - 1 },
  { Len0 =:= Len1 + 1 },
  { Val0 =:= Val1 + Val2 }.
bit(zero, _Pos, Val) :- { Val =:= 0 }.
bit(one, Pos, Val) :- { Val =:= 2 ^ Pos }.
rest(integer, Val) :- { Val =:= 0 }.
rest(rational(Bits), Val) :-
  bits(Bits, Pos, _Len, Val),
  { Pos =:= -1 }.
