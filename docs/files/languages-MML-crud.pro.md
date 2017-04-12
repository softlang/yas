# File _languages/MML/crud.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/crud.pro)**
```
% Look up class by name
lookupClass(ClassN, MM, Class) :-
  lookupClassifier(ClassN, MM, Class),
  lookup(class, Class, class).

% Look up concrete class by name
lookupConcreteClass(ClassN, MM, Class) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/crud.pro',prolog(text))
