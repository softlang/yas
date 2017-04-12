# File _samples/obsolete/expr/sample.tokens_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/sample.tokens)**
```
[zero, '+', succ, '(', zero, ')'].
```

## Languages

## References
* elementOf('samples/obsolete/expr/sample.tokens',expr(tokens(term)))
* mapsTo(scan,['samples/obsolete/expr/sample.expr'],['samples/obsolete/expr/sample.tokens'])
* mapsTo(parse,['samples/obsolete/expr/sample.tokens'],['samples/obsolete/expr/sample.term'])
* mapsTo(unparse,['samples/obsolete/expr/sample.tree'],['samples/obsolete/expr/sample.tokens'])
* mapsTo(acceptBottomUp,['samples/obsolete/expr/cs.term','samples/obsolete/expr/sample.tokens'],[])
* mapsTo(acceptTopDown,['samples/obsolete/expr/cs.term','samples/obsolete/expr/sample.tokens'],[])
* mapsTo(parseTopDown,['samples/obsolete/expr/cs.term','samples/obsolete/expr/sample.tokens'],['samples/obsolete/expr/sample.tree'])
