% BEGIN ...
:- module(fsmlAbstract, []).

% END ...
% Mapping for states
(state, (I1, N, Ts1)) ~> (I2, N, Ts2) :-
  ( I1 == [] -> I2 = false; I2 = true ), % initial or not
  map(fsmlAbstract:mapTransition(N), Ts1, Ts2).
% ...
% BEGIN ...
% Lexical mapping for names
(name, String) ~> Atom :- name(Atom, String).
% END ...

% Make target state mandatory, resolve implicit state, if necessary
mapTransition(_, (E, A, [S]), (E, A, S)).
mapTransition(N, (E, A, []), (E, A, N)).
