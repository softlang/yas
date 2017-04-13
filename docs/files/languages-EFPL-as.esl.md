# File _languages/EFPL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/as.esl)**
```
// Program = typed functions + main expression
type program = function* # expr ;
type function = string # texpr? # string* # expr ;

// Type expressions
symbol inttype : -> texpr ;
symbol booltype : -> texpr ;
...
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/EFPL/as.esl',esl(text))
* mapsTo(parse,['languages/EFPL/as.esl'],['languages/EFPL/as.term'])
