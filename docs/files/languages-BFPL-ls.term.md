# File _languages/BFPL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/ls.term)**
```
[ ([],name,[n(lower),star([n(alpha)])]), ([],integer,[plus([n(digit)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(--),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(bfpl(text),eglAcceptor(bfplAbstract: (~>)),['languages/BFPL/cs.term','languages/BFPL/ls.term'])
* function(parse,[bfpl(text)],[bfpl(term)],eglParser(bfplAbstract: (~>)),['languages/BFPL/cs.term','languages/BFPL/ls.term'])
* elementOf('languages/BFPL/ls.term',egl(term))
* mapsTo(parse,['languages/BFPL/ls.egl'],['languages/BFPL/ls.term'])
