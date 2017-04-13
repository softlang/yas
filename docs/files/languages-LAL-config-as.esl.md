# File _languages/LAL/config/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/config/as.esl)**
```
type config = entry* ;
symbol sort : string # term -> entry ;
symbol constant : string # string -> entry ;
symbol function : string # string -> entry ;
symbol relation : string # string -> entry ;
symbol axiom : string # map -> entry ;
type map = (string # string)* ;
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/LAL/config/as.esl',esl(text))
* mapsTo(parse,['languages/LAL/config/as.esl'],['languages/LAL/config/as.term'])
