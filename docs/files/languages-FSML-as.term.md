# File _languages/FSML/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/as.term)**
```
[type(fsm,star(sort(state))),type(state,tuple([sort(initial),sort(stateid),star(sort(transition))])),type(initial,boolean),type(transition,tuple([sort(event),option(sort(action)),sort(stateid)])),type(stateid,string),type(event,string),type(action,string)].
```
