# File _languages/LAL/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/.ueber)**
```
[
  macro(eglSyntax(lal)),
  macro(eslSyntax(lal)),
  language(ok(lal(term))),
  membership(ok(lal(term)), lalOk:model, []),
  equivalence(lal(text), lalTextEq:eq, ['cs.term', 'ls.term']),
  equivalence(lal(term), lalTermEq:eq, []),
  normalization(lal(term), lalNorm:(=>), []),
  function(deps, [lal(term)], [deps(term)], lalDeps:deps, []),
  function(transform, [lal(term)], [lal(term)], lalReuse:inline, []),
  function(pp, [lal(term)], [lal(text)], lalPp:pp,[]),
  function(translate, [lal(term), lal(config(term))], [ueber(term)], lalUeber:translate, [])
].
```

## Languages
* [Ueber](../languages/Ueber.md) (ueber(term))

## References
* elementOf('languages/LAL/.ueber',ueber(term))
