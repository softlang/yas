% BEGIN ...
% Map terms to dictionaries
:- module(blToTbl, []).

% END ...
W1 => {class:world, persons:W2} :- map(blToTbl:(=>), W1, W2).
(N, B) => {class:person, name:N, buddy:B}.
