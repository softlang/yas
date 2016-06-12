% BEGIN ...
:- module(rlAbstract, []).

% END ...
% Lexical mapping for pattern variables
rlvar:(Char, String) => rlvar(Atom) :-
  name(Atom, [Char|String]).
