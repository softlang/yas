# File _languages/BIPL/Prolog/big-step/execute.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Prolog/big-step/execute.pro)**
```
% BEGIN ...
:- module(biplBigstep, []).
% END ...
% Begin with an empty store if no store is provided
execute(S, Sto) :- execute(S, [], Sto).

% A skip statement completes trivially
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BIPL/Prolog/big-step/execute.pro',prolog(text))
