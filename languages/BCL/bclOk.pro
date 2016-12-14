% BEGIN ...
:- module(bclOk, []).

main(F, T) :-
    readTermFile(F, G),
    conformsTo(T, G).
% END ...
conformsTo(fork(R, Ts), G) :-
    member(R, G),
    R = (_,_, Ss),
    treesVersusSymbols(G, Ts, Ss).

% Conformance of a CST to a grammar symbol
treeVersusSymbol(_, leaf(T), t(T)).
treeVersusSymbol(G, fork(R, Ts), n(N)) :-
    member(R, G),
    R = (_, N, Ss),
    treesVersusSymbols(G, Ts, Ss).

% Conformance of a list of CSTs to a list of grammar symbols
treesVersusSymbols(_, [], []).
treesVersusSymbols(G, [T|Ts], [S|Ss]) :-
    treeVersusSymbol(G, T, S),
    treesVersusSymbols(G, Ts, Ss).
