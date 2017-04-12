# File _languages/LAL/lib/cx/mapping.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/mapping.term2)**
```
[sort('Any1',[]),sort('L1',['Any1']),sort('Any2',[]),sort('L2',['Any2']),relation(consistent,[ref('L1'),ref('L2')]),function(mapping,[ref('L1')],total,ref('L2')),axiom([],forall(bindv(a),ref('L1'),forall(bindv(b),ref('L2'),ifthen(eq(funapp(mapping,[var(a)]),var(b)),relapp(consistent,[var(a),var(b)])))))].
```

## Languages
* [LAL](../languages/LAL.md)
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/cx/mapping.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/cx/mapping.term'],['languages/LAL/lib/cx/mapping.term2'])
* mapsTo(pp,['languages/LAL/lib/cx/mapping.term2'],['languages/LAL/lib/cx/mapping.lal2'])
* mapsTo(parse,['languages/LAL/lib/cx/mapping.lal2'],['languages/LAL/lib/cx/mapping.term2'])
* elementOf('languages/LAL/lib/cx/mapping.term2',ok(lal(term)))
