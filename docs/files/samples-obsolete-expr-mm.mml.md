# File _samples/obsolete/expr/mm.mml_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/mm.mml)**
```
abstract class nat { }
class zero extends nat { }
class succ extends nat {
  part pred : nat;
}
abstract class expr { }
class const extends expr {
  part value : nat;    
}
class add extends expr {
  part left : expr;    
  part right : expr;    
}
```

## Languages
* [MML](../languages/MML.md)

## References
* elementOf('samples/obsolete/expr/mm.mml',mml(text))
* mapsTo(parse,['samples/obsolete/expr/mm.mml'],['samples/obsolete/expr/mm.term'])
