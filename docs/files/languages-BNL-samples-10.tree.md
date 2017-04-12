# File _languages/BNL/samples/10.tree_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/samples/10.tree)**
```
fork(
  (number,number,[n(bits),n(rest)]), % rule
  [ % list of branches
    fork( % 1st branch
      (many,bits,[n(bit),n(bits)]), % rule
      [ % list of branches
        fork( % 1st branch
...
```

## Languages

## References
* elementOf('languages/BNL/samples/10.tree',bnl(bcl(term)))
* mapsTo(unparse,['languages/BNL/samples/10.tree'],['languages/BNL/samples/10.tokens'])
* mapsTo(unparse,['languages/BNL/samples/10.tree'],['languages/BNL/samples/10.bnl'])
* mapsTo(cstToAst,['languages/BNL/samples/10.tree'],['languages/BNL/samples/10.term'])
* mapsTo(astToCst,['languages/BNL/samples/10.term'],['languages/BNL/samples/10.tree'])
