# File _languages/BIPL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/ls.term)**
```
[ ([],name,[plus([n(alpha)])]), ([],integer,[plus([n(digit)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(bipl(text),eglAcceptor(biplAbstract: (~>)),['languages/BIPL/cs.term','languages/BIPL/ls.term'])
* function(parse,[bipl(text)],[bipl(term)],eglParser(biplAbstract: (~>)),['languages/BIPL/cs.term','languages/BIPL/ls.term'])
* elementOf('languages/BIPL/ls.term',egl(term))
* mapsTo(parse,['languages/BIPL/ls.egl'],['languages/BIPL/ls.term'])
