% BEGIN ...
:- module(elAbstract, []).

% END ...
% Adjust argument order of binary expressions
expr:binary(E1, Bop, E2) => binary(Bop, E1, E2).
% Lexical mapping for integer
integer:Digits => Int :- number_codes(Int, Digits).
% Lexical mapping for string
name:(Char, String) => Atom :- name(Atom, [Char|String]).
