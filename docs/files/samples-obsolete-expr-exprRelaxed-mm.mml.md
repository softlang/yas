# File _samples/obsolete/expr/exprRelaxed/mm.mml_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/exprRelaxed/mm.mml)**
```
abstract class nat { }
class zero extends nat { }
class succ extends nat {
  part pred : nat?;
}
abstract class expr { }
class const extends expr {
  part value : nat?;    
}
class add extends expr {
  part left : expr?;    
  part right : expr?;    
}
```

## Languages
* [MML](../languages/MML.md) (mml(text))

## References
* elementOf('samples/obsolete/expr/exprRelaxed/mm.mml',mml(text))
* mapsTo(parse,['samples/obsolete/expr/exprRelaxed/mm.mml'],['samples/obsolete/expr/exprRelaxed/mm.term'])
