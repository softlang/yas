# File _languages/EL/Prolog/qq/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/as.esl)**
```
// ... // The EL symbols
// BEGIN ...
// Expressions
symbol intconst : integer -> expr ;
symbol boolconst : boolean -> expr ;
symbol var : string -> expr ;
symbol unary : uop # expr -> expr ;
...
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/EL/Prolog/qq/as.esl',esl(text))
* mapsTo(parse,['languages/EL/Prolog/qq/as.esl'],['languages/EL/Prolog/qq/as.term'])
