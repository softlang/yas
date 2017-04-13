# File _languages/LAL/lib/selection.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/selection.term2)**
```
[sort('Any',[]),sort('L',['Any']),sort('QAny',[]),sort('QL',['QAny']),relation(partOf,[ref('L'),ref('L')]),relation(partOfPlus,[ref('L'),ref('L')]),relation(partOfStar,[ref('L'),ref('L')]),axiom([partAsym],forall(bindv(x),ref('L'),forall(bindv(y),ref('L'),ifthen(relapp(partOf,[var(x),var(y)]),not(relapp(partOf,[var(y),var(x)])))))),axiom([partReflexive],forall(bindv(x),ref('L'),relapp(partOfStar,[var(x),var(x)]))),axiom([partTransitive],forall(bindv(x),ref('L'),forall(bindv(y),ref('L'),and(ifthen(relapp(partOf,[var(x),var(y)]),relapp(partOfPlus,[var(x),var(y)])),and(ifthen(relapp(partOfPlus,[var(x),var(y)]),relapp(partOfStar,[var(x),var(y)])),forall(bindv(z),ref('L'),ifthen(and(relapp(partOfPlus,[var(x),var(z)]),relapp(partOfPlus,[var(z),var(y)])),relapp(partOfPlus,[var(x),var(y)])))))))),function(select,[ref('QL'),ref('L')],partial,star(ref('L'))),axiom([],forall(bindv(q),ref('QL'),forall(bindv(x),ref('L'),forall(bindv(ys),star(ref('L')),ifthen(eq(funapp(select,[var(q),var(x)]),var(ys)),foreach(bindv(y),var(ys),relapp(partOfStar,[var(y),var(x)])))))))].
```

## Languages
* [LAL](../languages/LAL.md) (lal(term))
* [LAL](../languages/LAL.md) (ok(lal(term)))

## References
* elementOf('languages/LAL/lib/selection.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/selection.term'],['languages/LAL/lib/selection.term2'])
* mapsTo(pp,['languages/LAL/lib/selection.term2'],['languages/LAL/lib/selection.lal2'])
* mapsTo(parse,['languages/LAL/lib/selection.lal2'],['languages/LAL/lib/selection.term2'])
* elementOf('languages/LAL/lib/selection.term2',ok(lal(term)))
