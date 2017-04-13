# File _languages/BSTL/tests/trafo1.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSTL/tests/trafo1.term)**
```
sequ( sequ(
	renameSym(zero, z),
	renameSym(succ, s)),
	renameSort(tree, bintree) ).
```

## Languages
* [BSTL](../languages/BSTL.md) (bstl(term))

## References
* elementOf('languages/BSTL/tests/trafo1.term',bstl(term))
* mapsTo(interpret,['languages/BSTL/tests/trafo1.term','languages/BSTL/tests/term1.term'],['languages/BSTL/tests/term2.term'])
* mapsTo(interpret,['languages/BSTL/tests/trafo1.term','languages/BSTL/tests/sig1.term'],['languages/BSTL/tests/sig2.term'])
