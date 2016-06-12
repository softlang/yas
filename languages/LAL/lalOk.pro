% BEGIN ...
:- module(lalOk, []).
% END ...
model(Ds) :-
    typesOfNames(Ds),
    map(lalOk:decl(Ds), Ds).

% Each name is used for just one type of declaration
typesOfNames(Ds) :- \+ (
    member(D1, Ds),
    member(D2, Ds),
    declToName(D1, F1, N),
    declToName(D2, F2, N),
    \+ F1 == F2 ).

declToName(language(N, _), language, N).
declToName(relation(N, _), relation, N).
declToName(function(N, _, _, _), function, N).
declToName(constant(N, _), constant, N).
declToName(axiom([N], _), axiom, N).

% Well-formedess of types
type(Ds, ref(N)).
type(Ds, star(T)) :- type(Ds, T).
type(Ds, product(Ts)) :- map(lalOk:type(Ds), Ts).

% Subtyping relationship
subTypeOf(_, T, T).
subTypeOf(Ds, ref(N1), ref(N2)) :-
    member(language(N1, [N2]), Ds).

% Well-formedness of declarations
decl(Ds, language(N, X)) :- % ...
% BEGIN ...
    \+ (
      member(language(N, Y), Ds),
      \+ X == Y ).
% END ...
decl(Ds, relation(_, Ts)) :- % ...
% BEGIN ...
    map(lalOk:type(Ds), Ts).
% END ...
decl(Ds, function(_, Ts, _, T)) :- % ...
% BEGIN ...
    map(lalOk:type(Ds), Ts),
    type(Ds, T).
% END ...
decl(Ds, constant(_, T)) :- % ...
% BEGIN ...
    type(Ds, T).    
% END ...
decl(Ds, axiom(_, F)) :- formula(Ds, [], F).
decl(Ds, link(N, _)) :- % ...
% BEGIN ...
    member(D, Ds),
    declToName(D, _, N).
% END ...

% Well-formedness of formulae
formula(Ds, M, relapp(N, Es)) :-
    member(relation(N, Ts), Ds),
    map(lalOk:expr(Ds, M), Es, Ts).
formula(Ds, M1, forall(V, T, F)) :-
    type(Ds, T),
    bind(Ds, V, T, M1, M2),
    formula(Ds, M2, F).
% ...
% BEGIN ...
formula(Ds, M1, foreach(V, E, F)) :-
    expr(Ds, M1, E, star(T)),
    bind(Ds, V, T, M1, M2),
    formula(Ds, M2, F).
formula(Ds, M1, exists(V, T, F)) :-
    type(Ds, T),
    bind(Ds, V, T, M1, M2),
    formula(Ds, M2, F).
formula(Ds, M1, existsu(V, T, F)) :-
    type(Ds, T),
    bind(Ds, V, T, M1, M2),
    formula(Ds, M2, F).
formula(Ds, M, element(E, T1)) :-
    type(Ds, T1),
    expr(Ds, M, E, T2),
    subTypeOf(Ds, T1, T2).
formula(Ds, M, eq(E1, E2)) :-
    expr(Ds, M, E1, T1),
    expr(Ds, M, E2, T2),
    ( subTypeOf(Ds, T1, T2);
      subTypeOf(Ds, T2, T1) ).
formula(Ds, M, and(F1, F2)) :-
    formula(Ds, M, F1),
    formula(Ds, M, F2).
formula(Ds, M, or(F1, F2)) :-
    formula(Ds, M, F1),
    formula(Ds, M, F2).
formula(Ds, M, not(F)) :-
    formula(Ds, M, F).
formula(Ds, M, iff(F1, F2)) :-
    formula(Ds, M, F1),
    formula(Ds, M, F2).
% END ...
formula(Ds, M, ifthen(F1, F2)) :-
    formula(Ds, M, F1),
    formula(Ds, M, F2).

% Binding of variables for quantifiers
bind(Ds, bindv(N), T, M, [(N, T)|M]) :-
    \+ member((N, _), M),
    \+ member(constant(N, _), Ds).
bind(Ds, bindt([]), product([]), M, M).
bind(Ds, bindt([V|Vs]), product([T|Ts]), M1, M3) :-
    bind(Ds, V, T, M1, M2),
    bind(Ds, bindt(Vs), product(Ts), M2, M3).

% Well-formedness of expressions
expr(Ds, M, funapp(N, Es), T) :-
    member(function(N, Ts1, _, T), Ds),
    map(lalOk:expr(Ds, M), Es, Ts2),
    map(lalOk:subTypeOf(Ds), Ts2, Ts1).
expr(Ds, M, var(N), T) :-
    member((N, T), M);
    member(constant(N, T), Ds).
