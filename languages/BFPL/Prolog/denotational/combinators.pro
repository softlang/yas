% Helper function for environment passing
passTo(X, F, V) :-
  apply(F, [X, V]).

% Apply a 'lazy' meaning in conditional
lazyApply(M, X, V) :-
  apply(M, [F]),
  passTo(X, F, V).

% Lookup function on lists of pairs
lookup(N, X, V) :-
  once(member((N, V), X)).

% Semantical conditional
conditional(F0, M1, M2, X, V) :-
  passTo(X, F0, B),
  ( B == boolval(true), 
    lazyApply(M1, X, V)
  ; B == boolval(false),
    lazyApply(M2, X, V)
  ).

% Operation application on environments
operation(O, F1, F2, X, V0) :-
  passTo(X, F1, V1),
  passTo(X, F2, V2),
  apply(O, [V1, V2, V0]).
 
% Function application on environments
application(
  Ns, % Names to be bound in argument
  Fs, % Meanings of arguments
  F, % Meaning of function definition
  X1, % Environment
  V % Result
) :-
     map(passTo(X1), Fs, Vs),
     zip(Ns, Vs, X2),
     passTo(X2, F, V).
