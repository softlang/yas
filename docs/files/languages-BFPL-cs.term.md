# File _languages/BFPL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/cs.term)**
```
[ ([],program,[star([n(function)]),n(main)]), ([],function,[n(funsig),n(fundef)]), ([],funsig,[n(name),t(::),n(funtype)]), ([],fundef,[n(name),star([n(name)]),t(=),n(expr)]), ([],funtype,[n(simpletype),star([t(->),n(simpletype)])]), ([],main,[t(main),t(=),t(print),t($),n(expr)]), ([inttype],simpletype,[t('Int')]), ([booltype],simpletype,[t('Bool')]), ([unary],expr,[n(uop),n(subexpr)]), ([binary],expr,[t('('),n(bop),t(')'),n(subexpr),n(subexpr)]), ([subexpr],expr,[n(subexpr)]), ([apply],expr,[n(name),plus([n(subexpr)])]), ([intconst],subexpr,[n(integer)]), ([brackets],subexpr,[t('('),n(expr),t(')')]), ([if],subexpr,[t(if),n(expr),t(then),n(expr),t(else),n(expr)]), ([arg],subexpr,[n(name)]), ([negate],uop,[t(-)]), ([not],uop,[t(not)]), ([add],bop,[t(+)]), ([sub],bop,[t(-)]), ([mul],bop,[t(*)]), ([lt],bop,[t(<)]), ([le],bop,[t(<=)]), ([eq],bop,[t(==)]), ([geq],bop,[t(>=)]), ([gt],bop,[t(>)]), ([and],bop,[t(&&)]), ([or],bop,[t('||')])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(bfpl(text),eglAcceptor(bfplAbstract: (~>)),['languages/BFPL/cs.term','languages/BFPL/ls.term'])
* function(parse,[bfpl(text)],[bfpl(term)],eglParser(bfplAbstract: (~>)),['languages/BFPL/cs.term','languages/BFPL/ls.term'])
* elementOf('languages/BFPL/cs.term',egl(term))
* mapsTo(parse,['languages/BFPL/cs.egl'],['languages/BFPL/cs.term'])
