# File _languages/TBL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/cs.term)**
```
[ ([],world,[star([n(person)])]), ([],person,[n(name),option([t(->),n(name)])])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(tbl(text),eglAcceptor(tblAbstract: (~>)),['languages/TBL/cs.term','languages/TBL/ls.term'])
* function(parse,[tbl(text)],[tbl(term)],eglParser(tblAbstract: (~>)),['languages/TBL/cs.term','languages/TBL/ls.term'])
* elementOf('languages/TBL/cs.term',egl(term))
* mapsTo(parse,['languages/TBL/cs.egl'],['languages/TBL/cs.term'])
