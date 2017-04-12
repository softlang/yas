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
