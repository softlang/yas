# File _languages/MML/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/ls.term)**
```
[ ([],name,[plus([n(csymf)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(mml(text),eglAcceptor(mmlAbstract: (~>)),['languages/MML/cs.term','languages/MML/ls.term'])
* function(parse,[mml(text)],[mml(term)],eglParser(mmlAbstract: (~>)),['languages/MML/cs.term','languages/MML/ls.term'])
* elementOf('languages/MML/ls.term',egl(term))
* mapsTo(parse,['languages/MML/ls.egl'],['languages/MML/ls.term'])
