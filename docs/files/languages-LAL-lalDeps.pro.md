# File _languages/LAL/lalDeps.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalDeps.pro)**
```
:- module(lalDeps, []).

deps(Ds, Deps) :-
    findall((MN, F), (
		member(reuse(MN, _), Ds),
		filename(MN, F) ),
	    Deps).

filename(MN, F2) :-
    atomic_list_concat(MN, '/', F1),
    atomic_list_concat(['languages/LAL/lib/', F1, '.term2'], F2).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/LAL/lalDeps.pro',prolog(text))
