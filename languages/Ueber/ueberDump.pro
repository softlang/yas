:- module(ueberDump, []).

main(Ds) :-
  findall(
    D,
    udeclaration(D),
    Ds).
