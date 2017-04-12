# File _languages/Ueber/ueberDump.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberDump.pro)**
```
:- module(ueberDump, []).

main(Ds) :-
  findall(
    D,
    udeclaration(D),
    Ds).
```
