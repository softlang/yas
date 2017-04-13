# File _languages/Term/dict/dictCrud.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/dict/dictCrud.pro)**
```
% Test a key to be present in a dictionary
key(K, D) :- dictToList(D, L), member((K, _), L).

% Look up a value for a key from a dictionary
lookup(K, D, V) :- dictToList(D, L), member((K, V), L).

% Add a key-value pair to a dictionary
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/Term/dict/dictCrud.pro',prolog(text))
