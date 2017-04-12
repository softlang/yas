# File _languages/LAL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/as.esl)**
```
// Megamodels
type model = decl* ;

// Declarations
symbol reuse : mname # subst* -> decl ;
type mname = name+ ;
type name = string ;
...
```
