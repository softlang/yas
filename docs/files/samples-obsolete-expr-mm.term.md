# File _samples/obsolete/expr/mm.term_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/mm.term)**
```
[class(true,nat,[],[]),class(false,zero,[nat],[]),class(false,succ,[nat],[ (part,pred,nat,one)]),class(true,expr,[],[]),class(false,const,[expr],[ (part,value,nat,one)]),class(false,add,[expr],[ (part,left,expr,one), (part,right,expr,one)])].
```

## Languages
* [MML](../languages/MML.md) (mml(term))

## References
* elementOf('samples/obsolete/expr/mm.term',mml(term))
* mapsTo(parse,['samples/obsolete/expr/mm.mml'],['samples/obsolete/expr/mm.term'])
* mapsTo(resolve,['samples/obsolete/expr/mm.term'],['samples/obsolete/expr/mm.graph'])
