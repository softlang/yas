# File _languages/LAL/lib/traceability.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/traceability.lal)**
```
reuse referencing [ L |-> L1, RefL |-> RefL1 ]
reuse referencing [ L |-> L2, RefL |-> RefL2 ]
relation ref : RefL1 # RefL2 # L1 # L2
axiom { forall r1 <- RefL1 . forall r2 <- RefL2 .
  forall a1 <- L1 . forall a2 <- L2 .
    (exists b1 <- L1 . exists b2 <- L2 .
      deref(r1, a1) = b1 /\ deref(r2, a2) = b2)
        <=> ref(r1, r2, a1, a2) }
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/traceability.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/traceability.lal'],['languages/LAL/lib/traceability.term'])
