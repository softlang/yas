# File _languages/MML/mm.graph_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/mm.graph)**
```
{ class:metamodel,
  classifiers:[
    ( base & { class:class, name:base,
        abstract:true,
        super:[],
        members:[{class:value, name:name, type: #string, cardinality:{class:one}}]}),
    ( metamodel & { class:class, name:metamodel, % ...
...
```

## Languages

## References
* elementOf('languages/MML/mm.graph',mml(graph(term)))
* mapsTo(resolve,['languages/MML/mm.term'],['languages/MML/mm.graph'])
* membership(mml(graph(term)),mmlChecker,['languages/MML/mm.graph'])
