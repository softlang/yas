# File _languages/EFPL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/ls.term)**
```
[ ([],name,[n(lower),star([n(alpha)])]), ([],integer,[plus([n(digit)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(--),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(efpl(text),eglAcceptor(efplAbstract: (~>)),['languages/EFPL/cs.term','languages/EFPL/ls.term'])
* function(parse,[efpl(text)],[efpl(term)],eglParser(efplAbstract: (~>)),['languages/EFPL/cs.term','languages/EFPL/ls.term'])
* elementOf('languages/EFPL/ls.term',egl(term))
* mapsTo(parse,['languages/EFPL/ls.egl'],['languages/EFPL/ls.term'])
