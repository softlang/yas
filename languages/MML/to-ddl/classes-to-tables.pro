% Map classes to tables
classesToTables(Classifiers, Tables3) :-
  map(classToTable, Classifiers, Tabless1),
  concat(Tabless1, Tables1),
  map(multisToTables, Classifiers, Tabless2),
  concat(Tabless2, Tables2),
  append(Tables1, Tables2, Tables3).

