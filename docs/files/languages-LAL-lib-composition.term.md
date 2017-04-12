# File _languages/LAL/lib/composition.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/composition.term)**
```
[reuse([language],[]),relation(partOf,[ref('L'),ref('L')]),relation(partOfPlus,[ref('L'),ref('L')]),relation(partOfStar,[ref('L'),ref('L')]),axiom([partAsym],forall(bindv(x),ref('L'),forall(bindv(y),ref('L'),ifthen(relapp(partOf,[var(x),var(y)]),not(relapp(partOf,[var(y),var(x)])))))),axiom([partReflexive],forall(bindv(x),ref('L'),relapp(partOfStar,[var(x),var(x)]))),axiom([partTransitive],forall(bindv(x),ref('L'),forall(bindv(y),ref('L'),and(ifthen(relapp(partOf,[var(x),var(y)]),relapp(partOfPlus,[var(x),var(y)])),and(ifthen(relapp(partOfPlus,[var(x),var(y)]),relapp(partOfStar,[var(x),var(y)])),forall(bindv(z),ref('L'),ifthen(and(relapp(partOfPlus,[var(x),var(z)]),relapp(partOfPlus,[var(z),var(y)])),relapp(partOfPlus,[var(x),var(y)]))))))))].
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/composition.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/composition.lal'],['languages/LAL/lib/composition.term'])
* mapsTo(deps,['languages/LAL/lib/composition.term'],['languages/LAL/lib/composition.deps'])
* mapsTo(transform,['languages/LAL/lib/composition.term'],['languages/LAL/lib/composition.term2'])
