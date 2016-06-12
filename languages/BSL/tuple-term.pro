% A term is pair of a symbol and a list of subterms.
tupleTerm((Symbol, Terms)) :-
  atom(Symbol),
  map(tupleTerm, Terms).
