% BEGIN ...
:- module(astToCst, []).

% END ...
% Insert leaf for terminal and proceed
(Rules, [t(T)|Symbols], ITrees) ~> [leaf(T)|ETrees] :-
  (Rules, Symbols, ITrees) ~> ETrees.

% Insert fork for nonterminal and proceed
(Rules, [n(N)|Symbols], [ITree|ITrees1]) ~> [fork(Rule, ETrees1)|ETrees2] :-
  ITree =.. [L|ITrees2],
  Rule = (L, N, Rhs),
  member(Rule, Rules), 
  (Rules, Rhs, ITrees2) ~> ETrees1,
  (Rules, Symbols, ITrees1) ~> ETrees2.

% Base case
(_, [], []) ~> [].

% Initiate mapping with start symbol
(Rules, ITree) ~> ETree :-
  Rules = [(_, Root, _)|_],
  (Rules, [n(Root)], [ITree]) ~> [ETree].
