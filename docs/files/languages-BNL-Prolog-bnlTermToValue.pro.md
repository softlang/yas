# File _languages/BNL/Prolog/bnlTermToValue.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/bnlTermToValue.pro)**
```
% BEGIN ...
:- module(bnlTermToValue, []).
:- use_module(library(clpr)).
% END ...
number(number(Bits, Rest), Val0) :-
  bits(Bits, Pos1, Len1, Val1),
  rest(Rest, Val2),
...
```
