# File _languages/LAL/lib/cast.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cast.term2)**
```
[sort('Any',[]),sort('L',['Any']),function(cast,[ref('Any')],partial,ref('L')),axiom([castOk],forall(bindv(e),ref('L'),eq(funapp(cast,[var(e)]),var(e)))),axiom([castFail],forall(bindv(e1),ref('Any'),ifthen(not(element(var(e1),ref('L'))),not(exists(bindv(e2),ref('L'),eq(funapp(cast,[var(e1)]),var(e2)))))))].
```

## Languages
* [LAL](../languages/LAL.md) (lal(term))
* [LAL](../languages/LAL.md) (ok(lal(term)))

## References
* elementOf('languages/LAL/lib/cast.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/cast.term'],['languages/LAL/lib/cast.term2'])
* mapsTo(pp,['languages/LAL/lib/cast.term2'],['languages/LAL/lib/cast.lal2'])
* mapsTo(parse,['languages/LAL/lib/cast.lal2'],['languages/LAL/lib/cast.term2'])
* elementOf('languages/LAL/lib/cast.term2',ok(lal(term)))
