# File _languages/EIPL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/as.esl)**
```
// Scopes
type scope = decl* # stmt ;

// Declarations
symbol var : string # expr -> decl ;
symbol proc : string # stmt -> decl ;

...
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/EIPL/as.esl',esl(text))
* mapsTo(parse,['languages/EIPL/as.esl'],['languages/EIPL/as.term'])
