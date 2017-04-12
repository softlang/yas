# File _languages/BFPL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/as.esl)**
```
// Program = typed functions + main expression
type program = functions # expr ;
type functions = function* ;
type function = string # funsig # fundef ;
type funsig = simpletype* # simpletype ;
type fundef = string* # expr ;

...
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/BFPL/as.esl',esl(text))
* mapsTo(parse,['languages/BFPL/as.esl'],['languages/BFPL/as.term'])
