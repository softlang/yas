# File _languages/FSML/Prolog/fsmlRename.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/fsmlRename.pro)**
```
% BEGIN ...
:- module(fsmlRename, []).
% END ...
rename(R, Fsm1, Fsm2) :-
    map(fsmlRename:perState(R), Fsm1, Fsm2).

perState(R, (Ini, Id1, Ts1), (Ini, Id2, Ts2)) :-
    ( member((Id1, Id2), R) -> true; Id2 = Id1 ),
    map(fsmlRename:perTransition(R), Ts1, Ts2).

perTransition(R, (Ev, Ac, Id1), (Ev, Ac, Id2)) :-
    ( member((Id1, Id2), R) -> true; Id2 = Id1 ).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/FSML/Prolog/fsmlRename.pro',prolog(text))
