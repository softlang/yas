# File _languages/MMTL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MMTL/as.esl)**
```
symbol renameClassifier : name # name -> trafo ;
symbol renameMember : name # name # name -> trafo ;
symbol partToReference : name # name -> trafo ;
symbol valueToReference : name # name # name # name -> trafo ;
// ...
type name = string ;
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/MMTL/as.esl',esl(text))
* mapsTo(parse,['languages/MMTL/as.esl'],['languages/MMTL/as.term'])
