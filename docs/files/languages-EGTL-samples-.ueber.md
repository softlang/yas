# File _languages/EGTL/samples/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/samples/.ueber)**
```
[
    macro(parseFile('bgl2egl.egtl')),
    elementOf('bgl2egl.term', extension(egtl(term))),
    mapsTo(interpret, ['bgl2egl.term', '../../BGL/cs.term'], ['../../EGL/cs.term'])
].
```

## Languages
* [Ueber](../languages/Ueber.md) (ueber(term))

## References
* elementOf('languages/EGTL/samples/.ueber',ueber(term))
