% BEGIN ...
:- module(mmlAbstract, []).
% END ...
% Flatten lists of classifiers
(metamodel, L1) ~> L3 :-
    append(L1a, [E|L1b], L1),
    is_list(E),
    concat([L1a, E, L1b], L2),
    ( ( (metamodel, L2) ~> L3 ) -> true; L3 = L2 ).

% Desugar enum types as flat class hierarchy
(classifier, enum(N1, N2, Ns)) ~> [C1|Cs] :-
    C1 = class(true, N1, [], []),
    maplist(mmlAbstract:enumify(N1), [N2|Ns], Cs).

(abstract, abstract) ~> true.
(abstract, concrete) ~> false.

(name, String) ~> Atom :- name(Atom, String).

enumify(N1, N2, class(false, N2, [N1], [])).
