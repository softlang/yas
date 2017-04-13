# File _languages/LAL/lib/application.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/application.term2)**
```
[sort('Any1',[]),sort('L1',['Any1']),sort('Any2',[]),sort('L2',['Any2']),sort('XAny',[]),sort('XL',['XAny']),function(interpretTyped,[ref('XL'),ref('L1')],partial,ref('L2')),function(interpretUntyped,[ref('XL'),ref('Any1')],partial,ref('Any2')),constant(trafo,ref('XL')),axiom([cast],forall(bindv(x),ref('L1'),forall(bindv(y),ref('L2'),iff(eq(funapp(interpretTyped,[var(trafo),var(x)]),var(y)),eq(funapp(interpretUntyped,[var(trafo),var(x)]),var(y)))))),axiom([welltyped],forall(bindv(x),ref('L1'),forall(bindv(y),ref('Any2'),ifthen(eq(funapp(interpretUntyped,[var(trafo),var(x)]),var(y)),element(var(y),ref('L2'))))))].
```

## Languages
* [LAL](../languages/LAL.md) (lal(term))
* [LAL](../languages/LAL.md) (ok(lal(term)))

## References
* elementOf('languages/LAL/lib/application.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/application.term'],['languages/LAL/lib/application.term2'])
* mapsTo(pp,['languages/LAL/lib/application.term2'],['languages/LAL/lib/application.lal2'])
* mapsTo(parse,['languages/LAL/lib/application.lal2'],['languages/LAL/lib/application.term2'])
* elementOf('languages/LAL/lib/application.term2',ok(lal(term)))
