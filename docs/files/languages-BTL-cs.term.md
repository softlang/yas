# File _languages/BTL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/cs.term)**
```
[ (true,expr,[t(true)]), (false,expr,[t(false)]), (zero,expr,[t(zero)]), (succ,expr,[t(succ),n(expr)]), (pred,expr,[t(pred),n(expr)]), (iszero,expr,[t(iszero),n(expr)]), (if,expr,[t(if),n(expr),t(then),n(expr),t(else),n(expr)])].
```

## Languages
* [BGL](../languages/BGL.md) (bgl(term))

## References
* elementOf('languages/BTL/cs.term',bgl(term))
* mapsTo(parse,['languages/BTL/cs.bgl'],['languages/BTL/cs.term'])
* mapsTo(project,['languages/BTL/cs.term'],['languages/BTL/as.term'])
* membership(btl(text),bglAcceptor(btlScanner),['languages/BTL/cs.term'])
* membership(btl(tokens(term)),bglAcceptor,['languages/BTL/cs.term'])
* membership(btl(bcl(term)),bclOk:main,['languages/BTL/cs.term'])
* function(parse,[btl(tokens(term))],[btl(term)],bglParser,['languages/BTL/cs.term'])
* function(parse,[btl(text)],[btl(term)],bglParser(btlScanner),['languages/BTL/cs.term'])
* function(astToCst,[btl(term)],[btl(bcl(term))],astToCst,['languages/BTL/cs.term'])
