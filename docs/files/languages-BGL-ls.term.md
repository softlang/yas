# File _languages/BGL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/ls.term)**
```
[ ([],qstring,[n(quote),plus([not([n(quote)])]),n(quote)]), ([],name,[plus([n(alpha)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(bgl(text),eglAcceptor(bglAbstract: (~>)),['languages/BGL/cs.term','languages/BGL/ls.term'])
* function(parse,[bgl(text)],[bgl(term)],eglParser(bglAbstract: (~>)),['languages/BGL/cs.term','languages/BGL/ls.term'])
* elementOf('languages/BGL/ls.term',egl(term))
* mapsTo(parse,['languages/BGL/ls.egl'],['languages/BGL/ls.term'])
