# File _languages/EFPL/Prolog/efplAlpha.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/Prolog/efplAlpha.pro)**
```
% BEGIN ...
:- module(efplAlpha, []).
% END ...
convert(T1, T2) :- convert([], _, T1, T2).
convert(M, M, inttype, inttype).
convert(M, M, booltype, booltype).
convert(M1, M3, funtype(T1, T2), funtype(T3, T4)) :-
    convert(M1, M2, T1, T3),
    convert(M2, M3, T2, T4).
convert(M, M, typevar(N), X) :- member((N, X), M).
convert(M, [(N, X)|M], typevar(N), X) :- \+ member((N, _), M).
```
