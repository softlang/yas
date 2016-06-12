% MML strings are Prolog atoms
mml2pro(N1, N2) :- N1 = string -> N2 = atom; N2 = N1.

