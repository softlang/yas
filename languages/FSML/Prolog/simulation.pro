% Simulate FSM for given input to compute output
simulateFsm(
  Fsm,
  Input,
  Output
) :-
     member((true, Id, _), Fsm), % Select initial state
     simulateFsm_(Fsm, Id, Input, Output).

% All input was processed
simulateFsm_(_, _, [], []).

% Apply transition for input at hand
simulateFsm_(Fsm, Id1, [Input|Inputs], [(Action, Id2)|Outputs]) :-
  member((_, Id1, Ts), Fsm),
  member((Input, Action, Id2), Ts),
  simulateFsm_(Fsm, Id2, Inputs, Outputs).
