# File _languages/LAL/lib/cx/mapping.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/mapping.lal)**
```
reuse coupling
function mapping : L1 -> L2 // Mapping between languages
axiom { forall a <- L1. forall b <- L2. mapping(a) = b => consistent(a, b) }
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/cx/mapping.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/cx/mapping.lal'],['languages/LAL/lib/cx/mapping.term'])
