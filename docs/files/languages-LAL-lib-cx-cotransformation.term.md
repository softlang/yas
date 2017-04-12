# File _languages/LAL/lib/cx/cotransformation.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/cotransformation.term)**
```
[reuse([coupling],[]),reuse([interpretation],[ ('L2','L1'), ('Any2','Any1')]),reuse([interpretation],[ ('L1','L2'), ('Any1','Any2')]),axiom([consistency],forall(bindv(t),ref('XL'),forall(bindv(a),ref('L1'),forall(bindv(c),ref('L1'),forall(bindv(b),ref('L2'),forall(bindv(d),ref('L2'),ifthen(and(relapp(consistent,[var(a),var(b)]),and(eq(funapp(interpret,[var(t),var(a)]),var(c)),eq(funapp(interpret,[var(t),var(b)]),var(d)))),relapp(consistent,[var(c),var(d)]))))))))].
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/cx/cotransformation.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/cx/cotransformation.lal'],['languages/LAL/lib/cx/cotransformation.term'])
* mapsTo(deps,['languages/LAL/lib/cx/cotransformation.term'],['languages/LAL/lib/cx/cotransformation.deps'])
* mapsTo(transform,['languages/LAL/lib/cx/cotransformation.term'],['languages/LAL/lib/cx/cotransformation.term2'])
