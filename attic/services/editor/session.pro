% Initialize session management
:- dynamic session/1.
:- dynamic state/3.
:- assertz(session(0)).

% Start a new session
newSession(S2) :-
  once((
    repeat,
    sleep(0.01),
    retract(session(S1)),
    S2 is S1 + 1,
    assertz(session(S2))
  )).

% Initialize session
initSession(S, MmName, M) :-
  \+ state(S, _, _),
  assertz(state(S, MmName, M)).

% Retrieve a session
retrieveSession(S, MmName, M) :-
  state(S, MmName, M).

% Update a session
updateSession(S, M) :-
  retract(state(S, MmName, _)), % TODO: Undo not supported
  assertz(state(S, MmName, M)).
