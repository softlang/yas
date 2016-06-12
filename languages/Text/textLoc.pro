% BEGIN ...
:- module(textLoc, []).

% END ...
loc(Chars, LOC) :-
  filter(flip(char_type, newline), Chars, Newlines),
  length(Newlines, LOC).
