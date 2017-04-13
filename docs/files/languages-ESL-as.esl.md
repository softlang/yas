# File _languages/ESL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ESL/as.esl)**
```
type signature = decl* ;
symbol type : sort # typeexpr -> decl ;
symbol symbol : fsym # typeexpr* # sort -> decl ;
symbol boolean : -> typeexpr ; 
symbol integer : -> typeexpr ; 
symbol float : -> typeexpr ; 
symbol string : -> typeexpr ; 
...
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/ESL/as.esl',esl(text))
* mapsTo(parse,['languages/ESL/as.esl'],['languages/ESL/as.term'])
