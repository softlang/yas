# File _languages/MML/editing/new-object.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/editing/new-object.pro)**
```
% Instantiate a class
newObject(ClassN, MM1, Obj2) :-
  newObject_(ClassN, MM1, Obj1),
  graphNf(Obj1, Obj2),
  relaxMm(MM1, MM2),
  require(
    inconsistentNewObject(ClassN),
...
```
