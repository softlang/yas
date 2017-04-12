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
