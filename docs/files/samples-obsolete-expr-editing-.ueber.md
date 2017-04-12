# File _samples/obsolete/expr/editing/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/editing/.ueber)**
```
[
  % Exercise "new object"
  elementOf('new-expr.config', term),
  elementOf('new-expr.graph', exprRelaxed(graph(term))),
  mapsTo(applyIO, ['new-expr.config', '../exprRelaxed/mm.graph'], ['new-expr.graph']),

  % Exercise "list concrete classes for a member"
  elementOf('classes.config', term),
  elementOf('classes.term', term),
  mapsTo(applyIO, ['classes.config', '../exprRelaxed/mm.graph'], ['classes.term'])

].
```
