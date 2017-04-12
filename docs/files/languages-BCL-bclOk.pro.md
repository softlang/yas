# File _languages/BCL/bclOk.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BCL/bclOk.pro)**
```
% BEGIN ...
:- module(bclOk, []).

main(F, T) :-
    readTermFile(F, G),
    conformsTo(T, G).
% END ...
...
```
