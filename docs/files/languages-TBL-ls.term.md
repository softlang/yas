# File _languages/TBL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/ls.term)**
```
[ ([],name,[plus([n(alpha)])]), ([],integer,[plus([n(digit)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(tbl(text),eglAcceptor(tblAbstract: (~>)),['languages/TBL/cs.term','languages/TBL/ls.term'])
* function(parse,[tbl(text)],[tbl(term)],eglParser(tblAbstract: (~>)),['languages/TBL/cs.term','languages/TBL/ls.term'])
* elementOf('languages/TBL/ls.term',egl(term))
* mapsTo(parse,['languages/TBL/ls.egl'],['languages/TBL/ls.term'])
