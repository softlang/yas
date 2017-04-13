# File _languages/GBL/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/.ueber)**
```
[
  macro(mmlSyntax(gbl)),
  function(mapping, [tbl(graph(term))], [gbl(graph(term))], tblToGbl:(=>), []),
  notElementOf('mm.term',tree(mml(term))),

  % Count metrics
  elementOf('mm.count', term),
  mapsTo(count, ['mm.term'], ['mm.count']),

  % MMTL demo
  elementOf('tblToGbl.term', mmtl(term)),
  mapsTo(mmTransform, ['tblToGbl.term', '../TBL/mm.term'], ['mm.term'])
  
].
```

## Languages
* [Ueber](../languages/Ueber.md) (ueber(term))

## References
* elementOf('languages/GBL/.ueber',ueber(term))
