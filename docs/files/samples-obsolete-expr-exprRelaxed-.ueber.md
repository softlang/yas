# File _samples/obsolete/expr/exprRelaxed/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/exprRelaxed/.ueber)**
```
[

  macro(mmlSyntax(exprRelaxed)),
  macro(graphSample(exprRelaxed)),
  mapsTo(relax, ['../mm.graph'], ['mm.graph']),
  mapsTo(recardinalize, ['mm.graph', '../mm.graph', 'sample.graph'], ['../sample.graph']),
  mapsTo(recardinalize, ['../mm.graph', 'mm.graph', '../sample.graph'], ['sample.graph'])

].
```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('samples/obsolete/expr/exprRelaxed/.ueber',ueber(term))
