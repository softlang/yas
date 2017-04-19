:- module(ueberDump, []).

main(Dump) :-
  findall(
    (Decl, Dir),
    udeclaration(Decl, Dir),
    Dump).
