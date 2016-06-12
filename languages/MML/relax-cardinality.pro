% Turn all required members into optional members
relaxMm(MM1, MM2) :-
  topdownGraph(relaxOne, MM1, MM2).

% Cardinality-level helper
relaxOne(X, Y) :-
  lookup(class, X, one),
  update(class, option, X, Y).
