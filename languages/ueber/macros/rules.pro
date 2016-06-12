% Derive syntax of RL instance from a given syntax
rl(Dir) :-
  atom_concat(Dir, '/cs.term', Cs), 
  atom_concat(Dir, '/ls.term', Ls), 
  atom_concat(Dir, '/as.term', As), 
  ueber(mapsTo(rlDerive,
    [Cs, Ls, As],
    ['cs.term', 'ls.term', 'as.term']
  )).

% Process a rule file
rules(RulesFile) :-
  ueber(macro(parseFile(RulesFile))),
  file_name_extension(Base, _, RulesFile),
  file_name_extension(Base, config, ConfigFile),
  file_name_extension(Base, term, TermFile),
  file_name_extension(Base, pro, PrologFile),
  ueber(elementOf(ConfigFile, term)),
  ueber(elementOf(PrologFile, prolog)),
  ueber(mapsTo(rlToPro, [ConfigFile, TermFile], [PrologFile])).
