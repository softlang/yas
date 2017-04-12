# File _languages/FSML/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/as.esl)**
```
type fsm = state* ;
type state = initial # stateid # transition* ;
type initial = boolean ;
type transition = event # action? # stateid ;
type stateid = string ;
type event = string ;
type action = string ;
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/FSML/as.esl',esl(text))
* mapsTo(parse,['languages/FSML/as.esl'],['languages/FSML/as.term'])
