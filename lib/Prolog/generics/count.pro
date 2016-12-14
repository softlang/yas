count(T, N) :-
  ground(T), 
  T =.. [_|Ts],
  map(count, Ts, Ns),
  foldr(add, 1, Ns, N).
