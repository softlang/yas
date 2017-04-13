# File _languages/LAL/lib/bx/state.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/bx/state.lal2)**
```
sort Any1
sort L1 <= Any1
sort Any2
sort L2 <= Any2
relation consistent : L1 # L2
function get : L1 -> L2
axiom {
...
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/bx/state.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/bx/state.term2'],['languages/LAL/lib/bx/state.lal2'])
* mapsTo(parse,['languages/LAL/lib/bx/state.lal2'],['languages/LAL/lib/bx/state.term2'])
