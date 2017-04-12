# File _languages/LAL/lib/cx/invariant.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/invariant.term)**
```
[reuse([coupling],[]),reuse([interpretation],[ ('L2','L1'), ('Any2','Any1')]),axiom([],forall(bindv(t),ref('XL'),forall(bindv(a),ref('L1'),forall(bindv(c),ref('L1'),forall(bindv(b),ref('L2'),ifthen(and(relapp(consistent,[var(a),var(b)]),eq(funapp(interpret,[var(t),var(a)]),var(c))),relapp(consistent,[var(c),var(b)])))))))].
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/cx/invariant.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/cx/invariant.lal'],['languages/LAL/lib/cx/invariant.term'])
* mapsTo(deps,['languages/LAL/lib/cx/invariant.term'],['languages/LAL/lib/cx/invariant.deps'])
* mapsTo(transform,['languages/LAL/lib/cx/invariant.term'],['languages/LAL/lib/cx/invariant.term2'])
