# File _languages/LAL/lib/selection.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/selection.lal)**
```
reuse language // Input language
reuse language [ L |-> QL, Any |-> QAny ] // Selector (query) language
reuse composition
function select : QL # L ~> L* // Semantics of selection
axiom {
  forall q <- QL . forall x <- L . forall ys <- L* .
    select(q, x) = ys => (foreach y : ys . partOfStar(y, x)) }
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/selection.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/selection.lal'],['languages/LAL/lib/selection.term'])
