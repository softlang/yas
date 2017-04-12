# File _languages/EIPL/Prolog/static.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/Prolog/static.pro)**
```
% BEGIN ...
% Static scope for both variables and procedures
:- module(eiplStatic, []).
% END ...
% BEGIN ...
% Begin with no procedures and an empty store
main(Scope, Out) :- scope(Scope, [], [], _, Out).
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EIPL/Prolog/static.pro',prolog(text))
