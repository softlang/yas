mmlChecker(MmFile, Model) :-
  readTermFile(MmFile, Mm),
  conforms(Model, Mm).
