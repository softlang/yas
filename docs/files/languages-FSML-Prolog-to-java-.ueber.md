# File _languages/FSML/Prolog/to-java/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/to-java/.ueber)**
```
[
  macro(eslSyntax(java)),
  language(java(text)),
  membership(java(text), succeed, []),
  elementOf('sample.term', java(term)),
  elementOf('sample.java', java(text)),
  function(ppJavaDecl, [java(term)], [java(text)], ppJavaDecl, []),
  mapsTo(ppJavaDecl, ['sample.term'], ['sample.java'])
].

```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/FSML/Prolog/to-java/.ueber',ueber(term))
