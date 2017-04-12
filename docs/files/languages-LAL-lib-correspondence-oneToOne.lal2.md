# File _languages/LAL/lib/correspondence/oneToOne.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/correspondence/oneToOne.lal2)**
```
sort Any1
sort L1 <= Any1
relation partOf : L1 # L1
relation partOfPlus : L1 # L1
relation partOfStar : L1 # L1
axiom partAsym {
 forall x <- L1.
...
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/correspondence/oneToOne.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/correspondence/oneToOne.term2'],['languages/LAL/lib/correspondence/oneToOne.lal2'])
* mapsTo(parse,['languages/LAL/lib/correspondence/oneToOne.lal2'],['languages/LAL/lib/correspondence/oneToOne.term2'])
