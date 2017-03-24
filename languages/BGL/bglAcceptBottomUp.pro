% BEGIN ...
:- module(bglAcceptBottomUp, []).

% END ...
% Begin with empty stack 
accept(G, I) :- steps(G, [], I).

% Acceptance start symbol on stack (LHS of first rule)
steps(G, [n(Root)], []) :- G = [(_, Root, _)|_].

% Shift terminal from input to stack
steps(G, Z, [T|I0]) :- steps(G, [t(T)|Z], I0).

% Reduce RHS on stack to nonterminal
steps(G, Z0, I) :-
  append(Z1, Z2, Z0), reverse(Z1, Rhs), member((_, N, Rhs), G), steps(G, [n(N)|Z2], I).
