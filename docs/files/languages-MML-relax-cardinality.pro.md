# File _languages/MML/relax-cardinality.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/relax-cardinality.pro)**
```
% Turn all required members into optional members
relaxMm(MM1, MM2) :-
  topdownGraph(relaxOne, MM1, MM2).

% Cardinality-level helper
relaxOne(X, Y) :-
  lookup(class, X, one),
  update(class, option, X, Y).
```
