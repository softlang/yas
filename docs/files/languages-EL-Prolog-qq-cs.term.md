# File _languages/EL/Prolog/qq/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/cs.term)**
```
[ ([or],expr,[n(bexpr),option([t('||'),n(expr)])]), ([and],bexpr,[n(cexpr),option([t(&&),n(bexpr)])]), ([lt],cexpr,[n(aexpr),option([t(<),n(aexpr)])]), ([leq],cexpr,[n(aexpr),option([t(<=),n(aexpr)])]), ([eq],cexpr,[n(aexpr),option([t(==),n(aexpr)])]), ([geq],cexpr,[n(aexpr),option([t(>=),n(aexpr)])]), ([gt],cexpr,[n(aexpr),option([t(>),n(aexpr)])]), ([add],aexpr,[n(term),option([t(+),n(aexpr)])]), ([sub],aexpr,[n(term),option([t(-),n(aexpr)])]), ([mul],term,[n(factor),option([t(*),n(term)])]), ([negate],factor,[t(-),n(factor)]), ([not],factor,[t(!),n(factor)]), ([intconst],factor,[n(integer)]), ([var],factor,[n(identifier)]), ([brackets],factor,[t('('),n(expr),t(')')]), ([metavar],factor,[n(metavar)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(elqq(text),eglAcceptor(elqqAbstract: (~>)),['languages/EL/Prolog/qq/cs.term','languages/EL/Prolog/qq/ls.term'])
* function(parse,[elqq(text)],[elqq(term)],eglParser(elqqAbstract: (~>)),['languages/EL/Prolog/qq/cs.term','languages/EL/Prolog/qq/ls.term'])
* elementOf('languages/EL/Prolog/qq/cs.term',egl(term))
* mapsTo(parse,['languages/EL/Prolog/qq/cs.egl'],['languages/EL/Prolog/qq/cs.term'])
