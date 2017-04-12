# File _languages/BSTL/framework.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSTL/framework.ueber)**
```
[ language(bstl(term)),
  membership(bstl(term), eslLanguage, ['as.term']),
  function(interpret,
    [bstl(term), bsl(term)], [bsl(term)], bstlSig:interpret, []),
  function(interpret,
     [bstl(term), term], [term], bstlTerm:interpret, []) ].
```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/BSTL/framework.ueber',ueber(term))
