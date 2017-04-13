# File _languages/LAL/lib/cast.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cast.lal)**
```
reuse language
function cast : Any ~> L
axiom castOk { forall e <- L . cast(e) = e }
axiom castFail { forall e1 <- Any . ~ (e1 <- L) => ~ (exists e2 <- L . cast(e1) = e2) }
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/cast.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/cast.lal'],['languages/LAL/lib/cast.term'])
