# File _languages/BIPL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/cs.term)**
```
[ ([skip],stmt,[t(;)]), ([assign],stmt,[n(name),t(=),n(expr),t(;)]), ([block],stmt,[t('{'),star([n(stmt)]),t('}')]), ([if],stmt,[t(if),t('('),n(expr),t(')'),n(stmt),option([t(else),n(stmt)])]), ([while],stmt,[t(while),t('('),n(expr),t(')'),n(stmt)]), ([or],expr,[n(bexpr),option([t('||'),n(expr)])]), ([and],bexpr,[n(cexpr),option([t(&&),n(bexpr)])]), ([lt],cexpr,[n(aexpr),option([t(<),n(aexpr)])]), ([leq],cexpr,[n(aexpr),option([t(<=),n(aexpr)])]), ([eq],cexpr,[n(aexpr),option([t(==),n(aexpr)])]), ([geq],cexpr,[n(aexpr),option([t(>=),n(aexpr)])]), ([gt],cexpr,[n(aexpr),option([t(>),n(aexpr)])]), ([add],aexpr,[n(term),option([t(+),n(aexpr)])]), ([sub],aexpr,[n(term),option([t(-),n(aexpr)])]), ([mul],term,[n(factor),option([t(*),n(term)])]), ([negate],factor,[t(-),n(factor)]), ([not],factor,[t(!),n(factor)]), ([intconst],factor,[n(integer)]), ([var],factor,[n(name)]), ([brackets],factor,[t('('),n(expr),t(')')])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(bipl(text),eglAcceptor(biplAbstract: (~>)),['languages/BIPL/cs.term','languages/BIPL/ls.term'])
* function(parse,[bipl(text)],[bipl(term)],eglParser(biplAbstract: (~>)),['languages/BIPL/cs.term','languages/BIPL/ls.term'])
* elementOf('languages/BIPL/cs.term',egl(term))
* mapsTo(parse,['languages/BIPL/cs.egl'],['languages/BIPL/cs.term'])
