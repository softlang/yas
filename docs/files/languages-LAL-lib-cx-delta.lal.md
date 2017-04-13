# File _languages/LAL/lib/cx/delta.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/delta.lal)**
```
reuse differencing
reuse cx.cotransformation [
  L1 |-> L, Any1 |-> Any,
  L2 |-> DiffL, Any2 |-> DiffAny ]
relation compatible : L # L
axiom { forall x, y <- L. forall delta <- DiffL.
  compatible(x, y) /\ diff(x, y) = delta => consistent(x, delta) }
axiom { forall a, b <- L. forall delta1 <- DiffL.
  applyDiff(delta1, a) = b /\ compatible(a, b) =>
    (forall t <- XL. forall c <- L. forall delta2 <- DiffL.
      interpret(t, a) = c /\ interpret(t, delta1) = delta2 =>
        (exists d <- L. applyDiff(delta2, c) = d /\ compatible(c, d))) }
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/cx/delta.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/cx/delta.lal'],['languages/LAL/lib/cx/delta.term'])
