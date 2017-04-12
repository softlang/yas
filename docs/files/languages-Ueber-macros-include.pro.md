# File _languages/Ueber/macros/include.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/include.pro)**
```
include(Rel) :-
  ueber(elementOf(Rel, ueber(term))),
  ueber_absolute(Rel, Abs),
  exists_file(Abs) -> 
      open(Abs, read, Input, []),
      read(Input, Term),
      ueber(Term)
    ; true.
```
