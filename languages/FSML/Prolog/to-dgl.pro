% Map FSM to DGL-like graph
fsmToDgl(Ss, (Ns, Es)) :-
  map(fsmStateToDgl, Ss, NEs),
  unzip(NEs, Ns, Ess),
  concat(Ess, Es).

% Map state of FSM
fsmStateToDgl(
  (Initial, Id, Ts),
  (
    (Id, Id, ellipse, Style),
    Es
  )
) :-
     ( Initial ->
           Style = [filled]
         ; Style = []
     ),
     map(fsmTransToDgl(Id), Ts, Es).

% Map transition of FSM
fsmTransToDgl(
  From,
  (Input, Action, To),
  (From, To, [Label])
) :-
     Action = [A] ->
         format(atom(Label), '~w/~w', [Input, A])
       ; Label = Input.
