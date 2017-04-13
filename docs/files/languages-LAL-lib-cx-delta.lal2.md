# File _languages/LAL/lib/cx/delta.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/delta.lal2)**
```
sort Any
sort L <= Any
sort DiffAny
sort DiffL <= DiffAny
function diff : L # L -> DiffL
function applyDiff : DiffL # L -> L
function invDiff : DiffL -> DiffL
...
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/cx/delta.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/cx/delta.term2'],['languages/LAL/lib/cx/delta.lal2'])
* mapsTo(parse,['languages/LAL/lib/cx/delta.lal2'],['languages/LAL/lib/cx/delta.term2'])
