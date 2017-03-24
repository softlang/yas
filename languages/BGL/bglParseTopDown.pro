% BEGIN ...
:- module(bglParseTopDown, []).
% END ...
% Start parsing from start symbol (LHS of first rule)
parse(G, I, T) :- G = [(_, N, _)|_], tree(G, n(N), T, I, []).

% Consume terminal at top of stack from input
tree(_, t(T), leaf(T), [T|I], I).

% Expand a nonterminal; try different alternatives
tree(G, n(N), fork(R, Ts), I0, I1) :-
  member(R, G),
  R = (_, N, Rhs),
  trees(G, Rhs, Ts, I0, I1).
  
% Parse symbol by symbol, sequentially
trees(_, [], [], I, I).
trees(G, [S|Ss], [T|Ts], I0, I2) :- tree(G, S, T, I0, I1), trees(G, Ss, Ts, I1, I2).
