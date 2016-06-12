:- module(mmTransform, []).

transform(renameClassifier(N1, N2), M1, M2) :-
  mmRenameClassifier:transform(N1, N2, M1, M2).
transform(renameMember(N1, N2, N3), M1, M2) :-
  mmRenameMember:transform(N1, N2, N3, M1, M2).
transform(partToReference(N1, N2), M1, M2) :-
  mmPartToReference:transform(N1, N2, M1, M2).
transform(valueToReference(N1, N2, N3, N4), M1, M2) :-
  mmValueToReference:transform(N1, N2, N3, N4, M1, M2).
