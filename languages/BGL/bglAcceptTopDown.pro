% BEGIN ...
:- module(bglAcceptTopDown, []).
% END ... 
accept(G, I) :- 
    G = [(_, N, _)|_], % Pick start symbol    
    steps(G, [n(N)], I).

% Acceptance succeeds (empty stack; all input consumed)
steps(_, [], []).

% Consume terminal at top of stack from input
steps(G, [t(T)|Z], [T|I]) :-
  steps(G, Z, I). % Proceed with revised stack and input

% Expand a nonterminal; try different alternatives
steps(G, [n(N)|Z0], I) :-
  member((_, N, Rhs), G), % Select an alternative with LHS N
  append(Rhs, Z0, Z1), % Add RHS to the stack
  steps(G, Z1, I). % Proceed with revised stack
