# File _languages/LAL/lib/application.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/application.lal2)**
```
sort Any1
sort L1 <= Any1
sort Any2
sort L2 <= Any2
sort XAny
sort XL <= XAny
function interpretTyped : XL # L1 ~> L2
...
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/application.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/application.term2'],['languages/LAL/lib/application.lal2'])
* mapsTo(parse,['languages/LAL/lib/application.lal2'],['languages/LAL/lib/application.term2'])
