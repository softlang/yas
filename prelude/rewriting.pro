% Identity strategy
id(X,X).

% Try S1; if it fails, try S2
choice(S1,S2,X,Y) :- 
  apply(S1,[X,Y]) ->
      true
    ; apply(S2,[X,Y]).

% Sequentially compose S1 and S2
seq(S1,S2,X,Z) :-
  apply(S1,[X,Y]),
  apply(S2,[Y,Z]).

% Try S but succeed anyway
try(S,X,Y) :- 
  choice(S,id,X,Y).

% Apply S exhaustively
repeat(S,X,Y) :-
  try(seq(S,repeat(S)),X,Y).

% Apply S to one immediate subterm 
one(S,X,Y) :-
  X =.. [F|LX],
  append(LX1, [EX|LX2], LX),
  apply(S, [EX,EY]),
  append(LX1, [EY|LX2], LY),
  Y =.. [F|LY].

% Apply S to all immediate subterms 
all(S,X,Y) :-
  X =.. [F|LX],
  map(S, LX, LY),
  Y =.. [F|LY].

% Apply S once in bottom-up order
oncebu(S,X,Y) :-
  choice(one(oncebu(S)), S, X, Y).

% Apply S everywhere in bottom-up order
fullbu(S,X,Y) :-
  seq(all(fullbu(S)), S, X, Y).

% Apply S everywhere in top-down order
fulltd(S,X,Y) :-
  seq(S, all(fulltd(S)), X, Y).

% Repeat oncebu exhaustively
innermost(S,X,Y) :- 
  repeat(oncebu(S),X,Y).

% Prepare argument of S by V, if necessary 
vary(V, S, X, Y) :-
  choice(S, seq(V, S), X, Y).
