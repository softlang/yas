% "Undeclare"
undeclare([], Ps, Ps, Sto, Sto).  
undeclare([D|Ds], Ps1, Ps3, Sto1, Sto3) :-  
  undeclare(D, Ps1, Ps2, Sto1, Sto2),
  undeclare(Ds, Ps2, Ps3, Sto2, Sto3).

% Undeclare a variable
undeclare(var(X, _), Ps, Ps, Sto1, Sto2) :-
  remove1st(X, Sto1, Sto2).

% Undeclare a procedure
undeclare(proc(X, _), Ps1, Ps2, Sto, Sto) :-
  remove1st(X, Ps1, Ps2).
