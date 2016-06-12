:- module(ueberDump, []).

dump(Ds) :-
  findall(
    D,
    declaration(D),
    Ds).
