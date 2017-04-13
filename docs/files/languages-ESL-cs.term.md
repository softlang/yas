# File _languages/ESL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ESL/cs.term)**
```
[ ([],signature,[star([n(decl),t(;)])]), ([type],decl,[t(type),n(name),t(=),n(typeexprs)]), ([symbol],decl,[t(symbol),n(name),t(:),option([n(typeexprs)]),t(->),n(name)]), ([],typeexprs,[n(typeexpr),star([t(#),n(typeexpr)])]), ([],typeexpr,[n(factor),n(cardinality)]), ([boolean],factor,[t(boolean)]), ([integer],factor,[t(integer)]), ([float],factor,[t(float)]), ([string],factor,[t(string)]), ([term],factor,[t(term)]), ([tuple],factor,[t('('),n(typeexpr),plus([t(#),n(typeexpr)]),t(')')]), ([sort],factor,[n(name)]), ([star],cardinality,[t(*),n(cardinality)]), ([plus],cardinality,[t(+),n(cardinality)]), ([option],cardinality,[t(?),n(cardinality)]), ([none],cardinality,[])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(esl(text),eglAcceptor(eslAbstract: (~>)),['languages/ESL/cs.term','languages/ESL/ls.term'])
* function(parse,[esl(text)],[esl(term)],eglParser(eslAbstract: (~>)),['languages/ESL/cs.term','languages/ESL/ls.term'])
* elementOf('languages/ESL/cs.term',egl(term))
* mapsTo(parse,['languages/ESL/cs.egl'],['languages/ESL/cs.term'])
