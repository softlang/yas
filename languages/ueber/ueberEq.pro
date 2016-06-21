% BEGIN ...
:- module(ueberEq, []).
% END ...
compare(Ds, F, L, Expected1, Actual1) :-
  ueberNorm:normalize(Ds, F, L, Actual1, Actual2),
  ( Expected1 = [Expected2] ->
      once((
          languageTowardsBase(L, L2),
          member(equivalence(L2, Pred, Args1), Ds)
        ; Pred = (==), Args1 = []
      )),
      append(Args1, [Expected2, Actual2], Args2),
      once((
          apply(Pred, Args2)
        ; assume(
            (mode(override), ueberIO:writeFile(F, L, Actual2)),
            'Baseline ~w: disagreeing.', [F] )
      ))
    ; assume(
        (mode(create), ueberIO:writeFile(F, L, Actual2)),
        'Baseline ~w: missing.', [F] ) ).
