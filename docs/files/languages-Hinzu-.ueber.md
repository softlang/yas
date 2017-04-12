# File _languages/Hinzu/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Hinzu/.ueber)**
```
[
  % Abstract syntax of Hinzu
  macro(eslSyntax(hinzu)),

  % Dump Hinzu metadata
  function(dump, [], [hinzu(term)], hinzuDump:main, []),
  elementOf('dump.hinzu', hinzu(term)),
...
```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/Hinzu/.ueber',ueber(term))
