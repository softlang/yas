# File _languages/FRL/mm.graph_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/mm.graph)**
```
{class:metamodel,classifiers:[ (family&{class:class,name:family,abstract:false,super:[],members:[{class:value,name:name,type: #atom,cardinality:{class:one}},{class:part,name:members,type: #person,cardinality:{class:star}}]}), (person&{class:class,name:person,abstract:false,super:[],members:[{class:value,name:firstName,type: #atom,cardinality:{class:one}},{class:value,name:emailAddresses,type: #atom,cardinality:{class:star}},{class:reference,name:closestFriend,type: #person,cardinality:{class:option}}]}), (atom&{class:datatype,name:atom})]}.
```

## Languages

## References
* mapsTo(atomToRef,['languages/FNL/atomToRef.config','languages/FNL/small-family.graph','languages/FNL/mm.graph'],['languages/FRL/small-family.graph','languages/FRL/mm.graph'])
* elementOf('languages/FRL/mm.graph',mml(graph(term)))
* mapsTo(resolve,['languages/FRL/mm.term'],['languages/FRL/mm.graph'])
* membership(frl(graph(term)),mmlChecker,['languages/FRL/mm.graph'])
