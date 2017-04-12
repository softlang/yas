# File _languages/MML/editing/lists.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/editing/lists.pro)**
```
% Classes of a metamodel
classesOfMetamodel(MM, CNames) :-
  lookup(classifiers, MM, Classes),
  findall(CName,
    (
      member(Class, Classes),
      lookup(class, Class, class),
...
```
