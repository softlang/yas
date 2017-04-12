# File _languages/FNL/mm.graph_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FNL/mm.graph)**
```
{class:metamodel,classifiers:[ (family&{class:class,name:family,abstract:false,super:[],members:[{class:value,name:name,type: #atom,cardinality:{class:one}},{class:part,name:members,type: #person,cardinality:{class:star}}]}), (person&{class:class,name:person,abstract:false,super:[],members:[{class:value,name:firstName,type: #atom,cardinality:{class:one}},{class:value,name:emailAddresses,type: #atom,cardinality:{class:star}},{class:value,name:closestFriend,type: #atom,cardinality:{class:option}}]}), (atom&{class:datatype,name:atom})]}.
```

## Languages

## References
* elementOf('languages/FNL/mm.graph',mml(graph(term)))
* mapsTo(resolve,['languages/FNL/mm.term'],['languages/FNL/mm.graph'])
* membership(fnl(graph(term)),mmlChecker,['languages/FNL/mm.graph'])
* mapsTo(atomToRef,['languages/FNL/atomToRef.config','languages/FNL/small-family.graph','languages/FNL/mm.graph'],['languages/FRL/small-family.graph','languages/FRL/mm.graph'])
