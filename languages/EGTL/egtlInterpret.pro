:- module(egtlInterpret, []).

interpret(sequ([]), G, G).

interpret(sequ([T|Ts]), G1, G3) :-
    interpret(T, G1, G2),
    interpret(sequ(Ts), G2, G3).

interpret(renameT(T1, T2), G1, G2) :-
    topdown(try(egtlInterpret:renameT(T1, T2)), G1, G2).

interpret(renameN(N1, N2), G1, G3) :-
    map(try(egtlInterpret:renameN2(N1, N2)), G1, G2),
    topdown(try(egtlInterpret:renameN2(N1, N2)), G2, G3).

interpret(generalize(R1, R2), Rs1, Rs2) :-
    \+ R1 == R2,
    egtlGeq:geq(R2, R1),
    append(Rs1a, [R1|Rs1b], Rs1),
    append(Rs1a, [R2|Rs1b], Rs2).

interpret(specialize(R1, R2), Rs1, Rs2) :-
    \+ R1 == R2,
    egtlGeq:geq(R1, R2),
    append(Rs1a, [R1|Rs1b], Rs1),
    append(Rs1a, [R2|Rs1b], Rs2).

interpret(add(R1), Rs1, Rs2) :-
    R1 = (_, N1, _),
    append(Rs1a, [R2|Rs1b], Rs1),
    R2 = (_, N1, _),
    ( Rs1b == [];
      Rs1b = [(_, N2, _)|_],
      \+ N1 == N2 ),
    append(Rs1a, [R2,R1|Rs1b], Rs2).

interpret(remove(R), Rs1, Rs2) :-
    append(Rs1a, [R|Rs1b], Rs1),
    append(Rs1a, Rs1b, Rs2).

% Rewrite rules
renameT(T1, T2, t(T1), t(T2)).
renameN1(N1, N2, (L, N1, Ss), (L, N2, Ss)).
renameN2(N1, N2, n(N1), n(N2)).
