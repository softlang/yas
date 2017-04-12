# File _languages/EIPL/Prolog/dynamic.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/Prolog/dynamic.pro)**
```
% BEGIN ...
% Dynamic scope for both variables and procedures
:- module(eiplDynamic, []).
% END ...
% Begin with no procedures and an empty store
main(Scope, Out) :- scope(Scope, [], [], _, Out).

...
```
