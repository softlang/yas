:- op(1200, xfx, (&)).
:- op(500, fx, (#)).

% Well-formedness of graphs
graph(O) :- 
  graph(O, Defs, Uses1),
  set(Defs),
  list_to_set(Uses1, Uses2),
  subset(Uses2, Defs).

% A graph with an ID
graph(Id&D, [Id|Defs], Uses) :-
  atomic(Id),
  graph(D, Defs, Uses).

% A dictionary
graph(D, Defs, Uses) :-
  \+ D = (_&_),  
  dictToList(D, L),
  unzip(L, KL, VL),
  map(atom, KL), % type of keys
  set(KL), % uniqueness of keys
  map(divalue, VL, Defss, Usess),
  concat(Defss, Defs),
  concat(Usess, Uses).

% Single values
divalue(Value, Defs, Uses) :-
  single(Value, Defs, Uses).

% Lists
divalue(Value, Defs, Uses) :-
  map(single, Value, Defss, Usess),
  concat(Defss, Defs),
  concat(Usess, Uses).

% References
single(#Id, [], [Id]) :-
  atomic(Id).

% Numbers or atoms
single(Value, [], []) :-
  atomic(Value).

% Graphs
single(Value, Defs, Uses) :-
  \+ Value = (#_),
  \+ atomic(Value),
  graph(Value, Defs, Uses).
