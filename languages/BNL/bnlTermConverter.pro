:- module(bnlTermConverter, []).

convert(number(Bits, Rest), Val1+Val2) :-
  bits(Bits, Len1-1, Len1, Val1),
  rest(Rest, Val2).

bits(single(Bit), Pos, 1, Val) :-
  bit(Bit, Pos, Val).

bits(many(Bit, Bits), Pos0, Len1+1, Val1+Val2) :-
  bit(Bit, Pos0, Val1),
  bits(Bits, Pos0-1, Len1, Val2).

bit(zero, _Pos, 0).
bit(one, Pos, 2^Pos).

rest(integer, 0).
rest(rational(Bits), Val) :-
  bits(Bits, -1, _Len, Val).
