# File _languages/LAL/lib/differencing.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/differencing.term2)**
```
[sort('Any',[]),sort('L',['Any']),sort('DiffAny',[]),sort('DiffL',['DiffAny']),function(diff,[ref('L'),ref('L')],total,ref('DiffL')),function(applyDiff,[ref('DiffL'),ref('L')],total,ref('L')),function(invDiff,[ref('DiffL')],total,ref('DiffL')),constant(emptyDiff,ref('DiffL')),axiom([apply],forall(bindv(x),ref('L'),forall(bindv(y),ref('L'),forall(bindv(d),ref('DiffL'),eq(funapp(applyDiff,[funapp(diff,[var(x),var(y)]),var(x)]),var(y)))))),axiom([inv],forall(bindv(x),ref('L'),forall(bindv(y),ref('L'),eq(funapp(invDiff,[funapp(diff,[var(x),var(y)])]),funapp(diff,[var(y),var(x)]))))),axiom([diffEmpty],forall(bindv(x),ref('L'),eq(funapp(diff,[var(x),var(x)]),var(emptyDiff)))),axiom([empty],forall(bindv(x),ref('L'),eq(funapp(applyDiff,[var(emptyDiff),var(x)]),var(x)))),axiom([invEmpty],eq(funapp(invDiff,[var(emptyDiff)]),var(emptyDiff))),axiom([invTwice],forall(bindv(d),ref('DiffL'),eq(funapp(invDiff,[funapp(invDiff,[var(d)])]),var(d))))].
```

## Languages
* [LAL](../languages/LAL.md)
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/differencing.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/differencing.term'],['languages/LAL/lib/differencing.term2'])
* mapsTo(pp,['languages/LAL/lib/differencing.term2'],['languages/LAL/lib/differencing.lal2'])
* mapsTo(parse,['languages/LAL/lib/differencing.lal2'],['languages/LAL/lib/differencing.term2'])
* elementOf('languages/LAL/lib/differencing.term2',ok(lal(term)))
