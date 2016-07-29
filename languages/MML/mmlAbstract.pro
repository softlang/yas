% BEGIN ...
:- module(mmlAbstract, []).

% END ...
(name, String) ~> Atom :- name(Atom, String).
(abstract, abstract) ~> true.
(abstract, concrete) ~> false.
