# File _languages/BNL/Prolog/bnlTextToValue.dcg_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/bnlTextToValue.dcg)**
```
% BEGIN ...
:- module(bnlTextToValue, []).
:- use_module(library(clpr)).
% END ...
number(Val0) -->
  bits(Pos1, Len1, Val1),
  rest(Val2),
...
```

## Languages
* [DCG](../languages/DCG.md)

## References
* elementOf('languages/BNL/Prolog/bnlTextToValue.dcg',dcg(prolog(text)))
