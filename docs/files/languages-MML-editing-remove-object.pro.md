# File _languages/MML/editing/remove-object.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/editing/remove-object.pro)**
```
% Remove a subobject
removeObject(MM1, Id, Obj1, Obj3) :-
  topdownGraph(
    removeObject_(Id),
      Obj1, Obj2),
  require(
    missingId(Id),
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/MML/editing/remove-object.pro',prolog(text))
