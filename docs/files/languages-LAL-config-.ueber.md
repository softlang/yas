# File _languages/LAL/config/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/config/.ueber)**
```
[
    language(lal(config(term))),
    elementOf('as.esl', esl(text)),
    elementOf('as.term', esl(term)),
    mapsTo(parse, ['as.esl'], ['as.term']),
    membership(lal(config(term)), eslLanguage, ['as.term'])
].
```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/LAL/config/.ueber',ueber(term))
