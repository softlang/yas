# File _languages/BNL/samples/5comma25.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/samples/5comma25.term)**
```
number(
  many(one, many(zero, single(one))),
  rational(many(zero, single(one))) ).
```

## Languages
* [BNL](../languages/BNL.md) (bnl(term))

## References
* elementOf('languages/BNL/samples/5comma25.term',bnl(term))
* mapsTo(parse,['languages/BNL/samples/5comma25.tokens'],['languages/BNL/samples/5comma25.term'])
* mapsTo(parse,['languages/BNL/samples/5comma25.bnl'],['languages/BNL/samples/5comma25.term'])
* mapsTo(cstToAst,['languages/BNL/samples/5comma25.tree'],['languages/BNL/samples/5comma25.term'])
* mapsTo(astToCst,['languages/BNL/samples/5comma25.term'],['languages/BNL/samples/5comma25.tree'])
* mapsTo(evaluate,['languages/BNL/samples/5comma25.term'],['languages/BNL/samples/5comma25.value'])
* mapsTo(convert,['languages/BNL/samples/5comma25.term'],['languages/BNL/samples/5comma25.formula'])
* mapsTo(conformsTo,['languages/BNL/samples/5comma25.term','languages/BNL/as.term'],[])
