% BEGIN ...
:- module(bglAcceptBottomUp, []).

% END ... 
accept(Rules, Input) :-
  steps(Rules, [], Input). % Begin with empty stack

% Acceptance completed for start symbol on stack
steps(Rules, [n(Root)], []) :-
  Rules = [(_, Root, _)|_]. % Identify start symbol

% Shift terminal from input to stack
steps(Rules, Stack, [T|Input0]) :-
  steps(Rules, [t(T)|Stack], Input0). % Proceed with revised stack

% Reduce prefix on stack to nonterminal
steps(Rules, Stack0, Input) :-
  append(RhsRev, Stack1, Stack0), % Remove a prefix from the stack
  reverse(RhsRev, Rhs),  
  member((_, N, Rhs), Rules), % Find the prefix as the RHS of a rule
  steps(Rules, [n(N)|Stack1], Input). % Proceed with revised stack
