# File _languages/ESL/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ESL/ls.term)**
```
[ ([],name,[plus([n(csymf)])]), ([],layout,[plus([n(space)])]), ([],layout,[t(//),star([not([n(end_of_line)])]),n(end_of_line)])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(esl(text),eglAcceptor(eslAbstract: (~>)),['languages/ESL/cs.term','languages/ESL/ls.term'])
* function(parse,[esl(text)],[esl(term)],eglParser(eslAbstract: (~>)),['languages/ESL/cs.term','languages/ESL/ls.term'])
* elementOf('languages/ESL/ls.term',egl(term))
* mapsTo(parse,['languages/ESL/ls.egl'],['languages/ESL/ls.term'])
