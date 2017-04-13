# File _languages/LAL/lib/correspondence/oneToOne.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/correspondence/oneToOne.lal)**
```
reuse correspondence
relation related : L1 # L2
axiom { forall a1 <- L1. forall a2 <- L2.
  related(a1, a2)
    /\ (forall b1 <- L1. partOf(b1, a1) => 
          exists! b2 <- L2. partOf(b2, a2) /\ correspondsTo(b1, b2))
    /\ (forall b2 <- L2. partOf(b2, a2) =>
          exists! b1 <- L1. partOf(b1, a1) /\ correspondsTo(b1, b2))
  => correspondsTo(a1, a2) }
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/correspondence/oneToOne.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/correspondence/oneToOne.lal'],['languages/LAL/lib/correspondence/oneToOne.term'])
