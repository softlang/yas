% BEGIN ...
:- module(ueberApply, []).
% Semantics of function application
% END ...
apply(Ds, R, InFs, OutFs, (Pred, Args)) :-
  Pred =.. [Sym|_],
  % Determine languages of files and read them in
  map(ueberDispatch:declaredLanguage(Ds), InFs, InLs),
  map(ueberDispatch:declaredLanguage(Ds), OutFs, OutLs),
  map(ueberIO:readFile, InFs, InLs, InArgs1),
  map(ueberIO:tryReadFile, OutFs, OutLs, Expected),
  % Normalize function arguments
  map(ueberNorm:normalize(Ds), InFs, InLs, InArgs1, InArgs2),
  % Create variables for actual result
  length(Expected, Len),
  length(Actual, Len),
  % Apply predicate
  ueberFFI:if(
    Sym,
    (
      assume(
        once(ueberFFI:invoke(Pred, Args, InLs, OutLs, InArgs2, Actual)),
        'Overload ~w#~w(~w)->(~w): failed.',
        [R, Pred, InFs, OutFs] ),
      % Compare expected and actual results 
      map(ueberEq:compare(Ds), OutFs, OutLs, Expected, Actual)
    )
  ).
