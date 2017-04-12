# File _languages/MML/api.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/api.pro)**
```
mmlChecker(MmFile, Model) :-
  readTermFile(MmFile, Mm),
  conforms(Model, Mm).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/api.pro',prolog(text))
