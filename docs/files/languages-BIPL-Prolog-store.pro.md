# File _languages/BIPL/Prolog/store.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Prolog/store.pro)**
```
:- module(biplStore, []).

store([]).
store([(N, V)|Sto]) :- atom(N), intOrBool:value(V), store(Sto).

```
