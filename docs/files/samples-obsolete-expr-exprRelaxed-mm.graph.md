# File _samples/obsolete/expr/exprRelaxed/mm.graph_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/exprRelaxed/mm.graph)**
```
{class:metamodel,classifiers:[ (nat&{class:class,name:nat,abstract:true,super:[],members:[]}), (zero&{class:class,name:zero,abstract:false,super:[#nat],members:[]}), (succ&{class:class,name:succ,abstract:false,super:[#nat],members:[{class:part,name:pred,type: #nat,cardinality:{class:option}}]}), (expr&{class:class,name:expr,abstract:true,super:[],members:[]}), (const&{class:class,name:const,abstract:false,super:[#expr],members:[{class:part,name:value,type: #nat,cardinality:{class:option}}]}), (add&{class:class,name:add,abstract:false,super:[#expr],members:[{class:part,name:left,type: #expr,cardinality:{class:option}},{class:part,name:right,type: #expr,cardinality:{class:option}}]})]}.
```

## Languages

## References
* mapsTo(applyIO,['samples/obsolete/expr/editing/new-expr.config','samples/obsolete/expr/exprRelaxed/mm.graph'],['samples/obsolete/expr/editing/new-expr.graph'])
* mapsTo(applyIO,['samples/obsolete/expr/editing/classes.config','samples/obsolete/expr/exprRelaxed/mm.graph'],['samples/obsolete/expr/editing/classes.term'])
* elementOf('samples/obsolete/expr/exprRelaxed/mm.graph',mml(graph(term)))
* mapsTo(resolve,['samples/obsolete/expr/exprRelaxed/mm.term'],['samples/obsolete/expr/exprRelaxed/mm.graph'])
* membership(exprRelaxed(graph(term)),mmlChecker,['samples/obsolete/expr/exprRelaxed/mm.graph'])
* mapsTo(relax,['samples/obsolete/expr/mm.graph'],['samples/obsolete/expr/exprRelaxed/mm.graph'])
* mapsTo(recardinalize,['samples/obsolete/expr/exprRelaxed/mm.graph','samples/obsolete/expr/mm.graph','samples/obsolete/expr/exprRelaxed/sample.graph'],['samples/obsolete/expr/sample.graph'])
* mapsTo(recardinalize,['samples/obsolete/expr/mm.graph','samples/obsolete/expr/exprRelaxed/mm.graph','samples/obsolete/expr/sample.graph'],['samples/obsolete/expr/exprRelaxed/sample.graph'])
