% BEGIN ...
:- module(eslAbstract, []).

% END ...
(typeexpr, (T1, C)) ~> T2 :-
  eslCardinality(T1, C, T2).

(factor, tuple(T, Ts)) ~> tuple([T|Ts]).

(name, String) ~> Atom :- name(Atom, String).

(typeexprs, (X, Y)) ~> [X|Y].

(_, type(N, [T])) ~> type(N, T).
(_, type(N, Ts)) ~> type(N, tuple(Ts)) :- Ts = [_|_].

(_, symbol(N1, [], N2)) ~> symbol(N1, [], N2).
(_, symbol(N1, [Args], N2)) ~> symbol(N1, Args, N2).

% Helper for mapping of cardinalities
eslCardinality(T, none, T).
eslCardinality(T1, star(C), T2) :-
  eslCardinality(star(T1), C, T2).
eslCardinality(T1, plus(C), T2) :-
  eslCardinality(plus(T1), C, T2).
eslCardinality(T1, option(C), T2) :-
  eslCardinality(option(T1), C, T2).
