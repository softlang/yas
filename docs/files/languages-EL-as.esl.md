# File _languages/EL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/as.esl)**
```
// Expressions
symbol intconst : integer -> expr ;
symbol boolconst : boolean -> expr ;
symbol var : string -> expr ;
symbol unary : uop # expr -> expr ;
symbol binary : bop # expr # expr -> expr ;

...
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/EL/as.esl',esl(text))
* mapsTo(parse,['languages/EL/as.esl'],['languages/EL/as.term'])
