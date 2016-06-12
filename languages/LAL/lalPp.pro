:- module(lalPp, []).

pp(Ds, T) :-
    Ds => Bs,
    pplRender:render(vlist(Bs), T).

% Lists of declarations
[] => [].
[D|Ds] => [B|Bs] :-
    D => B,
    Ds => Bs.

% All other forms
language(N, []) => B :- decl(language, N, B).
language(N1, [N2]) => hlist([B, indent(text('<=')), indent(text(N2))]) :-
    decl(language, N1, B).
relation(N, TEs) => hbox(B1, B2) :-
    tdecl(relation, N, B1),
    texprs(TEs, B2).
function(N, TEs, A, TE) => hlist([B1, B2, B3, B4]) :-
    tdecl(function, N, B1),
    texprs(TEs, B2),
    A => B3,
    TE => B4.
constant(N, TE1) => hbox(B1, B2) :-
    tdecl(constant, N, B1),
    TE1 => B2.
axiom([], F) => B2 :-
    F => B1,
    axiom(text(axiom), B1, B2).
axiom([N], F) => B3 :-
    decl(axiom, N, B1),
    F => B2,
    axiom(B1, B2, B3).
link(N, U) => hlist([text(link), indent(text(N)), indent(text(to)), indent(text('\'')), text(U), text('\'') ]).
ref(N) => text(N).
star(TE) => hbox(B, text('*')) :- TE => B.
product(TEs) => hlist([text('('), B, text(')')]) :-
    texprs(TEs, B).
total => text(' -> ').
partial => text(' ~> ').
forall(V, TE, F) => B :-
    quantifier(forall, V, '<-', TE, F, B).
foreach(V, T, F) => B :-
    quantifier(foreach, V, ':', T, F, B).
exists(V, TE, F) => B :-
    quantifier(exists, V, '<-', TE, F, B).
existsu(V, TE, F) => B :-
    quantifier('exists!', V, '<-', TE, F, B).
bindv(V) => text(V).
bindt(Vs) => B :-
    commaparens(Vs, B).
relapp(N, Ts) => hbox(text(N), B) :-
    commaparens(Ts, B).
element(T, TE) => hlist([B1, indent(text('<-')), indent(B2)]) :-
    T => B1,
    TE => B2.
eq(T1, T2) => hlist([B1, indent(text('=')), indent(B2)]) :-
    T1 => B1,
    T2 => B2.
and(F1, F2) => hlist([B3, indent(text('/\\')), indent(B4)]) :-
    F1 => B1,
    F2 => B2,
    parens(B1, B3),
    parens(B2, B4).
or(F1, F2) => hlist([B3, indent(text('\\/')), indent(B4)]) :-
    F1 => B1,
    F2 => B2,
    parens(B1, B3),
    parens(B2, B4).
not(F) => hbox(text('~'), indent(B2)) :-
    F => B1,
    parens(B1, B2).
iff(F1, F2) => hlist([B3, indent(text('<=>')), indent(B4)]) :-
    F1 => B1,
    F2 => B2,
    parens(B1, B3),
    parens(B2, B4).
ifthen(F1, F2) => hlist([B3, indent(text('=>')), indent(B4)]) :-
    F1 => B1,
    F2 => B2,
    parens(B1, B3),
    parens(B2, B4).
funapp(N, Ts) => hbox(text(N), B) :-
    commaparens(Ts, B).
var(N) => text(N).

% Factored helpers
decl(K, N, hbox(text(K), indent(text(N)))).
tdecl(K, N, hbox(B, text(' : '))) :- decl(K, N, B).
texprs(TEs, hseplist(text(' # '), Bs)) :-
    map(lalPp:(=>), TEs, Bs).
axiom(B1, B2, vlist([hbox(B1, indent(text('{'))), indent(B2), text('}')])).
quantifier(K, V, S, X, F, vbox(hlist(Bs), indent(B3))) :-
    V => B1,
    X => B2,
    Bs = [text(K), indent(B1), indent(text(S)), indent(B2), text('.')],
    F => B3.
parens(B, hlist([text('('), B, text(')')])).
commaparens(Xs, B) :-
    map(lalPp:(=>), Xs, Bs),
    parens(hseplist(text(', '), Bs), B).
