% Simulation while ignoring output
acceptFsm(Fsm, Input) :-
  simulateFsm(Fsm, Input, _).

% Negation of acceptance
notAcceptFsm(Fsm, Input) :-
  not(acceptFsm(Fsm, Input)).

