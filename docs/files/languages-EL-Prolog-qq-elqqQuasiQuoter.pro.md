# File _languages/EL/Prolog/qq/elqqQuasiQuoter.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/elqqQuasiQuoter.pro)**
```
% BEGIN ...
:- module(elqqQuasiQuoter, [el/4]).
% END ...
% The quasi-quotation predicate for EL(QQ)
el(Content, _Vars, _Dict, Term) :-
   phrase_from_quasi_quotation(elqqQuasiQuoter:expr(Term), Content).

...
```
