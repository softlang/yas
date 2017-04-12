# File _languages/FSML/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/ls.term)**
```
[ ([],name,[plus([n(alpha)])]), ([],layout,[plus([n(space)])])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(fsml(text),eglAcceptor(fsmlAbstract: (~>)),['languages/FSML/cs.term','languages/FSML/ls.term'])
* function(parse,[fsml(text)],[fsml(term)],eglParser(fsmlAbstract: (~>)),['languages/FSML/cs.term','languages/FSML/ls.term'])
* elementOf('languages/FSML/ls.term',egl(term))
* mapsTo(parse,['languages/FSML/ls.egl'],['languages/FSML/ls.term'])
