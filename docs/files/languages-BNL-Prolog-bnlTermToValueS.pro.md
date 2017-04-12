# File _languages/BNL/Prolog/bnlTermToValueS.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/bnlTermToValueS.pro)**
```
% BEGIN ...
:- module(bnlTermToValueS, []).
% END ...
number(number(Bits, Rest), Val0) :-
  bits(Bits, _Len, Val1),
  rest(Rest, Val2),
  Val0 is Val1 + Val2.
...
```
