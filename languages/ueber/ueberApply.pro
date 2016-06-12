% BEGIN ...
:- module(ueberApply, []).
% Semantics of function application
% END ...
apply(Ds, R, InFs, OutFs, (Pred1, Args1)) :-
  % Add extra arguments to predicate
  Pred1 =.. [Sym|Args2],
  append(Args2, Args1, Args3),
  Pred2 =.. [Sym|Args3],
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
  append(InArgs2, Actual, InOutArgs),
  assume(
    once(apply(Pred2, InOutArgs)),
    'Overload ~w#~w(~w)->(~w): failed.',
    [R, Pred1, InFs, OutFs] ),
  % Compare expected and actual results 
  map(ueberEq:compare(Ds), OutFs, OutLs, Expected, Actual).
