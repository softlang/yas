% BEGIN ...
:- module(bglParseTopDown, []).
% END ...
parse(G, I, Tree) :-
  G = [(_, Z, _)|_], % Pick start symbol
  tree(G, n(Z), Tree, I, []).

% Consume terminal at top of stack from input
tree(_, t(T), leaf(T), [T|I], I).

% Expand a nonterminal; try different alternatives
tree(G, n(N), fork(Rule, Trees), I0, I1) :-
  member(Rule, G),
  Rule = (_, N, Rhs),
  trees(G, Rhs, Trees, I0, I1).
  
% Parse symbol by symbol, sequentially
trees(_, [], [], I, I).
trees(G, [Symbol|Symbols], [Tree|Trees], I0, I2) :-
  tree(G, Symbol, Tree, I0, I1),
  trees(G, Symbols, Trees, I1, I2).
