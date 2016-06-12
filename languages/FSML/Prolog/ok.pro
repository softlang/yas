% BEGIN ...
:- module(fsmlOk, []).

% END ...
% Wellness of FSMs
ok(Fsm) :-
  singleInitial(Fsm),
  distinctIds(Fsm),
  resolvable(Fsm),
  deterministic(Fsm),
  reachable(Fsm).

% There is a single initial state
singleInitial(Fsm) :- findall(_, member((true, _, _), Fsm), [_]).

% All state ids are distinct
distinctIds(Fsm) :- findall(Id, member((_, Id, _), Fsm), Ids), set(Ids).

% All state ids are resolvable to states
resolvable(Fsm) :- \+ (
  member((_, _, Ts), Fsm),
  member((_, _, Id), Ts),
  \+ member((_, Id, _), Fsm)).

% Input is handled deterministically per state
deterministic(Fsm) :- \+ (
  member((_, _, Ts), Fsm),
  findall(I, member((I, _, _), Ts), Is),
  \+ set(Is)).

% All states are reachable from the initial state
reachable(Fsm) :- % ...
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
