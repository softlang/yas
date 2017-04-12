# File _languages/LAL/lib/traceability/refs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/traceability/refs.term)**
```
[reuse([traceability],[]),relation(refs,[star(product([ref('RefL1'),ref('RefL2')])),ref('L1'),ref('L2')]),axiom([],forall(bindv(ls),star(product([ref('RefL1'),ref('RefL2')])),forall(bindv(a1),ref('L1'),forall(bindv(a2),ref('L2'),iff(foreach(bindt([bindv(r1),bindv(r2)]),var(ls),relapp(ref,[var(r1),var(r2),var(a1),var(a2)])),relapp(refs,[var(ls),var(a1),var(a2)]))))))].
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/traceability/refs.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/traceability/refs.lal'],['languages/LAL/lib/traceability/refs.term'])
* mapsTo(deps,['languages/LAL/lib/traceability/refs.term'],['languages/LAL/lib/traceability/refs.deps'])
* mapsTo(transform,['languages/LAL/lib/traceability/refs.term'],['languages/LAL/lib/traceability/refs.term2'])
