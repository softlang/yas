# File _samples/obsolete/expr/sample.term_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/sample.term)**
```
add(
  const(zero),
  const(succ(zero))
).
```

## Languages

## References
* elementOf('samples/obsolete/expr/sample.term',expr(term))
* mapsTo(parse,['samples/obsolete/expr/sample.tokens'],['samples/obsolete/expr/sample.term'])
* mapsTo(parse,['samples/obsolete/expr/sample.expr'],['samples/obsolete/expr/sample.term'])
* mapsTo(cstToAst,['samples/obsolete/expr/sample.tree'],['samples/obsolete/expr/sample.term'])
* mapsTo(astToCst,['samples/obsolete/expr/sample.term'],['samples/obsolete/expr/sample.tree'])
