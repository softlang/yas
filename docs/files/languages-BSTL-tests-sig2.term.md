# File _languages/BSTL/tests/sig2.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSTL/tests/sig2.term)**
```
[ (leaf,[nat],bintree), (fork,[bintree,bintree],bintree), (z,[],nat), (s,[nat],nat)].
```

## Languages
* [BSL](../languages/BSL.md)

## References
* elementOf('languages/BSTL/tests/sig2.term',bsl(term))
* mapsTo(parse,['languages/BSTL/tests/sig2.bsl'],['languages/BSTL/tests/sig2.term'])
* mapsTo(interpret,['languages/BSTL/tests/trafo1.term','languages/BSTL/tests/sig1.term'],['languages/BSTL/tests/sig2.term'])
* mapsTo(conformsTo,['languages/BSTL/tests/term2.term','languages/BSTL/tests/sig2.term'],[])
