# File _languages/BNL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/cs.term)**
```
[
  (number,number,[n(bits),n(rest)]),
  (single,bits,[n(bit)]),
  (many,bits,[n(bit),n(bits)]),
  (zero,bit,[t('0')]),
  (one,bit,[t('1')]),
  (integer,rest,[]),
  (rational,rest,[t('.'),n(bits)])
].
```

## Languages
* [BGL](../languages/BGL.md) (bgl(term))

## References
* elementOf('languages/BNL/cs.term',bgl(term))
* mapsTo(parse,['languages/BNL/cs.bgl'],['languages/BNL/cs.term'])
* mapsTo(project,['languages/BNL/cs.term'],['languages/BNL/as.term'])
* membership(bnl(text),bglAcceptor(bnlScanner),['languages/BNL/cs.term'])
* membership(bnl(tokens(term)),bglAcceptor,['languages/BNL/cs.term'])
* membership(bnl(bcl(term)),bclOk:main,['languages/BNL/cs.term'])
* function(parse,[bnl(tokens(term))],[bnl(term)],bglParser,['languages/BNL/cs.term'])
* function(parse,[bnl(text)],[bnl(term)],bglParser(bnlScanner),['languages/BNL/cs.term'])
* function(astToCst,[bnl(term)],[bnl(bcl(term))],astToCst,['languages/BNL/cs.term'])
* mapsTo(conformsTo,['languages/BNL/samples/5comma25.tokens','languages/BNL/cs.term'],[])
