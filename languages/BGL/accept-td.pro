% BEGIN ...
:- module(acceptTopDown, []).

% END ... 
accept(Rules, Input) :- 
    Rules = [(_, Root, _)|_], % Identify start symbol
    steps(Rules, [n(Root)], Input). % Begin with start symbol on stack

% Acceptance completed for empty stack and empty input
steps(_, [], []).

% Consume terminal at top of stack from input
steps(Rules, [t(T)|Stack], [T|Input]) :-
  steps(Rules, Stack, Input). % Proceed with revised stack and input

% Expand nonterminal at the top of stack
steps(Rules, [n(N)|Stack0], Input) :-
  member((_, N, Rhs), Rules), % Select an alternative with LHS N
  append(Rhs, Stack0, Stack1), % Add RHS to the stack
  steps(Rules, Stack1, Input). % Proceed with revised stack
