forall(L1, P) :-
  findall(Y, (member(X, L1), Y =.. [P, X]), L2),
  ueber(L2). 
