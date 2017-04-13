# File _languages/Term/dict/abssyn.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/dict/abssyn.pro)**
```
% Well-formedness of dictionaries
dict(D) :-
  dictToList(D, L),
  unzip(L, KL, VL),
  map(atom, KL), % type of keys
  set(KL), % uniqueness of keys
  map(dictValue, VL).
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/Term/dict/abssyn.pro',prolog(text))
