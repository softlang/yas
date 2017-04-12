# File _languages/FRL/FRL2/mm.graph_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/FRL2/mm.graph)**
```
0&{class:metamodel,classifiers:[ (1&{abstract:false,class:class,members:[ (2&{cardinality: (3&{class:one}),class:value,name:name,type: #4}), (5&{cardinality: (6&{class:star}),class:part,name:members,type: #7})],name:family,super:[]}), (7&{abstract:false,class:class,members:[ (8&{cardinality: (9&{class:one}),class:value,name:firstName,type: #4}), (10&{cardinality: (11&{class:one}),class:value,name:lastName,type: #4}), (12&{cardinality: (13&{class:star}),class:value,name:emailAddresses,type: #4}), (14&{cardinality: (15&{class:option}),class:reference,name:closestFriend,type: #7})],name:person,super:[]}), (4&{class:datatype,name:atom})]}.
```

## Languages

## References
* elementOf('languages/FRL/FRL2/mm.graph',mml(graph(term)))
* mapsTo(resolve,['languages/FRL/FRL2/mm.term'],['languages/FRL/FRL2/mm.graph'])
* membership(frl2(graph(term)),mmlChecker,['languages/FRL/FRL2/mm.graph'])
