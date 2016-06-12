% BEGIN ...
:- module(fsmlAbstract, []).

% END ...
% Mapping for states
state:(I1, N, Ts1) => (I2, N, Ts2) :-
  ( I1 == [] -> I2 = false; I2 = true ), % initial or not
  map(fsmlAbstract:mapTransition(N), Ts1, Ts2).
% ...
% BEGIN ...
% Lexical mapping for name
name:String => Atom :- name(Atom, String).
% END ...

% Make target state mandatory, resolve implicit state, if necessary
mapTransition(_, (I, A, [S]), (I, A, S)).
mapTransition(N, (I, A, []), (I, A, N)).
