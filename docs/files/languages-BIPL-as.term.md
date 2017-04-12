# File _languages/BIPL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/as.term)**
```
[symbol(skip,[],stmt),symbol(assign,[string,sort(expr)],stmt),symbol(seq,[sort(stmt),sort(stmt)],stmt),symbol(if,[sort(expr),sort(stmt),sort(stmt)],stmt),symbol(while,[sort(expr),sort(stmt)],stmt),symbol(intconst,[integer],expr),symbol(var,[string],expr),symbol(unary,[sort(uop),sort(expr)],expr),symbol(binary,[sort(bop),sort(expr),sort(expr)],expr),symbol(negate,[],uop),symbol(not,[],uop),symbol(or,[],bop),symbol(and,[],bop),symbol(lt,[],bop),symbol(leq,[],bop),symbol(eq,[],bop),symbol(geq,[],bop),symbol(gt,[],bop),symbol(add,[],bop),symbol(sub,[],bop),symbol(mul,[],bop)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/BIPL/as.term',esl(term))
* mapsTo(parse,['languages/BIPL/as.esl'],['languages/BIPL/as.term'])
* membership(bipl(term),eslLanguage,['languages/BIPL/as.term'])
