% BEGIN ...
:- module(acceptBottomUp, []).

% END ... 
accept(Rules, Input) :-
  steps(Rules, [], Input). % Begin with empty stack

% Acceptance completed for start symbol on stack
steps(Rules, [n(Root)], []) :-
  Rules = [(_, Root, _)|_]. % Identify start symbol

% Shift terminal from input to stack
steps(Rules, Stack0, [T|Input0]) :-
  append(Stack0, [t(T)], Stack1), % Push input terminal onto the stack
  steps(Rules, Stack1, Input0). % Proceed with revised stack

% Reduce prefix on stack to nonterminal
steps(Rules, Stack0, Input) :-
  append(Stack1, Rhs, Stack0), % Remove a prefix from the stack
  member((_, N, Rhs), Rules), % Find the prefix as the RHS of a rule
  append(Stack1, [n(N)], Stack2), % Push LHS nonterminal onto the stack
  steps(Rules, Stack2, Input). % Proceed with revised stack
