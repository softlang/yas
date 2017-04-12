# File _languages/Ueber/ueberApply.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberApply.pro)**
```
% BEGIN ...
:- module(ueberApply, []).
% Semantics of function application
% END ...
apply(Ds, R, InFs, OutFs, (Pred, Args)) :-
  Pred =.. [Sym|_],
  % Determine languages of files and read them in
...
```
