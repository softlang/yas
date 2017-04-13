# File _languages/LAL/lib/composition.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/composition.lal)**
```
reuse language
relation partOf, partOfPlus, partOfStar : L # L
axiom partAsym { forall x, y <- L. partOf(x, y) => ~partOf(y, x) }
axiom partReflexive { forall x <- L. partOfStar(x, x) }
axiom partTransitive { forall x, y <- L.
  (partOf(x, y) => partOfPlus(x, y))
  /\ (partOfPlus(x, y) => partOfStar(x, y))
  /\ (forall z <- L. partOfPlus(x, z) /\ partOfPlus(z, y) => partOfPlus(x, y)) }
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/composition.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/composition.lal'],['languages/LAL/lib/composition.term'])
