# File _languages/EIPL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/as.term)**
```
[type(scope,tuple([star(sort(decl)),sort(stmt)])),symbol(var,[string,sort(expr)],decl),symbol(proc,[string,sort(stmt)],decl),symbol(skip,[],stmt),symbol(assign,[string,sort(expr)],stmt),symbol(seq,[sort(stmt),sort(stmt)],stmt),symbol(if,[sort(expr),sort(stmt),sort(stmt)],stmt),symbol(while,[sort(expr),sort(stmt)],stmt),symbol(scope,[sort(scope)],stmt),symbol(call,[string],stmt),symbol(write,[sort(expr)],stmt),symbol(intconst,[integer],expr),symbol(var,[string],expr),symbol(binary,[sort(binop),sort(expr),sort(expr)],expr),symbol(add,[],binop),symbol(sub,[],binop),symbol(mul,[],binop),symbol(geq,[],binop)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/EIPL/as.term',esl(term))
* mapsTo(parse,['languages/EIPL/as.esl'],['languages/EIPL/as.term'])
* membership(eipl(term),eslLanguage,['languages/EIPL/as.term'])
