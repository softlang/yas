# File _languages/EGL/eglParser.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/eglParser.pro)**
```
% BEGIN ...
:- module(eglParser, []).
% END ...
% The case for terminals
parse((_, Terminal, _, _), t(T), [], Input0, Input1) :-
    apply(Terminal, [T, Input0, Input1]).

...
```
