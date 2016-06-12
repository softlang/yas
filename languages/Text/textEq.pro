% BEGIN ...
:- module(textEq, []).

% END ...
eq(X,Y) :-
  length(X, L1), length(Y, L2),
  % Ignore difference regarding final "newline"
  ( L1 == L2, X == Y 
  ; L1 is L2 + 1, append(Y, [C], X)
  ; L2 is L1 + 1, append(X, [C], Y) ),
  char_type(C, end_of_line).
