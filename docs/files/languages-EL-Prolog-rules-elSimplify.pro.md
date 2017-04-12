# File _languages/EL/Prolog/rules/elSimplify.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/rules/elSimplify.pro)**
```
% BEGIN ...
:- module(elSimplify, []).
% END ...
binary(add, X, intconst(0)) ~> X.
binary(mul, X, intconst(1)) ~> X.
binary(mul, _, intconst(0)) ~> intconst(0).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EL/Prolog/rules/elSimplify.pro',prolog(text))
