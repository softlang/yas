# File _languages/EL/Prolog/rules/elAssociate.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/rules/elAssociate.pro)**
```
% BEGIN ...
:- module(elAssociate, []).
% END ...
binary(add, binary(add, X, Y), Z) ~> binary(add, X, binary(add, Y, Z)).
binary(mul, binary(mul, X, Y), Z) ~> binary(mul, X, binary(mul, Y, Z)).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EL/Prolog/rules/elAssociate.pro',prolog(text))
