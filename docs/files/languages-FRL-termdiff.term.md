# File _languages/FRL/termdiff.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/termdiff.term)**
```
list(
  cons(id,
  cons(subterms([
    id,
    id,
    id,
    list(
      cons(id,
      add((value,lastName,atom,one),
      cons(id,
      cons(id,
      nil)))))]),
  cons(id,
  nil)))).
```

## Languages
* [TDL](../languages/TDL.md) (tdl(term))

## References
* elementOf('languages/FRL/termdiff.term',tdl(term))
* mapsTo(diff,['languages/FRL/mm.term','languages/FRL/FRL2/mm.term'],['languages/FRL/termdiff.term'])
* mapsTo(invDiff,['languages/FRL/termdiff.term'],['languages/FRL/terminvdiff.term'])
* mapsTo(applyDiff,['languages/FRL/termdiff.term','languages/FRL/mm.term'],['languages/FRL/FRL2/mm.term'])
