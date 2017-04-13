# File _languages/LAL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/ls.term)**
```
[ ([],name,[n(csymf),star([n(csym)])]), ([],url,[n(quote),plus([not([n(quote)])]),n(quote)]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(lal(text),eglAcceptor(lalAbstract: (~>)),['languages/LAL/cs.term','languages/LAL/ls.term'])
* function(parse,[lal(text)],[lal(term)],eglParser(lalAbstract: (~>)),['languages/LAL/cs.term','languages/LAL/ls.term'])
* elementOf('languages/LAL/ls.term',egl(term))
* mapsTo(parse,['languages/LAL/ls.egl'],['languages/LAL/ls.term'])
