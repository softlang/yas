% Sequential (left-to-right) composition
sequ(S1,S2,X,Z) :-
  apply(S1,[X,Y]),
  apply(S2,[Y,Z]).

% Left-biased choice
choice(S1,S2,X,Y) :- 
  apply(S1,[X,Y]) ->
      true
    ; apply(S2,[X,Y]).

% Transform all immediate children
all(S,X,Y) :-
  X =.. [F|LX],
  map(S, LX, LY),
  Y =.. [F|LY].

% Transform one immediate child
one(S,X,Y) :-
  X =.. [F|LX],
  append(LX1, [EX|LX2], LX),
  apply(S, [EX,EY]),
  append(LX1, [EY|LX2], LY),
  Y =.. [F|LY].
