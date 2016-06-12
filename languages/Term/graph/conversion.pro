% Conversion of dictionaries into lists
graphToList(_&D, L) :-
  dictToList(D, L).
graphToList(D, L) :-
  dictToList(D, L).

% Conversion returning inverse direction
graphToList(Id&D, L, listToGraph_(Id)) :-
  dictToList(D, L).
graphToList(D, L, listToDict) :-
  dictToList(D, L).

% Construct object from dictionary and ID
listToGraph_(Id, L, Id&D) :-
  listToDict(L, D).
 
% The conversion is (nearly) bi-directional
listToGraph(L, D) :-
  dictToList(D, L).
