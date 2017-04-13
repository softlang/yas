# File _languages/Ueber/macros/forall.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/forall.pro)**
```
forall(L1, P) :-
  findall(Y, (member(X, L1), Y =.. [P, X]), L2),
  ueber(L2). 
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/Ueber/macros/forall.pro',prolog(text))
