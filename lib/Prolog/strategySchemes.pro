% Full top-down traversal
fulltd(S,X,Y) :-
  sequ(S, all(fulltd(S)), X, Y).

% Full bottom-up traversal
fullbu(S,X,Y) :-
  sequ(all(fullbu(S)), S, X, Y).

% Single hit bottom-up traversal
oncebu(S,X,Y) :-
  choice(one(oncebu(S)), S, X, Y).

% Top-down traversal with cut-off at successfull subtrees
stoptd(S,X,Y) :-
  choice(S, all(stoptd(S)), X, Y).

% Innermost normalization
innermost(S,X,Y) :- 
  repeat(oncebu(S),X,Y).

% Repeat strategy until it fails
repeat(S,X,Y) :-
  try(sequ(S,repeat(S)),X,Y).

% Try strategy; behave as identity in case of failure
try(S,X,Y) :- 
  choice(S,(=),X,Y).

% Try strategy; try additional preprocessor in case of failure
vary(V, S, X, Y) :-
  choice(S, sequ(V, S), X, Y).
