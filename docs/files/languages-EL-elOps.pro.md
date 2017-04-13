# File _languages/EL/elOps.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/elOps.pro)**
```
:- module(elOps, []).

uop(neg, intval(I1), intval(I0)) :- I0 is - I1.
uop(not, boolval(true), boolval(false)).
uop(not, boolval(false), boolval(true)).
bop(add, intval(I1), intval(I2), intval(I0)) :- I0 is I1 + I2.
bop(sub, intval(I1), intval(I2), intval(I0)) :- I0 is I1 - I2.
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/EL/elOps.pro',prolog(text))
