# File _languages/BNL/Prolog/bnlTermToFormula.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/bnlTermToFormula.pro)**
```
% BEGIN ...
:- module(bnlTermToFormula, []).
% END ...
number(number(Bits, Rest), Val1+Val2) :-
    bits(Bits, Len1-1, Len1, Val1),
    rest(Rest, Val2).
bits(single(Bit), Pos, 1, Val) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BNL/Prolog/bnlTermToFormula.pro',prolog(text))
