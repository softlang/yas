% BEGIN ...
:- module(bfplAbstract, []).

% END ...
% Mapping for functions
(function, ((N, (Ts, T)), (N, Ns, E))) ~> (N, (Ts, T), (Ns, E)).

% Mapping for function types
(funtype, (T1, Ts1)) ~> ([T1|Ts2], T2) :-
  append(Ts2, [T2], Ts1).

% Eliminate layering in expressions
(expr, subexpr(E)) ~> E.

% Eliminate brackets in expressions
(subexpr, brackets(E)) ~> E.

% Lexical mapping for integer
(integer, Digits) ~> Int :-
  number_codes(Int, Digits).

% Lexical mapping for name
(name, (Char, String)) ~> Atom :-
  name(Atom, [Char|String]).
