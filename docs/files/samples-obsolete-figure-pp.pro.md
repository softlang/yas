# File _samples/obsolete/figure/pp.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/figure/pp.pro)**
```
% Pretty print figures with one line per element
figurePp(F, vlist(Bs)) :-
  map(ppElement, F, Bs).

% End each element by a semicolon
ppElement(E, hbox(B, text(';'))) :-
  ppElement_(E, B).
...
```
