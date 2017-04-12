# File _languages/EGTL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/ls.term)**
```
[ ([],qstring,[n(quote),plus([not([n(quote)])]),n(quote)]), ([],name,[plus([n(csymf)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(egtl(text),eglAcceptor(egtlAbstract: (~>)),['languages/EGTL/cs.term','languages/EGTL/ls.term'])
* function(parse,[egtl(text)],[egtl(term)],eglParser(egtlAbstract: (~>)),['languages/EGTL/cs.term','languages/EGTL/ls.term'])
* elementOf('languages/EGTL/ls.term',egl(term))
* mapsTo(parse,['languages/EGTL/ls.egl'],['languages/EGTL/ls.term'])
