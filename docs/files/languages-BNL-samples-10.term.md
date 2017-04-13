# File _languages/BNL/samples/10.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/samples/10.term)**
```
number(
  many(
    one,
    single(
      zero)),
  integer).
```

## Languages
* [BNL](../languages/BNL.md) (bnl(term))

## References
* elementOf('languages/BNL/samples/10.term',bnl(term))
* mapsTo(parse,['languages/BNL/samples/10.tokens'],['languages/BNL/samples/10.term'])
* mapsTo(parse,['languages/BNL/samples/10.bnl'],['languages/BNL/samples/10.term'])
* mapsTo(cstToAst,['languages/BNL/samples/10.tree'],['languages/BNL/samples/10.term'])
* mapsTo(astToCst,['languages/BNL/samples/10.term'],['languages/BNL/samples/10.tree'])
