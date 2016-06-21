% BEGIN ...
:- module(ueberVerify, []).
verify(_, language(_)).
verify(_, membership(_, _, _)).
verify(_, function(_, _, _, _, _)).
verify(_, equivalence(_, _, _)).
verify(_, normalization(_, _, _)).

% END ...
verify(Ds, elementOf(F, L)) :-
  ueberIO:readFile(F, L, Content1),
  ueberNorm:normalize(Ds, F, L, Content1, Content2),
  \+ (
     languageTowardsBase(L, L2),
     member(membership(L2, Pred, Args1), Ds),
     append(Args1, [Content2], Args2),
     \+ assume(
       once(apply(Pred, Args2)),
       'File ~w element of language ~w: failed.', [F, L2] ) ).

verify(Ds, notElementOf(F, L)) :- % ...
% BEGIN ...
  ueberIO:readFile(F, L, Content),
  \+ (
    member(membership(L, Pred, Args1), Ds),
    append(Args1, [Content], Args2),
    \+ assume(
      \+ once(apply(Pred, Args2)),
      'File ~w element of language ~w: succeeded.', [F, L] )
  ).
% END ...  

verify(Ds, mapsTo(R, InFs, OutFs)) :-
  ueberDispatch:overloads(Ds, R, InFs, OutFs, Overloads),
  Overloads = [_|_],
  map(ueberApply:apply(Ds, R, InFs, OutFs), Overloads).
