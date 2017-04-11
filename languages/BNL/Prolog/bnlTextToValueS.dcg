% BEGIN ...
:- module(bnlTextToValueS, []).
:- use_module(library(clpr)).
% END ...
number(Val0) -->
  bits(_Len, Val1),
  rest(Val2),
  { Val0 is Val1 + Val2 }.
bits(1, Val) -->
  bit(Val).
bits(Len0, Val0) -->
  bit(Val1),
  bits(Len1, Val2),
  { Len0 is Len1 + 1, Val0 is Val1 * 2^Len1 + Val2 }.
bit(0) --> ['0'].
bit(1) --> ['1'].
rest(0) --> [].
rest(Val0) -->
  ['.'],
  bits(Len, Val1),
  { Val0 is Val1 / 2^Len }. 
