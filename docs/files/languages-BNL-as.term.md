# File _languages/BNL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/as.term)**
```
[
  (number,[bits,rest],number),
  (single,[bit],bits),
  (many,[bit,bits],bits),
  (zero,[],bit),
  (one,[],bit),
  (integer,[],rest),
  (rational,[bits],rest)
].
```

## Languages
* [BSL](../languages/BSL.md) (bsl(term))

## References
* elementOf('languages/BNL/as.term',bsl(term))
* mapsTo(parse,['languages/BNL/as.bsl'],['languages/BNL/as.term'])
* mapsTo(project,['languages/BNL/cs.term'],['languages/BNL/as.term'])
* membership(bnl(term),bslTerm,['languages/BNL/as.term'])
* mapsTo(conformsTo,['languages/BNL/samples/5comma25.term','languages/BNL/as.term'],[])
