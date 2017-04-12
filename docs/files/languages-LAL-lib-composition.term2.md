# File _languages/LAL/lib/composition.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/composition.term2)**
```
[sort('Any',[]),sort('L',['Any']),relation(partOf,[ref('L'),ref('L')]),relation(partOfPlus,[ref('L'),ref('L')]),relation(partOfStar,[ref('L'),ref('L')]),axiom([partAsym],forall(bindv(x),ref('L'),forall(bindv(y),ref('L'),ifthen(relapp(partOf,[var(x),var(y)]),not(relapp(partOf,[var(y),var(x)])))))),axiom([partReflexive],forall(bindv(x),ref('L'),relapp(partOfStar,[var(x),var(x)]))),axiom([partTransitive],forall(bindv(x),ref('L'),forall(bindv(y),ref('L'),and(ifthen(relapp(partOf,[var(x),var(y)]),relapp(partOfPlus,[var(x),var(y)])),and(ifthen(relapp(partOfPlus,[var(x),var(y)]),relapp(partOfStar,[var(x),var(y)])),forall(bindv(z),ref('L'),ifthen(and(relapp(partOfPlus,[var(x),var(z)]),relapp(partOfPlus,[var(z),var(y)])),relapp(partOfPlus,[var(x),var(y)]))))))))].
```

## Languages
* [LAL](../languages/LAL.md)
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/composition.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/composition.term'],['languages/LAL/lib/composition.term2'])
* mapsTo(pp,['languages/LAL/lib/composition.term2'],['languages/LAL/lib/composition.lal2'])
* mapsTo(parse,['languages/LAL/lib/composition.lal2'],['languages/LAL/lib/composition.term2'])
* elementOf('languages/LAL/lib/composition.term2',ok(lal(term)))
