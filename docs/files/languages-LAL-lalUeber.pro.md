# File _languages/LAL/lalUeber.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalUeber.pro)**
```
% BEGIN ...
:- module(lalUeber, []).
% END ...
% Map LAL specification to Ueber declarations
translate(Lals, C, Ues) :-
    map(lalUeber:entry(Lals, C), C, Uess),
    concat(Uess, Ues).
...
```
