# File _languages/EGL/eglScannerfull.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/eglScannerfull.pro)**
```
% BEGIN ...
:- module(eglScannerfull, []).
% END ...
parse(Rules, Mapping, Tokens, Tree) :-
    Terminal = eglScannerfull:terminal,
    External = eglScannerfull:external,
    Config = (Rules, Terminal, External, Mapping),
    Rules = [(_, Root, _)|_],
    eglParser:parse(Config, n(Root), [Tree], Tokens, []). 
terminal(T, [T|Ts], Ts).
external(N, V, [T|Ts], Ts) :- T =.. [N, V].
```
