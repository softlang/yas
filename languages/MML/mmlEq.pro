:- module(mmlEq, []).

% Order of classifiers does not matter
eq(Cs1, Cs2) :-
    map(mmlEq:sortClassifier, Cs1, Cs3),
    map(mmlEq:sortClassifier, Cs2, Cs4),
    sort(Cs3, Cs5),
    sort(Cs4, Cs5).

% Order of members does not matter
sortClassifier(datatype(CN), datatype(CN)).
sortClassifier(class(A, CN, X, Ms1), class(A, CN, X, Ms2)) :-
    sort(Ms1, Ms2).
