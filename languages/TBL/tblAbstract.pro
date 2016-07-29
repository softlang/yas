% BEGIN ...
:- module(tblAbstract, []).

% END ...
% Map strings to better primitive types
(integer, Digits) ~> Int :- number_codes(Int, Digits).
(name, String) ~> Atom :- name(Atom, String).
