# File _languages/EIPL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/ls.term)**
```
[ ([],name,[plus([n(alpha)])]), ([],integer,[plus([n(digit)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(eipl(text),eglAcceptor(eiplAbstract: (~>)),['languages/EIPL/cs.term','languages/EIPL/ls.term'])
* function(parse,[eipl(text)],[eipl(term)],eglParser(eiplAbstract: (~>)),['languages/EIPL/cs.term','languages/EIPL/ls.term'])
* elementOf('languages/EIPL/ls.term',egl(term))
* mapsTo(parse,['languages/EIPL/ls.egl'],['languages/EIPL/ls.term'])
