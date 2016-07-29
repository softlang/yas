% BEGIN ...
:- module(ddlAbstract, []).

% END ...
% Poormen's separator lists
(table, (Name, [(Column, Columns)])) ~> (Name, [Column|Columns]).
% Lexical mapping for integers
(integer, Digits) ~> Int :- number_codes(Int, Digits).
% Lexical mapping for names
(name, (Char, String)) ~> Atom :- name(Atom, [Char|String]).
