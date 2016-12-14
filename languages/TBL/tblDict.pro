% BEGIN ...
% Map terms to dictionaries
:- module(tblDict, []).

% END ...
W1 => {class:world, persons:W2} :- map(tblDict:(=>), W1, W2).
(N, B) => {class:person, name:N, buddy:B}.
