# File _languages/FSML/mm.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/mm.term)**
```
[class(false,fsm,[],[ (part,states,state,star)]),class(false,state,[],[ (value,initial,boolean,one), (value,stateid,string,one), (part,transitions,transition,star)]),class(false,transition,[],[ (value,event,string,one), (value,action,string,option), (reference,target,state,one)]),datatype(boolean),datatype(string)].
```

## Languages
* [MML](../languages/MML.md) (mml(term))

## References
* elementOf('languages/FSML/mm.term',mml(term))
* mapsTo(parse,['languages/FSML/mm.mml'],['languages/FSML/mm.term'])
* mapsTo(resolve,['languages/FSML/mm.term'],['languages/FSML/mm.graph'])
