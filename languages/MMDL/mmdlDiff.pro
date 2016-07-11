:- module(mmdlDiff, []).

diff(Cs1, Cs2, sequ(Ds)) :-
    classifiers(Cs1, Cs2, Ds).

% Nothing left to diff
classifiers([], [], []).

% Handle shared, identical classifiers
classifiers(Cs1, Cs2, Ds) :-
    append(Cs1a, [C|Cs1b], Cs1),
    append(Cs2a, [C|Cs2b], Cs2),
    append(Cs1a, Cs1b, Cs3),
    append(Cs2a, Cs2b, Cs4),
    classifiers(Cs3, Cs4, Ds).

% Handle classifiers with the same name but with differences
classifiers(Cs1, Cs2, Ds3) :-
    append(Cs1a, [C1|Cs1b], Cs1),
    append(Cs2a, [C2|Cs2b], Cs2),
    \+ C1 == C2,
    classifierToName(C1, N),
    classifierToName(C2, N),
    ( classifier(C1, C2, Ds1) ->
	  true;
      Ds1 = [
		   removeClassifier(C1),
		   addClassifier(C2) ] ),
    append(Cs1a, Cs1b, Cs3),
    append(Cs2a, Cs2b, Cs4),
    classifiers(Cs3, Cs4, Ds2),
    append(Ds1, Ds2, Ds3).

% Handle additional classifier on the left
classifiers([C1|Cs1], Cs2, [removeClassifier(C1)|Ds]) :-
    classifierToName(C1, N),
    \+ ( append(_, [C2|_], Cs2),
         classifierToName(C2, N) ),
    classifiers(Cs1, Cs2, Ds).

% Handle additional classifier on the right
classifiers(Cs1, [C2|Cs2], [addClassifier(C2)|Ds]) :-
    classifierToName(C2, N),
    \+ ( append(_, [C1|_], Cs1),
         classifierToName(C1, N) ),
    classifiers(Cs1, Cs2, Ds).

% Handle classifiers with the same name
classifier(class(A, N, X, Ms1), class(A, N, X, Ms2), Ds) :-
    members(N, Ms1, Ms2, Ds).

% Nothing left to diff
members(_, [], [], []).

% Handle shared, identical members
members(CN, Ms1, Ms2, Ds) :-
    append(Ms1a, [M|Ms1b], Ms1),
    append(Ms2a, [M|Ms2b], Ms2),
    append(Ms1a, Ms1b, Ms3),
    append(Ms2a, Ms2b, Ms4),
    members(CN, Ms3, Ms4, Ds).

% Handle members with the same name but with differences
members(CN, Ms1, Ms2, Ds3) :-
    append(Ms1a, [M1|Ms1b], Ms1),
    append(Ms2a, [M2|Ms2b], Ms2),
    \+ M1 == M2,
    M1 = (_, N, _, _),
    M2 = (_, N, _, _),
    Ds1 = [
	removeMember(CN, M1),
	addMember(M2) ],
    append(Ms1a, Ms1b, Ms3),
    append(Ms2a, Ms2b, Ms4),
    members(Ms3, Ms4, Ds2),
    append(Ds1, Ds2, Ds3).

% Handle additional member on the left
members(CN, [M1|Ms1], Ms2, [removeMember(CN, M1)|Ds]) :-
    M1 = (_, MN, _, _),
    \+ ( append(_, [M2|_], Ms2),
         M2 = (_, MN, _, _) ),
    members(Ms1, Ms2, Ds).

% Handle additional member on the right
members(CN, Ms1, [M2|Ms2], [addMember(CN, M2)|Ds]) :-
    M2 = (_, MN, _, _),
    \+ ( append(_, [M1|_], Ms1),
         M1 = (_, MN, _, _) ),
    members(CN, Ms1, Ms2, Ds).

classifierToName(class(_, N, _, _), N).
classifierToName(datatype(N), N).
