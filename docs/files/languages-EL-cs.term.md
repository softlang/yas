# File _languages/EL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/cs.term)**
```
[ ([or],expr,[n(bexpr),option([t('||'),n(expr)])]), ([and],bexpr,[n(cexpr),option([t(&&),n(bexpr)])]), ([lt],cexpr,[n(aexpr),option([t(<),n(aexpr)])]), ([leq],cexpr,[n(aexpr),option([t(<=),n(aexpr)])]), ([eq],cexpr,[n(aexpr),option([t(==),n(aexpr)])]), ([geq],cexpr,[n(aexpr),option([t(>=),n(aexpr)])]), ([gt],cexpr,[n(aexpr),option([t(>),n(aexpr)])]), ([add],aexpr,[n(term),option([t(+),n(aexpr)])]), ([sub],aexpr,[n(term),option([t(-),n(aexpr)])]), ([mul],term,[n(factor),option([t(*),n(term)])]), ([negate],factor,[t(-),n(factor)]), ([not],factor,[t(!),n(factor)]), ([intconst],factor,[n(integer)]), ([boolconst],factor,[n(boolconst)]), ([var],factor,[n(identifier)]), ([brackets],factor,[t('('),n(expr),t(')')]), ([true],boolconst,[t(true)]), ([false],boolconst,[t(false)])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(el(text),eglAcceptor(elAbstract: (~>)),['languages/EL/cs.term','languages/EL/ls.term'])
* function(parse,[el(text)],[el(term)],eglParser(elAbstract: (~>)),['languages/EL/cs.term','languages/EL/ls.term'])
* elementOf('languages/EL/cs.term',egl(term))
* mapsTo(parse,['languages/EL/cs.egl'],['languages/EL/cs.term'])
