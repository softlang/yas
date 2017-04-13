# File _languages/FRL/FRL2/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/FRL2/.ueber)**
```
[
    macro(mmlSyntax(frl2)),

    % Parse DDL-based representation
    macro(parseFile('dd.ddl')),

    % Apply the MML to DDL mapping 
    elementOf('mm.term', ddl(mml(term))),
    mapsTo(mmlToDdl, ['mm.term'], ['dd.term'])

].
```

## Languages
* [Ueber](../languages/Ueber.md) (ueber(term))

## References
* elementOf('languages/FRL/FRL2/.ueber',ueber(term))
