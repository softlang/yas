# File _languages/LAL/lalTextEq.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalTextEq.pro)**
```
:- module(lalTextEq, []).

eq(FileCs, FileLs, Text1, Text2) :-
  atom_concat(lal, 'Abstract', Mapping),
  eglParser(Mapping:(~>), FileCs, FileLs, Text1, Term1),
  eglParser(Mapping:(~>), FileCs, FileLs, Text2, Term2),
  Term1 == Term2.

```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/LAL/lalTextEq.pro',prolog(text))
