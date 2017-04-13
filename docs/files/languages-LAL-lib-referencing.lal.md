# File _languages/LAL/lib/referencing.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/referencing.lal)**
```
reuse composition
reuse language [ L |-> RefL, Any |-> RefAny ]
function deref : RefL # L ~> L
axiom { forall r <- RefL. forall x, y <- L. deref(r, x) = y => partOfStar(y, x) }
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/referencing.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/referencing.lal'],['languages/LAL/lib/referencing.term'])
