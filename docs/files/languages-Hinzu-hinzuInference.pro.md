# File _languages/Hinzu/hinzuInference.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Hinzu/hinzuInference.pro)**
```
:- module(hinzuInference, []).

main :-
    findall((L, R), (
		hdeclaration(l(Is1)),
		member(lid(L), Is1),
		udeclaration(language(R)),
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/Hinzu/hinzuInference.pro',prolog(text))
