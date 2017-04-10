% BEGIN ...
:- module(ueberIO, []).
% END ...
readFile(F, L, Content) :-
  languageToBase(L, B),
  assume(
    exists_file(F),
    'File ~w: missing.', [F] ),
  ( B == text, readTextFile(F, Content)
  ; B == term, readTermFile(F, Content)
  ; B == json, readJSONFile(F, Content)
  ).

tryReadFile(F, L, Content2) :-
  readFile(F, L, Content1) ->
      Content2 = [Content1]
    ; Content2 = [].		     

writeFile(F, L, Content) :-
  languageToBase(L, B),
  ( B == text, writeTextFile(F, Content)
  ; B == term, writeTermFile(F, Content)
  ; B == json, writeJSONFile(F, Content)
  ).
