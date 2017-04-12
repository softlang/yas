# File _languages/LAL/lib/cx/cotransformation.lalconfig_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/cotransformation.lalconfig)**
```
[ sort('L1', term),
  sort('Any1', term),
  sort('L2', bsl(term)),
  sort('Any2', term),
  sort('XL', bstl(term)),
  sort('XAny', term),
  relation(consistent, conformsTo),
  axiom(consistency, [
    (t, 'trafo1.term'),
    (a, 'term1.term'),
    (b, 'sig1.term'),
    (c, 'term2.term'),
    (d, 'sig2.term') ])].
```

## Languages

## References
* elementOf('languages/LAL/lib/cx/cotransformation.lalconfig',lal(config(term)))
* mapsTo(translate,['languages/LAL/lib/cx/cotransformation.term2','languages/LAL/lib/cx/cotransformation.lalconfig'],['languages/BSTL/tests/trafo1.ueber'])
