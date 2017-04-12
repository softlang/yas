# File _languages/Hinzu/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Hinzu/as.esl)**
```
// Grouping of metadata items
type model = decl* ;
symbol l : litem* -> decl ;
symbol r : ritem* -> decl ;

// Language-related (representation-unaware) items
symbol lid : lid -> litem ;
...
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/Hinzu/as.esl',esl(text))
* mapsTo(parse,['languages/Hinzu/as.esl'],['languages/Hinzu/as.term'])
