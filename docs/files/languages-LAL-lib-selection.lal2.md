# File _languages/LAL/lib/selection.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/selection.lal2)**
```
sort Any
sort L <= Any
sort QAny
sort QL <= QAny
relation partOf : L # L
relation partOfPlus : L # L
relation partOfStar : L # L
...
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/selection.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/selection.term2'],['languages/LAL/lib/selection.lal2'])
* mapsTo(parse,['languages/LAL/lib/selection.lal2'],['languages/LAL/lib/selection.term2'])
