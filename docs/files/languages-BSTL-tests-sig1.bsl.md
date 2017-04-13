# File _languages/BSTL/tests/sig1.bsl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSTL/tests/sig1.bsl)**
```
symbol leaf : nat -> tree ; // leaf in a tree
symbol fork : tree # tree -> tree ; // binary fork in a tree
symbol zero : -> nat ; // natural number 0
symbol succ : nat -> nat ; // successor of a natural number
```

## Languages
* [BSL](../languages/BSL.md) (bsl(text))

## References
* elementOf('languages/BSTL/tests/sig1.bsl',bsl(text))
* mapsTo(parse,['languages/BSTL/tests/sig1.bsl'],['languages/BSTL/tests/sig1.term'])
