% BEGIN ...
:- module(elqqAbstract, []).
% END ...
X ~> Y :- elAbstract:'~>'(X, Y).
(metavar, (Char, String)) ~> Atom :- name(Atom, [Char|String]).
(metavar, String) ~> Atom :- is_list(String), name(Atom, [0'_|String]).

