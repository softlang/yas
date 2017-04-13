# File _languages/LAL/lib/interpretation.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/interpretation.lal)**
```
reuse language [ L |-> L1, Any |-> Any1 ]
reuse language [ L |-> L2, Any |-> Any2 ]
reuse language [ L |-> XL, Any |-> XAny ]
function interpret : XL # L1 ~> L2
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/interpretation.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/interpretation.lal'],['languages/LAL/lib/interpretation.term'])
