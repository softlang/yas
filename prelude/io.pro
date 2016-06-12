readTextFile(File, Text) :-
  require(
    fileExpected(File),
    (exists_file(File), open(File, read, Input, []))
  ),
  read_stream_to_codes(Input, Text),
  close(Input).

readTermFile(File, Term) :-
  require(
    fileExpected(File),
    (exists_file(File), open(File, read, Input, []))
  ),
  require(
    fileWithPrologTermExpected(File),
    read(Input, Term)
  ),
  close(Input).

readPrologFile(File, Clauses) :-
  require(
    fileExpected(File),
    (exists_file(File), open(File, read, Input, []))
  ),
  require(
    fileWithPrologTermExpected(File),
    readClausesFromFile(Input, Clauses)
  ),
  close(Input).

readClausesFromFile(Input, Clauses) :-
  read(Input, T),
  ( T == end_of_file ->
        Clauses = []
      ; Clauses = [T|Clauses0],
        readClausesFromFile(Input, Clauses0)
  ).

writeTextFile(File, Text) :-
  open(File, write, Output, []),
  format(Output, '~s', [Text]),
  close(Output).

writeTermFile(File, Term) :-
  open(File, write, Output, []),
  format(Output, '~q.', [Term]),
  close(Output).

writePrologFile(File, Clauses) :-
  open(File, write, Output, []),
  map(writeClauseToFile(Output), Clauses),
  close(Output).

writeClauseToFile(Output, Clause) :-
  format(Output, '~q.~n', [Clause]).
