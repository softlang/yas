# File _languages/Prolog/expr.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Prolog/expr.pro)**
```
expr(X) :- number(X).
expr(add(E1, E2)) :- expr(E1), expr(E2).
expr(mul(E1, E2)) :- expr(E1), expr(E2).
```
