# File _languages/LAL/lib/composition.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/composition.lal2)**
```
sort Any
sort L <= Any
relation partOf : L # L
relation partOfPlus : L # L
relation partOfStar : L # L
axiom partAsym {
 forall x <- L.
...
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/composition.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/composition.term2'],['languages/LAL/lib/composition.lal2'])
* mapsTo(parse,['languages/LAL/lib/composition.lal2'],['languages/LAL/lib/composition.term2'])
