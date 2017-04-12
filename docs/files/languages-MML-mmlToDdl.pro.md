# File _languages/MML/mmlToDdl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/mmlToDdl.pro)**
```
:- module(mmlToDdl, []).

% Map classes to tables
classesToTables(Classifiers, Tables3) :-
  map(mmlToDdl:classToTable, Classifiers, Tabless1),
  concat(Tabless1, Tables1),
  map(mmlToDdl:multisToTables, Classifiers, Tabless2),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/mmlToDdl.pro',prolog(text))
