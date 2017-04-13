# File _languages/LAL/lib/bx/delta.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/bx/delta.lal)**
```
reuse bx.state
reuse differencing [ L |-> L2, Any |-> Any2 ]
function propagate : L1 # DiffL ~> L1
axiom { forall s1, s2 <- L1. forall v1, v2 <- L2. forall delta <- DiffL.
  get(s1) = v1
  /\ diff(v1, v2) = delta
  /\ propagate(s1, delta) = s2 =>
       put(s1, v2) = s2 /\ get(s2) = v2 }
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/bx/delta.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/bx/delta.lal'],['languages/LAL/lib/bx/delta.term'])
