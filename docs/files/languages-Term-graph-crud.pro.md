# File _languages/Term/graph/crud.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/graph/crud.pro)**
```
% Test a key to be present in an object
key(K, _&D) :-
  key(K, D).

% Look up a value for a key from an object
lookup(K, _&D, V) :-
  lookup(K, D, V).
...
```
