# File _languages/DGL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DGL/as.esl)**
```
type graph = node* # edge* ;
type node = id # label # shape # style? ;
type edge = id # id # label? ;
type id = string ;
type label = string ;
symbol box : -> shape ;
symbol ellipse : -> shape ;
symbol bold : -> style ;
symbol dotted : -> style ;
symbol filled : -> style ;
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/DGL/as.esl',esl(text))
* mapsTo(parse,['languages/DGL/as.esl'],['languages/DGL/as.term'])
