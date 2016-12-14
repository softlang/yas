% Turn string into list of singleton character atoms
bnlScanner(String1, L2) :-
  ( append(String2, [10], String1) -> true; String2 = String1 ),
  map(singleton, String2, L1),
  map(flip(atom_codes), L1, L2).

