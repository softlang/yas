% Meaning of constants
meaningExpr(
  _, % Program irrelevant
  intconst(I), % Syntactical phrase
  const(intval(I)) % Constant function on the environment
).

% Meaning of names
meaningExpr(
  _, % Program irrelevant
  arg(N), % Name
  lookup(N) % Lookup function on the environment
).

% Meaning of conditionals
meaningExpr(
  P, % Program to be passed on
  if(E1, E2, E3), % Syntactical phrase
  conditional( % Semantical conditional
    F1,
    meaningExpr(P, E2), % Lazy
    meaningExpr(P, E3)  % Lazy
  )
) :-
     meaningExpr(P, E1, F1).
 
% Meaning of operator applications
meaningExpr(
  P, % Program to be passed on
  binary(O, E1, E2), % Syntactical phrase
  operation(opVal(O), F1, F2)
) :-
     meaningExpr(P, E1, F1),
     meaningExpr(P, E2, F2).

% Meaning of function applications
meaningExpr(
  P, % Program to be passed on
  apply(N, Es), % Syntactical phrase
  application( % Function on environment
    Ns, % Names to be bound in argument
    Fs, % Meanings of arguments
    F % Meaning of definition
  )
) :-
     member((N, _, (Ns, E)), P),
     map(meaningExpr(P), Es, Fs),
     meaningExpr(P, E, F).
