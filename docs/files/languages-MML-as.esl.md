# File _languages/MML/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/as.esl)**
```
type metamodel = classifier* ;
symbol class : abstract # cname # extends? # member* -> classifier ;
symbol datatype : cname -> classifier ;
type member = kind # mname # cname # cardinality ;
symbol value : -> kind ;
symbol part : -> kind ;
symbol reference : -> kind ;
symbol one : -> cardinality ;
symbol option : -> cardinality ;
symbol star : -> cardinality ;
type abstract = boolean ;
type extends = cname ;
type cname = string ;
type mname = string ;
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/MML/as.esl',esl(text))
* mapsTo(parse,['languages/MML/as.esl'],['languages/MML/as.term'])
