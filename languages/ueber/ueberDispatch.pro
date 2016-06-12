% BEGIN ...
:- module(ueberDispatch, []).
% END ...
overloads(Ds, R, InFs, OutFs, Overloads2) :-
  findall( (Pred, Args, InLs, OutLs), (
      member(function(R, InLs, OutLs, Pred, Args), Ds),
      map(ueberDispatch:inferredLanguage(Ds), InFs, InLs),
      map(ueberDispatch:inferredLanguage(Ds), OutFs, OutLs) ),
    Overloads1 ),
  findall( (Pred1, Args1), (
      member((Pred1, Args1, InLs1, OutLs1), Overloads1),
      \+ (
          member((Pred2, Args2, InLs2, OutLs2), Overloads1),
	  \+ (InLs1, OutLs1) == (InLs2, OutLs2),
	  map(languageTowardsBase, InLs2, InLs1),
	  map(languageTowardsBase, OutLs2, OutLs1) )),
    Overloads2 ).
  
% A file's language as declared
declaredLanguage(Ds, F, L) :-
  member(elementOf(F, L), Ds).

% A file's language as inferred
inferredLanguage(Ds, F, L2) :-
  declaredLanguage(Ds, F, L1),
  languageTowardsBase(L1, L2).
