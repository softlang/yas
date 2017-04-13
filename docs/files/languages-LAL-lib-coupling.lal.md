# File _languages/LAL/lib/coupling.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/coupling.lal)**
```
reuse language [ L |-> L1, Any |-> Any1 ]
reuse language [ L |-> L2, Any |-> Any2 ]
relation consistent : L1 # L2 // The consistency relationship
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/coupling.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/coupling.lal'],['languages/LAL/lib/coupling.term'])
