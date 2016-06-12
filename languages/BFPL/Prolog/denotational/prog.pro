:- module(bfplDenotational, []).

% Evaluate main expression of program
prog((Fs, E), V) :-
  meaningExpr(Fs, E, F),
  passTo([], F, V).
