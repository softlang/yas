% BEGIN ...
:- module(bgtlOk, []).

main(F, T) :-
    readTermFile(F, G),
    conformsTo(T, G).
% END ...
conformsTo(fork(R, Ts), G) :-
    member(R, G),
    R = (_,_, Ss),
    conformsTo(G, Ts, Ss).

conformsTo(_, [], []).
conformsTo(G, [T|Ts], [S|Ss]) :-
    conformsTo(G, T, S),
    conformsTo(G, Ts, Ss).

conformsTo(_, leaf(T), t(T)).
conformsTo(G, fork(R, Ts), n(N)) :-
    member((_, N, Ss), G),
    conformsTo(G, Ts, Ss).
