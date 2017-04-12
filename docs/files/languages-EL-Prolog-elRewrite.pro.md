# File _languages/EL/Prolog/elRewrite.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/elRewrite.pro)**
```
:- module(elRewrite, []).

rewrite(E1, E2) :- choice(elSimplify:(~>), elAssociate:(~>), E1, E2).
try(E1, E2) :- try(elRewrite:rewrite, E1, E2).
vtry(E1, E2) :- try(vary(elRewrite:rewrite, elCommute:(~>)), E1, E2).
fulltd(E1, E2) :- fulltd(elRewrite:try, E1, E2).
fullbu(E1, E2) :- fullbu(elRewrite:try, E1, E2).
innermost(E1, E2) :- innermost(elRewrite:rewrite, E1, E2).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EL/Prolog/elRewrite.pro',prolog(text))
