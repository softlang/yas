# File _languages/LAL/lib/cx/mapping.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/mapping.term)**
```
[reuse([coupling],[]),function(mapping,[ref('L1')],total,ref('L2')),axiom([],forall(bindv(a),ref('L1'),forall(bindv(b),ref('L2'),ifthen(eq(funapp(mapping,[var(a)]),var(b)),relapp(consistent,[var(a),var(b)])))))].
```

## Languages
* [LAL](../languages/LAL.md) (lal(term))

## References
* elementOf('languages/LAL/lib/cx/mapping.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/cx/mapping.lal'],['languages/LAL/lib/cx/mapping.term'])
* mapsTo(deps,['languages/LAL/lib/cx/mapping.term'],['languages/LAL/lib/cx/mapping.deps'])
* mapsTo(transform,['languages/LAL/lib/cx/mapping.term'],['languages/LAL/lib/cx/mapping.term2'])
