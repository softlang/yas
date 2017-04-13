# File _languages/EL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/ls.term)**
```
[ ([],identifier,[plus([n(lower)])]), ([],integer,[plus([n(digit)])]), ([],layout,[plus([n(space)])])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(el(text),eglAcceptor(elAbstract: (~>)),['languages/EL/cs.term','languages/EL/ls.term'])
* function(parse,[el(text)],[el(term)],eglParser(elAbstract: (~>)),['languages/EL/cs.term','languages/EL/ls.term'])
* elementOf('languages/EL/ls.term',egl(term))
* mapsTo(parse,['languages/EL/ls.egl'],['languages/EL/ls.term'])
