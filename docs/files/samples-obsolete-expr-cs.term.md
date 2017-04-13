# File _samples/obsolete/expr/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/cs.term)**
```
[ 
  (const, expr, [n(nat)]),
  (add, expr, [n(expr), t(+), n(expr)]),
  (zero, nat, [t(zero)]),
  (succ, nat, [t(succ), t('('), n(nat), t(')')])
].
```

## Languages
* [BGL](../languages/BGL.md) (bgl(term))

## References
* elementOf('samples/obsolete/expr/cs.term',bgl(term))
* mapsTo(parse,['samples/obsolete/expr/cs.bgl'],['samples/obsolete/expr/cs.term'])
* mapsTo(project,['samples/obsolete/expr/cs.term'],['samples/obsolete/expr/as.term'])
* membership(expr(text),bglAcceptor(exprScanner),['samples/obsolete/expr/cs.term'])
* membership(expr(tokens(term)),bglAcceptor,['samples/obsolete/expr/cs.term'])
* membership(expr(bcl(term)),bclOk:main,['samples/obsolete/expr/cs.term'])
* function(parse,[expr(tokens(term))],[expr(term)],bglParser,['samples/obsolete/expr/cs.term'])
* function(parse,[expr(text)],[expr(term)],bglParser(exprScanner),['samples/obsolete/expr/cs.term'])
* function(astToCst,[expr(term)],[expr(bcl(term))],astToCst,['samples/obsolete/expr/cs.term'])
* mapsTo(acceptBottomUp,['samples/obsolete/expr/cs.term','samples/obsolete/expr/sample.tokens'],[])
* mapsTo(acceptTopDown,['samples/obsolete/expr/cs.term','samples/obsolete/expr/sample.tokens'],[])
* mapsTo(parseTopDown,['samples/obsolete/expr/cs.term','samples/obsolete/expr/sample.tokens'],['samples/obsolete/expr/sample.tree'])
