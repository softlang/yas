% BEGIN ...
:- module(lalReuse, []).
% END ...
% Case for megamodels (lists of declarations)
inline(Ds1, Ds2) :-
    map(lalReuse:inline, Ds1, Dss),
    concat(Dss, Ds2).
       
% Case for non-reuse declarations
inline(D, [D]) :-
    \+ D = reuse(_, _).

% Case for reuse declarations
inline(reuse(MN, Ss), Ds2) :-
    lalDeps:filename(MN, F),
    readTermFile(F, Ds1),
    substs(Ss, Ds1, Ds2).

% Apply a list of substitutions
substs([], Ds, Ds).
substs([(N1, N2)|Ss], Ds1, Ds3) :-
    topdown(try(lalReuse:subst(N1, N2)), Ds1, Ds2),
    \+ Ds1 == Ds2,
    substs(Ss, Ds2, Ds3).

% Patterns relevant for substitution
subst(N1, N2, language(N1, [N1]), language(N2, [N2])).
subst(N1, N2, language(N1, N3), language(N2, N3)).
subst(N1, N2, language(N3, [N1]), language(N3, [N2])).
subst(N1, N2, ref(N1), ref(N2)).
subst(N1, N2, relation(N1, Ts), relation(N2, Ts)).
subst(N1, N2, relapp(N1, Es), relapp(N2, Es)).
subst(N1, N2, function(N1, Ts, A, T), function(N2, Ts, A, T)).
subst(N1, N2, funapp(N1, Es), funapp(N2, Es)).
subst(N1, N2, constant(N1, T), constant(N2, T)).
subst(N1, N2, var(N1), var(N2)).
subst(N1, N2, axiom([N1], F), axiom([N2], F)).
subst(N1, N2, link(N1, U), link(N2, U)).
