% BEGIN ...
:- module(bfplProg, []).
% END ...
% Wellness of collection of function declarations
ok((Fs, E)) :-
  map(bfplProg:toFunName, Fs, Ns),
  set(Ns),
  map(bfplProg:ok(Fs), Fs),
  bfplExpr:ok(Fs, [], E, _).

% Wellness of function declarations
ok(P, (_, (Ts, T), (Ns, E))) :-
  set(Ns),
  zip(Ns, Ts, X),
  bfplExpr:ok(P, X, E, T).

% Extract function name
toFunName((N, _, _), N).
