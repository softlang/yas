% BEGIN ...
% Map terms to graphs
:- module(tblGraph, []).

% END ...
W1 => {class:world, persons:W2} :- map(tblGraph:(=>), W1, W2).
(N, B) => {class:person, name:N, buddy:B}.
