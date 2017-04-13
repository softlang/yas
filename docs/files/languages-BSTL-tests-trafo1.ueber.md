# File _languages/BSTL/tests/trafo1.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSTL/tests/trafo1.ueber)**
```
[ elementOf('trafo1.term',bstl(term)),
  elementOf('term1.term',term),
  elementOf('term2.term',term),
  elementOf('sig1.term',bsl(term)),
  elementOf('sig2.term',bsl(term)),
  relatesTo(conformsTo,['term1.term','sig1.term']),
  mapsTo(interpret,['trafo1.term','term1.term'],['term2.term']),
  mapsTo(interpret,['trafo1.term','sig1.term'],['sig2.term']),
  relatesTo(conformsTo,['term2.term','sig2.term']) ].
```

## Languages
* [Ueber](../languages/Ueber.md) (ueber(term))

## References
* elementOf('languages/BSTL/tests/trafo1.ueber',ueber(term))
* mapsTo(translate,['languages/LAL/lib/cx/cotransformation.term2','languages/LAL/lib/cx/cotransformation.lalconfig'],['languages/BSTL/tests/trafo1.ueber'])
