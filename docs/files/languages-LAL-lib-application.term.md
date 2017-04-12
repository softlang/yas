# File _languages/LAL/lib/application.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/application.term)**
```
[reuse([interpretation],[ (interpret,interpretTyped)]),function(interpretUntyped,[ref('XL'),ref('Any1')],partial,ref('Any2')),constant(trafo,ref('XL')),axiom([cast],forall(bindv(x),ref('L1'),forall(bindv(y),ref('L2'),iff(eq(funapp(interpretTyped,[var(trafo),var(x)]),var(y)),eq(funapp(interpretUntyped,[var(trafo),var(x)]),var(y)))))),axiom([welltyped],forall(bindv(x),ref('L1'),forall(bindv(y),ref('Any2'),ifthen(eq(funapp(interpretUntyped,[var(trafo),var(x)]),var(y)),element(var(y),ref('L2'))))))].
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/application.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/application.lal'],['languages/LAL/lib/application.term'])
* mapsTo(deps,['languages/LAL/lib/application.term'],['languages/LAL/lib/application.deps'])
* mapsTo(transform,['languages/LAL/lib/application.term'],['languages/LAL/lib/application.term2'])
