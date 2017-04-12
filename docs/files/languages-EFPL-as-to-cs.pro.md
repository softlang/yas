# File _languages/EFPL/as-to-cs.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/as-to-cs.pro)**
```
% Render lists of functions
ppProg(L, S) :-
  map(ppFun, L, Bs),
  pp(vlist(Bs), S).

% Render functions
ppFun(
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EFPL/as-to-cs.pro',prolog(text))
