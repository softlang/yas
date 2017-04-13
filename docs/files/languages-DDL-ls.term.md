# File _languages/DDL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DDL/ls.term)**
```
[ ([],name,[n(lower),star([n(csym)])]), ([],integer,[plus([n(digit)])]), ([],layout,[plus([n(space)])])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(ddl(text),eglAcceptor(ddlAbstract: (~>)),['languages/DDL/cs.term','languages/DDL/ls.term'])
* function(parse,[ddl(text)],[ddl(term)],eglParser(ddlAbstract: (~>)),['languages/DDL/cs.term','languages/DDL/ls.term'])
* elementOf('languages/DDL/ls.term',egl(term))
* mapsTo(parse,['languages/DDL/ls.egl'],['languages/DDL/ls.term'])
