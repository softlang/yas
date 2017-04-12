# File _languages/FSML/mm.graph_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/mm.graph)**
```
0&{class:metamodel,classifiers:[ (1&{abstract:false,class:class,members:[ (2&{cardinality: (3&{class:star}),class:part,name:states,type: #4})],name:fsm,super:[]}), (4&{abstract:false,class:class,members:[ (5&{cardinality: (6&{class:one}),class:value,name:initial,type: #7}), (8&{cardinality: (9&{class:one}),class:value,name:stateid,type: #10}), (11&{cardinality: (12&{class:star}),class:part,name:transitions,type: #13})],name:state,super:[]}), (13&{abstract:false,class:class,members:[ (14&{cardinality: (15&{class:one}),class:value,name:event,type: #10}), (16&{cardinality: (17&{class:option}),class:value,name:action,type: #10}), (18&{cardinality: (19&{class:one}),class:reference,name:target,type: #4})],name:transition,super:[]}), (7&{class:datatype,name:boolean}), (10&{class:datatype,name:string})]}.
```

## Languages

## References
* elementOf('languages/FSML/mm.graph',mml(graph(term)))
* mapsTo(resolve,['languages/FSML/mm.term'],['languages/FSML/mm.graph'])
* membership(fsml(graph(term)),mmlChecker,['languages/FSML/mm.graph'])
