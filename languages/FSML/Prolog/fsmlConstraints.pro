% BEGIN ...
:- module(fsmlConstraints, []).

% END ...
% Wellness of FSMs
ok(Fsm) :-
  distinctStateIds(Fsm),
  singleInitialState(Fsm),
  resolvableTargetStates(Fsm),
  deterministicTransitions(Fsm),
  reachableStates(Fsm).

% All state ids are distinct
distinctStateIds(Fsm) :- findall(Id, member((_, Id, _), Fsm), Ids), set(Ids).

% There is a single initial state
singleInitialState(Fsm) :- findall(_, member((true, _, _), Fsm), [_]).

% All state ids are resolvable to states
resolvableTargetStates(Fsm) :- \+ (
  member((_, _, Ts), Fsm),
  member((_, _, Id), Ts),
  \+ member((_, Id, _), Fsm)).

% Input is handled deterministically per state
deterministicTransitions(Fsm) :- \+ (
  member((_, _, Ts), Fsm),
  findall(I, member((I, _, _), Ts), Is),
  \+ set(Is)).

% All states are reachable from the initial state
reachableStates(Fsm) :- % ...
% BEGIN ...
  findall(
    Id,
    member((_, Id, _), Fsm),
    Ids),
  findall(
    Initial,
    member((true, Initial, _), Fsm),
    Initials),
  fixedPointIds(Fsm, Initials, Reachables),
  setEq(Ids, Reachables).

% Compute closure of state reachable
fixedPointIds(Fsm, Ids1, Ids4) :-
  findall(
    Id2,
    (
      member(Id1, Ids1),
      member((_, Id1, Ts), Fsm),
      member((_, _, Id2), Ts)
    ),
    Ids2),
  union(Ids1, Ids2, Ids3),
  ( \+ setEq(Ids1, Ids3) ->
        fixedPointIds(Fsm, Ids3, Ids4)
      ; Ids4 = Ids1
  ).
% END ...
