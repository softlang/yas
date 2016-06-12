% BEGIN ...
:- module(parseTopDown, []).

% END ...
parse(Rules, Input, Tree) :-
  Rules = [(_, Root, _)|_],
  tree(Rules, n(Root), Tree, Input, []).

% Consume terminal at top of stack from input
tree(_, t(T), leaf(T), [T|Input], Input).

% Expand nonterminal at the top of stack
tree(Rules, n(N), fork(Rule, Trees), Input0, Input1) :-
  member(Rule, Rules),
  Rule = (_, N, Rhs),
  trees(Rules, Rhs, Trees, Input0, Input1).
  
% Parsing completed for empty stack
trees(_, [], [], Input, Input).

% Parse symbol by symbol
trees(Rules, [Symbol|Symbols], [Tree|Trees], Input0, Input2) :-
  tree(Rules, Symbol, Tree, Input0, Input1),
  trees(Rules, Symbols, Trees, Input1, Input2).
