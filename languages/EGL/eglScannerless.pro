% BEGIN ...
:- module(eglScannerless, []).
% END ...
parse(Rules1, Rules2, Layout, Mapping, Chars0, Tree) :-
    Terminal = eglScannerless:terminal(Rules2, Layout, Mapping),
    External = eglScannerless:external(Rules2, Layout, Mapping),
    Config = (Rules1, Terminal, External, Mapping),
    eglParser:parse(Config, n(Root), [Tree], Chars0, Chars1),
    Rules1 = [(_,Root,_)|_],
    layout(Rules2, Layout, Mapping, Chars1, []).

terminal(Rules, Layout, Mapping, T, Chars0, Chars2) :-
    layout(Rules, Layout, Mapping, Chars0, Chars1),
    terminal(T, Chars1, Chars2).

terminal(T, Chars0, Chars1) :-
    name(T, String),
    append(String, Chars1, Chars0).

external(Rules, Layout, Mapping, N, Tree, Chars0, Chars2) :-
    layout(Rules, Layout, Mapping, Chars0, Chars1),
    scan(Rules, Mapping, n(N), [Tree], Chars1, Chars2).

layout(Rules, Layout, Mapping, Chars0, Chars1) :- 
    scan(Rules, Mapping, star([n(Layout)]), _, Chars0, Chars1).

scan(Rules, Mapping, Symbol, Trees, Chars0, Chars1) :-
    Terminal = eglScannerless:terminal,
    External = char,
    Config = (Rules, Terminal, External, Mapping),
    once(eglParser:parse(Config, Symbol, Trees, Chars0, Chars1)).
