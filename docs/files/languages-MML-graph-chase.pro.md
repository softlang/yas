# File _languages/MML/graph-chase.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/graph-chase.pro)**
```
% Chase members along super chain
chaseSuper(MM, Super, L) :-
  chaseSuper_(MM, [], Super, L).

% Chase finished when super is missing
chaseSuper_(_, _, [], []).

...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/graph-chase.pro',prolog(text))
