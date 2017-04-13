# File _languages/LAL/lib/referencing.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/referencing.lal2)**
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
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/referencing.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/referencing.term2'],['languages/LAL/lib/referencing.lal2'])
* mapsTo(parse,['languages/LAL/lib/referencing.lal2'],['languages/LAL/lib/referencing.term2'])
