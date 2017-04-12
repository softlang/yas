# File _languages/BFPL/Prolog/big-step/op.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/big-step/op.pro)**
```
% BEGIN ...
% The union of BFPL and BIPL operators are covered here.
% END ...
opVal(add, intval(I1), intval(I2), intval(I0)) :- I0 is I1 + I2.
opVal(sub, intval(I1), intval(I2), intval(I0)) :- I0 is I1 - I2.
% BEGIN ...
% ...
opVal(mul, intval(I1), intval(I2), intval(I0)) :- I0 is I1 * I2.
opVal(eq, intval(I1), intval(I2), boolval(true)) :- I1 == I2.
opVal(eq, intval(I1), intval(I2), boolval(false)) :- I1 \= I2.
opVal(geq, intval(I1), intval(I2), boolval(true)) :- I1 >= I2.
opVal(geq, intval(I1), intval(I2), boolval(false)) :- I1 < I2.
% END ...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/BFPL/Prolog/big-step/op.pro',prolog(text))
