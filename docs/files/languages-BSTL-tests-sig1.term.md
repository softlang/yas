# File _languages/BSTL/tests/sig1.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSTL/tests/sig1.term)**
```
[ (leaf, [nat], tree),
  (fork, [tree, tree], tree),
  (zero, [], nat),
  (succ, [nat], nat) ].
```

## Languages
* [BSL](../languages/BSL.md)

## References
* elementOf('languages/BSTL/tests/sig1.term',bsl(term))
* mapsTo(parse,['languages/BSTL/tests/sig1.bsl'],['languages/BSTL/tests/sig1.term'])
* mapsTo(conformsTo,['languages/BSTL/tests/term1.term','languages/BSTL/tests/sig1.term'],[])
* mapsTo(interpret,['languages/BSTL/tests/trafo1.term','languages/BSTL/tests/sig1.term'],['languages/BSTL/tests/sig2.term'])
