# File _languages/LAL/lib/traceability/refs.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/traceability/refs.lal)**
```
reuse traceability
relation refs : (RefL1 # RefL2)* # L1 # L2
axiom {
  forall ls <- (RefL1 # RefL2)* . forall a1 <- L1 . forall a2 <- L2 .
    (foreach (r1, r2) : ls . ref(r1, r2, a1, a2)) <=> refs(ls, a1, a2) }
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/traceability/refs.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/traceability/refs.lal'],['languages/LAL/lib/traceability/refs.term'])
