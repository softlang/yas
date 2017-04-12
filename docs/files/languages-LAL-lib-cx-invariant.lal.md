# File _languages/LAL/lib/cx/invariant.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/invariant.lal)**
```
reuse coupling
reuse interpretation [ L2 |-> L1, Any2 |-> Any1 ]
axiom { forall t <- XL. forall a, c <- L1. forall b <- L2.
  consistent(a, b) /\ interpret(t, a) = c
    => consistent(c, b) }
```
