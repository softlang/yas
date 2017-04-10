:- module(hinzuDump, []).

main(Ds) :-
  findall(
    D,
    hdeclaration(D),
    Ds).
