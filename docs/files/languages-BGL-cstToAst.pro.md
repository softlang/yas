# File _languages/BGL/cstToAst.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/cstToAst.pro)**
```
% BEGIN ...
:- module(cstToAst, []).

% END ...
% Map rule label to function symbol
fork((L, _, _), ETrees) ~> ITree :-
  ETrees ~> ITrees,
  ITree =.. [L|ITrees].

% Map lists of trees; do not map terminals
[] ~> [].
[leaf(_)|ETrees] ~> ITrees :- ETrees ~> ITrees.
[ETree|ETrees] ~> [ITree|ITrees] :- ETree ~> ITree, ETrees ~> ITrees.
```
