# File _languages/MML/editing/add-object.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/editing/add-object.pro)**
```
% Add a new subobject
addObject(MM1, Id, Key, ClassN, Obj1, Obj3) :-
  newObject_(MM1, ClassN, Obj0),
  topdownGraph(
    addObject_(Id, Key, Obj0),
      Obj1, Obj2),
  graphNf(Obj2, Obj3),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/editing/add-object.pro',prolog(text))
