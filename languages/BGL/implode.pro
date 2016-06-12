% BEGIN ...
:- module(implode, []).

% END ...
% Map rule label to function symbol
fork((L, _, _), ETrees) => ITree :-
  ETrees => ITrees,
  ITree =.. [L|ITrees].

% Map lists of trees; do not map terminals
[] => [].
[leaf(_)|ETrees] => ITrees :- ETrees => ITrees.
[ETree|ETrees] => [ITree|ITrees] :- ETree => ITree, ETrees => ITrees.
