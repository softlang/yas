# File _languages/LAL/lib/traceability.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/traceability.term)**
```
[reuse([referencing],[ ('L','L1'), ('RefL','RefL1')]),reuse([referencing],[ ('L','L2'), ('RefL','RefL2')]),relation(ref,[ref('RefL1'),ref('RefL2'),ref('L1'),ref('L2')]),axiom([],forall(bindv(r1),ref('RefL1'),forall(bindv(r2),ref('RefL2'),forall(bindv(a1),ref('L1'),forall(bindv(a2),ref('L2'),iff(exists(bindv(b1),ref('L1'),exists(bindv(b2),ref('L2'),and(eq(funapp(deref,[var(r1),var(a1)]),var(b1)),eq(funapp(deref,[var(r2),var(a2)]),var(b2))))),relapp(ref,[var(r1),var(r2),var(a1),var(a2)])))))))].
```

## Languages
* [LAL](../languages/LAL.md) (lal(term))

## References
* elementOf('languages/LAL/lib/traceability.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/traceability.lal'],['languages/LAL/lib/traceability.term'])
* mapsTo(deps,['languages/LAL/lib/traceability.term'],['languages/LAL/lib/traceability.deps'])
* mapsTo(transform,['languages/LAL/lib/traceability.term'],['languages/LAL/lib/traceability.term2'])
