# File _languages/BFPL/Prolog/denotational/op.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/denotational/op.pro)**
```
meaningOp(add, F1, F2, X, intval(I0)) :-
  passTo(F1, [X, I1]),
  apply(F2, [X, I2]),
  I0 is I1 + I2.

meaningOp(sub, F1, F2, X, intval(I0)) :-
  apply(F1, [X, I1]),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/BFPL/Prolog/denotational/op.pro',prolog(text))
