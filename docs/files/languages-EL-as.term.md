# File _languages/EL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/as.term)**
```
[symbol(intconst,[integer],expr),symbol(boolconst,[boolean],expr),symbol(var,[string],expr),symbol(unary,[sort(uop),sort(expr)],expr),symbol(binary,[sort(bop),sort(expr),sort(expr)],expr),symbol(negate,[],uop),symbol(not,[],uop),symbol(add,[],bop),symbol(sub,[],bop),symbol(mul,[],bop),symbol(lt,[],bop),symbol(le,[],bop),symbol(eq,[],bop),symbol(geq,[],bop),symbol(gt,[],bop),symbol(and,[],bop),symbol(or,[],bop)].
```

## Languages
* [ESL](../languages/ESL.md) (esl(term))

## References
* elementOf('languages/EL/as.term',esl(term))
* mapsTo(parse,['languages/EL/as.esl'],['languages/EL/as.term'])
* membership(el(term),eslLanguage,['languages/EL/as.term'])
