# File _languages/BNL/Prolog/bnlTextToValueS.dcg_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/bnlTextToValueS.dcg)**
```
% BEGIN ...
:- module(bnlTextToValueS, []).
:- use_module(library(clpr)).
% END ...
number(Val0) -->
  bits(_Len, Val1),
  rest(Val2),
...
```

## Languages
* [DCG](../languages/DCG.md)

## References
* elementOf('languages/BNL/Prolog/bnlTextToValueS.dcg',dcg(prolog(text)))
