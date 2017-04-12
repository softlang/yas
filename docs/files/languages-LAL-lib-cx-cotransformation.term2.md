# File _languages/LAL/lib/cx/cotransformation.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/cotransformation.term2)**
```
[sort('Any1',[]),sort('L1',['Any1']),sort('Any2',[]),sort('L2',['Any2']),relation(consistent,[ref('L1'),ref('L2')]),sort('XAny',[]),sort('XL',['XAny']),function(interpret,[ref('XL'),ref('L1')],partial,ref('L1')),function(interpret,[ref('XL'),ref('L2')],partial,ref('L2')),axiom([consistency],forall(bindv(t),ref('XL'),forall(bindv(a),ref('L1'),forall(bindv(c),ref('L1'),forall(bindv(b),ref('L2'),forall(bindv(d),ref('L2'),ifthen(and(relapp(consistent,[var(a),var(b)]),and(eq(funapp(interpret,[var(t),var(a)]),var(c)),eq(funapp(interpret,[var(t),var(b)]),var(d)))),relapp(consistent,[var(c),var(d)]))))))))].
```

## Languages
* [LAL](../languages/LAL.md)
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/cx/cotransformation.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/cx/cotransformation.term'],['languages/LAL/lib/cx/cotransformation.term2'])
* mapsTo(pp,['languages/LAL/lib/cx/cotransformation.term2'],['languages/LAL/lib/cx/cotransformation.lal2'])
* mapsTo(parse,['languages/LAL/lib/cx/cotransformation.lal2'],['languages/LAL/lib/cx/cotransformation.term2'])
* elementOf('languages/LAL/lib/cx/cotransformation.term2',ok(lal(term)))
* mapsTo(translate,['languages/LAL/lib/cx/cotransformation.term2','languages/LAL/lib/cx/cotransformation.lalconfig'],['languages/BSTL/tests/trafo1.ueber'])
