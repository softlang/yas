# File _languages/FSML/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/as.term)**
```
[type(fsm,star(sort(state))),type(state,tuple([sort(initial),sort(stateid),star(sort(transition))])),type(initial,boolean),type(transition,tuple([sort(event),option(sort(action)),sort(stateid)])),type(stateid,string),type(event,string),type(action,string)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/FSML/as.term',esl(term))
* mapsTo(parse,['languages/FSML/as.esl'],['languages/FSML/as.term'])
* membership(fsml(term),eslLanguage,['languages/FSML/as.term'])
