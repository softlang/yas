# File _languages/BFPL/Prolog/denotational/combinators.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/denotational/combinators.pro)**
```
% Helper function for environment passing
passTo(X, F, V) :-
  apply(F, [X, V]).

% Apply a 'lazy' meaning in conditional
lazyApply(M, X, V) :-
  apply(M, [F]),
...
```
