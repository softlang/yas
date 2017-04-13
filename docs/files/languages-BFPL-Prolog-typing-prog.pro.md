# File _languages/BFPL/Prolog/typing/prog.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/typing/prog.pro)**
```
% BEGIN ...
:- module(bfplProg, []).
% END ...
% Wellness of collection of function declarations
ok((Fs, E)) :-
  map(bfplProg:toFunName, Fs, Ns),
  set(Ns),
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BFPL/Prolog/typing/prog.pro',prolog(text))
