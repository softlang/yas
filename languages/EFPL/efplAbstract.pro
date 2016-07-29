% BEGIN ...
:- module(efplAbstract, []).

% END ...
% Mapping for functions
(function, ([], (N, NS, E))) ~> (N, [], NS, E).  
(function, ([(N, T)], (N, NS, E))) ~> (N, [T], NS, E).
      
% Mapping for function types
(type, fun(T, [])) ~> T.
(type, fun(T1, [T2])) ~> fun(T1, T2).

% Mapping for type parts
(typepart, brackettype(T)) ~> T.
  
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
