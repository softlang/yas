# File _languages/LAL/lib/membership.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/membership.term2)**
```
[sort('Any',[]),sort('L',['Any']),constant(pos,ref('Any')),constant(neg,ref('Any')),axiom([member],element(var(pos),ref('L'))),axiom([notMember],not(element(var(neg),ref('L'))))].
```

## Languages
* [LAL](../languages/LAL.md) (lal(term))
* [LAL](../languages/LAL.md) (ok(lal(term)))

## References
* elementOf('languages/LAL/lib/membership.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/membership.term'],['languages/LAL/lib/membership.term2'])
* mapsTo(pp,['languages/LAL/lib/membership.term2'],['languages/LAL/lib/membership.lal2'])
* mapsTo(parse,['languages/LAL/lib/membership.lal2'],['languages/LAL/lib/membership.term2'])
* elementOf('languages/LAL/lib/membership.term2',ok(lal(term)))
