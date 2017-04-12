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
