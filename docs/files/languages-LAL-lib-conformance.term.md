# File _languages/LAL/lib/conformance.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance.term)**
```
[reuse([language],[]),reuse([language],[ ('L','DefL'), ('Any','DefAny')]),constant(defL,ref('DefL')),relation(conformsTo,[ref('Any'),ref('DefL')]),axiom([],forall(bindv(x),ref('Any'),iff(element(var(x),ref('L')),relapp(conformsTo,[var(x),var(defL)]))))].
```

## Languages
* [LAL](../languages/LAL.md) (lal(term))

## References
* elementOf('languages/LAL/lib/conformance.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/conformance.lal'],['languages/LAL/lib/conformance.term'])
* mapsTo(deps,['languages/LAL/lib/conformance.term'],['languages/LAL/lib/conformance.deps'])
* mapsTo(transform,['languages/LAL/lib/conformance.term'],['languages/LAL/lib/conformance.term2'])
