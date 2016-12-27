% BEGIN ...
:- module(bglAcceptBottomUp, []).

% END ... 
accept(G, I) :-
  steps(G, [], I). % Begin with empty stack

% Acceptance completed for start symbol on stack
steps(G, [n(Root)], []) :-
  G = [(_, Root, _)|_]. % Identify start symbol

% Shift terminal from input to stack
steps(G, Z, [T|I0]) :-
  steps(G, [t(T)|Z], I0). % Proceed with revised stack

% Reduce prefix on stack to nonterminal
steps(G, Z0, I) :-
  append(RhsRev, Z1, Z0), % Remove a prefix from the stack
  reverse(RhsRev, Rhs),  
  member((_, N, Rhs), G), % Find the prefix as the RHS of a rule
  steps(G, [n(N)|Z1], I). % Proceed with revised stack
