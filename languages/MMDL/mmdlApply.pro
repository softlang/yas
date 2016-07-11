:- module(mmdlApply, []).

apply(sequ([]), Mm, Mm).
apply(sequ([D|Ds]), Mm1, Mm3) :-
    apply(D, Mm1, Mm2),
    apply(sequ(Ds), Mm2, Mm3).
apply(removeClassifier(C), Cs1, Cs2) :-
    append(Cs1a, [C|Cs1b], Cs1),
    append(Cs1a, Cs1b, Cs2).
apply(removeMember(CN, M), Cs1, Cs2) :-
    append(Cs1a, [C1|Cs1b], Cs1),
    C1 = class(A, CN, X, Ms1),
    append(Ms1a, [M|Ms1b], Ms1),
    append(Ms1a, Ms1b, Ms2),
    C2 = class(A, CN, X, Ms2),
    append(Cs1a, [C2|Cs1b], Cs2).
apply(addClassifier(C), Cs1, Cs2) :-
    append(Cs1, [C], Cs2).
apply(addMember(CN, M), Cs1, Cs2) :-
    append(Cs1a, [C1|Cs1b], Cs1),
    C1 = class(A, CN, X, Ms1),
    append(Ms1, [M], Ms2),
    C2 = class(A, CN, X, Ms2),
    append(Cs1a, [C2|Cs1b], Cs2).
