# File _languages/BNL/Prolog/bnlFomula.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/bnlFomula.pro)**
```
:- module(bnlFormula, []).

formula(-1).
formula(0).
formula(1).
formula(2).
formula(X+Y) :- formula(X), formula(Y).
formula(X-Y) :- formula(X), formula(Y).
formula(X^Y) :- formula(X), formula(Y).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BNL/Prolog/bnlFomula.pro',prolog(text))
