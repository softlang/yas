# File _languages/EL/Prolog/qq/ls.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/ls.term)**
```
[ ([],metavar,[t($),n(upper),star([n(csym)])]), ([],identifier,[plus([n(lower)])]), ([],integer,[plus([n(digit)])]), ([],layout,[plus([n(space)])]), ([],metavar,[t($),n(upper),star([n(csym)])]), ([],metavar,[t($),t('_'),star([n(csym)])])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(elqq(text),eglAcceptor(elqqAbstract: (~>)),['languages/EL/Prolog/qq/cs.term','languages/EL/Prolog/qq/ls.term'])
* function(parse,[elqq(text)],[elqq(term)],eglParser(elqqAbstract: (~>)),['languages/EL/Prolog/qq/cs.term','languages/EL/Prolog/qq/ls.term'])
* elementOf('languages/EL/Prolog/qq/ls.term',egl(term))
* mapsTo(parse,['languages/EL/Prolog/qq/ls.egl'],['languages/EL/Prolog/qq/ls.term'])
