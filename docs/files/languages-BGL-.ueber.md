# File _languages/BGL/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/.ueber)**
```
[
  language(bgl(text)),
  membership(bgl(text), elementOfBgl, []),
  function(parse, [bgl(text)], [bgl(term)], parserOfBgl, []),
  function(project, [bgl(term)], [bsl(term)], bglToBsl:(~>), []),
  function(acceptBottomUp, [bgl(term), term], [], bglAcceptBottomUp:accept, []),
  function(acceptTopDown, [bgl(term), term], [], bglAcceptTopDown:accept, []),
  function(parseTopDown, [bgl(term), term], [term], bglParseTopDown:parse, []),

  % Redundant BGL syntax -- BGL is already processed as EGL subset
  macro(eglSyntax(bgl)),
  macro(eslSyntax(bgl))
].

```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/BGL/.ueber',ueber(term))
