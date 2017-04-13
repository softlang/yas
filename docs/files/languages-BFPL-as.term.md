# File _languages/BFPL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/as.term)**
```
[type(program,tuple([sort(functions),sort(expr)])),type(functions,star(sort(function))),type(function,tuple([string,sort(funsig),sort(fundef)])),type(funsig,tuple([star(sort(simpletype)),sort(simpletype)])),type(fundef,tuple([star(string),sort(expr)])),symbol(inttype,[],simpletype),symbol(booltype,[],simpletype),symbol(intconst,[integer],expr),symbol(boolconst,[boolean],expr),symbol(arg,[string],expr),symbol(if,[sort(expr),sort(expr),sort(expr)],expr),symbol(unary,[sort(uop),sort(expr)],expr),symbol(binary,[sort(bop),sort(expr),sort(expr)],expr),symbol(apply,[string,star(sort(expr))],expr),symbol(negate,[],uop),symbol(not,[],uop),symbol(or,[],bop),symbol(and,[],bop),symbol(lt,[],bop),symbol(leq,[],bop),symbol(eq,[],bop),symbol(geq,[],bop),symbol(gt,[],bop),symbol(add,[],bop),symbol(sub,[],bop),symbol(mul,[],bop)].
```

## Languages
* [ESL](../languages/ESL.md) (esl(term))

## References
* elementOf('languages/BFPL/as.term',esl(term))
* mapsTo(parse,['languages/BFPL/as.esl'],['languages/BFPL/as.term'])
* membership(bfpl(term),eslLanguage,['languages/BFPL/as.term'])
