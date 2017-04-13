# File _languages/EFPL/Prolog/efplTyping.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/Prolog/efplTyping.pro)**
```
% BEGIN ...
:- module(efplTyping, []).
% Well-typedness based on attempted type inference
okProg(P) :- okProg(P, _).
% END ...
% Type inference for programs
okProg((Fs1, E), (Fs2, E)) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/EFPL/Prolog/efplTyping.pro',prolog(text))
