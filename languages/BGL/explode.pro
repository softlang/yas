% BEGIN ...
:- module(explode, []).

% END ...
% Map lists of trees; re-insert terminals and rules
(_, [], []) => [].
(Rules, [t(T)|Symbols], ITrees) => [leaf(T)|ETrees] :-
  (Rules, Symbols, ITrees) => ETrees.
(Rules, [n(N)|Symbols], [ITree|ITrees1]) => [fork(Rule, ETrees1)|ETrees2] :-
  ITree =.. [L|ITrees2],
  Rule = (L, N, Rhs),
  member(Rule, Rules), 
  (Rules, Rhs, ITrees2) => ETrees1,
  (Rules, Symbols, ITrees1) => ETrees2.

% Initiate mapping with start symbol
(Rules, ITree) => ETree :-
  Rules = [(_, Root, _)|_],
  (Rules, [n(Root)], [ITree]) => [ETree].
