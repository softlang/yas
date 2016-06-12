include(Rel) :-
  ueber(elementOf(Rel, ueber(term))),
  ueber_absolute(Rel, Abs),
  exists_file(Abs) -> 
      open(Abs, read, Input, []),
      read(Input, Term),
      ueber(Term)
    ; true.
