% BEGIN ...
:- module(biplSmallstep, []).
% END ...
% Begin with an empty store if no store is provided
allSteps(S, Sto) :-
  allSteps(S, [], Sto).

% Reflexive case
allSteps(S, Sto, Sto) :-
  biplNormal:normal(S).

% Transitive case
allSteps(S1, Sto1, Sto3) :-
  biplStep:step((S1, Sto1), (S2, Sto2)),
  allSteps(S2, Sto2, Sto3).
