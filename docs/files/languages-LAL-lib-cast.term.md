# File _languages/LAL/lib/cast.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cast.term)**
```
[reuse([language],[]),function(cast,[ref('Any')],partial,ref('L')),axiom([castOk],forall(bindv(e),ref('L'),eq(funapp(cast,[var(e)]),var(e)))),axiom([castFail],forall(bindv(e1),ref('Any'),ifthen(not(element(var(e1),ref('L'))),not(exists(bindv(e2),ref('L'),eq(funapp(cast,[var(e1)]),var(e2)))))))].
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/cast.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/cast.lal'],['languages/LAL/lib/cast.term'])
* mapsTo(deps,['languages/LAL/lib/cast.term'],['languages/LAL/lib/cast.deps'])
* mapsTo(transform,['languages/LAL/lib/cast.term'],['languages/LAL/lib/cast.term2'])
