% BEGIN ...
:- module(tblGraph, []).

% END ...
% Map terms to graphs
W1 => {class:world, persons:W2} :-
  map(tblGraph:(=>), W1, W2).
(N, B) => {class:person, name:N, buddy:B}.
