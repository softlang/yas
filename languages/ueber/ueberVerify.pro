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
    languageTowardsBase(L, B),
    member(membership(B, Pred, Args), Ds),
    Pred =.. [Sym|_],
    \+ assume(
      ueberFFI:if(Sym, once(ueberFFI:invoke(Pred, Args, [L], [], [Content2], []))),
      'File ~w element of language ~w according to ~w: failed.', [F, B, Pred] ) ).

verify(Ds, notElementOf(F, L)) :- % ...
% BEGIN ...
  ueberIO:readFile(F, L, Content),
  \+ (
    member(membership(L, Pred, Args), Ds),
    Pred =.. [Sym|_],
    \+ assume(
      ueberFFI:if(Sym, \+ once(ueberFFI:invoke(Pred, Args, [L], [], [Content], []))),
      'File ~w element of language ~w according to ~w: succeeded.', [F, L, Pred] )
  ).
% END ...  

verify(Ds, mapsTo(R, InFs, OutFs)) :-
  ueberDispatch:overloads(Ds, R, InFs, OutFs, Overloads),
  Overloads = [_|_],
  map(ueberApply:apply(Ds, R, InFs, OutFs), Overloads).
