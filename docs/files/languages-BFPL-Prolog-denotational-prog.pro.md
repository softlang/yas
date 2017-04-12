# File _languages/BFPL/Prolog/denotational/prog.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/denotational/prog.pro)**
```
:- module(bfplDenotational, []).

% Evaluate main expression of program
prog((Fs, E), V) :-
  meaningExpr(Fs, E, F),
  passTo([], F, V).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/BFPL/Prolog/denotational/prog.pro',prolog(text))
