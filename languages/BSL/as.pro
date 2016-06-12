% A signature consists of profiles (say, symbol types).
signature(Profiles) :-
  profiles(Profiles).

% Well-formedness of the list (set) of profiles 
profiles(Profiles) :-
  map(symbolOfProfile, Profiles, Symbols),
  is_set(Symbols),
  map(resultOfProfile, Profiles, ResultsList),
  list_to_set(ResultsList, ResultsSet),
  map(profile(ResultsSet), Profiles).

% The symbol of a profile
symbolOfProfile((Symbol, _, _), Symbol).

% The result sort of a profile
resultOfProfile((_, _, Result), Result).

% A profile consists of a symbol, argument sorts, and a result sort.
profile(Sorts, (Symbol, Arguments, _)) :-
  atom(Symbol),
  % An argument sort is also "defined" by some symbol.
  map(flip(member, Sorts), Arguments).
