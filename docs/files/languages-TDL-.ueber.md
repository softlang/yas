# File _languages/TDL/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TDL/.ueber)**
```
[
  macro(eslSyntax(tdl)),
  function(diff, [term, term], [tdl(term)], tdlDiff:diff, []),
  function(applyDiff, [tdl(term), term], [term], tdlApply:apply, []),
  function(invDiff, [tdl(term)], [tdl(term)], tdlInv:inv, [])
].
```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/TDL/.ueber',ueber(term))
