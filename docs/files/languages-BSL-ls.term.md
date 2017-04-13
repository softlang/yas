# File _languages/BSL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/ls.term)**
```
[ ([],qstring,[n(quote),plus([n(noQuote)]),n(quote)]), ([],name,[plus([n(alpha)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(bsl(text),eglAcceptor(bslAbstract: (~>)),['languages/BSL/cs.term','languages/BSL/ls.term'])
* function(parse,[bsl(text)],[bsl(term)],eglParser(bslAbstract: (~>)),['languages/BSL/cs.term','languages/BSL/ls.term'])
* elementOf('languages/BSL/ls.term',egl(term))
* mapsTo(parse,['languages/BSL/ls.egl'],['languages/BSL/ls.term'])
