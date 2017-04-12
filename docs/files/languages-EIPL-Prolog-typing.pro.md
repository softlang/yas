# File _languages/EIPL/Prolog/typing.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/Prolog/typing.pro)**
```
% BEGIN ...
% Static scope for both variables and procedures
:- module(eiplTyping, []).
% END ...
% Begin with no procedures and an empty store
main(Scope) :- scope(Scope, 0, [], []).

...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EIPL/Prolog/typing.pro',prolog(text))
