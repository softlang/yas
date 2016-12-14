% BEGIN ...
:- module(bnlTermToValueS, []).
% END ...
number(number(Bits, Rest), Val0) :-
  bits(Bits, _Len, Val1),
  rest(Rest, Val2),
  Val0 is Val1 + Val2.
bits(single(Bit), 1, Val) :-
  bit(Bit, Val).
bits(many(Bit, Bits), Len0, Val0) :-
  bit(Bit, Val1),
  bits(Bits, Len1, Val2),
  Len0 is Len1 + 1,
  Val0 is Val1 * 2^Len1 + Val2.
bit(zero, Val) :- Val is 0.
bit(one, Val) :- Val is 1.
rest(integer, Val) :- Val is 0.
rest(rational(Bits), Val0) :-
  bits(Bits, Len, Val1),
  Val0 is Val1 / 2^Len.  
