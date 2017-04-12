# File _languages/FSML/Python/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/.ueber)**
```
[
    membership(fsml(text), python('FsmlAcceptor'), ['.']),
    language(ok(fsml(json))),
    membership(ok(fsml(json)), python('FsmlChecker'), ['.']),
    function(parse, [fsml(text)],[json], python('FsmlToJSON'), ['.']),
    function(visualize, [ok(fsml(json))], [dot(text)], python('FsmlToDot'), ['.']),
    elementOf('sample.json', ok(fsml(json))),
    mapsTo(parse, ['../sample.fsml'], ['sample.json']),
    mapsTo(visualize, ['sample.json'], ['dot/sample.dot'])
].
```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/FSML/Python/.ueber',ueber(term))
