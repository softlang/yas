# File _languages/Term/dict/dictConversion.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/dict/dictConversion.pro)**
```
% Conversion of dictionaries into lists
dictToList({}, []).
dictToList({K:V}, [(K, V)]).
dictToList({K:V, KVPairs}, [(K, V)|L]) :- dictToList({KVPairs}, L).

% The conversion is bi-directional
listToDict(L, D) :- dictToList(D, L).
```
