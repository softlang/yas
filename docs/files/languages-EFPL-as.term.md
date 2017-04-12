# File _languages/EFPL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/as.term)**
```
[type(program,tuple([star(sort(function)),sort(expr)])),type(function,tuple([string,option(sort(texpr)),star(string),sort(expr)])),symbol(inttype,[],texpr),symbol(booltype,[],texpr),symbol(funtype,[sort(texpr),sort(texpr)],texpr),symbol(typevar,[string],texpr),symbol(intconst,[integer],expr),symbol(boolconst,[boolean],expr),symbol(name,[string],expr),symbol(if,[sort(expr),sort(expr),sort(expr)],expr),symbol(unary,[sort(uop),sort(expr)],expr),symbol(binary,[sort(bop),sort(expr),sort(expr)],expr),symbol(apply,[sort(expr),star(sort(expr))],expr),symbol(negate,[],uop),symbol(not,[],uop),symbol(add,[],bop),symbol(sub,[],bop),symbol(mul,[],bop),symbol(lt,[],bop),symbol(le,[],bop),symbol(eq,[],bop),symbol(geq,[],bop),symbol(gt,[],bop),symbol(and,[],bop),symbol(or,[],bop)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/EFPL/as.term',esl(term))
* mapsTo(parse,['languages/EFPL/as.esl'],['languages/EFPL/as.term'])
* membership(efpl(term),eslLanguage,['languages/EFPL/as.term'])
