# File _languages/BNL/samples/5comma25.tree_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/samples/5comma25.tree)**
```
fork((number,number,[n(bits),n(rest)]),[fork((many,bits,[n(bit),n(bits)]),[fork((one,bit,[t('1')]),[leaf('1')]),fork((many,bits,[n(bit),n(bits)]),[fork((zero,bit,[t('0')]),[leaf('0')]),fork((single,bits,[n(bit)]),[fork((one,bit,[t('1')]),[leaf('1')])])])]),fork((rational,rest,[t('.'),n(bits)]),[leaf('.'),fork((many,bits,[n(bit),n(bits)]),[fork((zero,bit,[t('0')]),[leaf('0')]),fork((single,bits,[n(bit)]),[fork((one,bit,[t('1')]),[leaf('1')])])])])]).
```

## Languages

## References
* elementOf('languages/BNL/samples/5comma25.tree',bnl(bcl(term)))
* mapsTo(unparse,['languages/BNL/samples/5comma25.tree'],['languages/BNL/samples/5comma25.tokens'])
* mapsTo(unparse,['languages/BNL/samples/5comma25.tree'],['languages/BNL/samples/5comma25.bnl'])
* mapsTo(cstToAst,['languages/BNL/samples/5comma25.tree'],['languages/BNL/samples/5comma25.term'])
* mapsTo(astToCst,['languages/BNL/samples/5comma25.term'],['languages/BNL/samples/5comma25.tree'])
