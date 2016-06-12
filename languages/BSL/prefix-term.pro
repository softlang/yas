% A term consists of a symbol and a list of subterms.
prefixTerm(Term) :-
  Term =.. [Symbol|Terms],
  atom(Symbol),
  map(prefixTerm, Terms).
