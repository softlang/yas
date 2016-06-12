% BEGIN ...
:- module(bfplSmallstep, []).
% END ...
% Evaluate main expression of program
allSteps((Fs, E1), E2) :-
  allSteps(Fs, E1, E2).

% Reflexive case
allSteps(_, E, E) :-
  bfplNormal:normal(E).

% Transitive case
allSteps(Fs, E1, E3) :-
  bfplStep:step(Fs, E1, E2),
  allSteps(Fs, E2, E3).
