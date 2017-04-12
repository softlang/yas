# File _languages/Hinzu/hinzuMdIndex.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Hinzu/hinzuMdIndex.pro)**
```
:- module(hinzuMdIndex, []).

main(Hinzu, Md) :-
    with_output_to(
	    codes(Md),
	    format('# Languages~n~n## Fabricated languages~n~@~n## Established languages~n~@~n', [languages(hinzuMdIndex:fabricated, Hinzu), languages(hinzuMdIndex:established, Hinzu)])).

...
```
