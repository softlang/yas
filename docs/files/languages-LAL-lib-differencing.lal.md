# File _languages/LAL/lib/differencing.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/differencing.lal)**
```
reuse language // The language of artifacts to be diffed
reuse language [ L |-> DiffL, Any |-> DiffAny ] // Differences
function diff : L # L -> DiffL // The differencing algorithm
function applyDiff : DiffL # L -> L // Application of differences
function invDiff : DiffL -> DiffL // Inversion of differences
constant emptyDiff : DiffL // The unit for differences
axiom apply { forall x, y <- L. forall d <- DiffL. applyDiff(diff(x, y), x) = y }
axiom inv { forall x, y <- L. invDiff(diff(x,y)) = diff(y,x) }
axiom diffEmpty { forall x <- L. diff(x, x) = emptyDiff }
axiom empty { forall x <- L. applyDiff(emptyDiff, x) = x }
axiom invEmpty { invDiff(emptyDiff) = emptyDiff }
axiom invTwice { forall d <- DiffL. invDiff(invDiff(d)) = d }
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/differencing.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/differencing.lal'],['languages/LAL/lib/differencing.term'])
