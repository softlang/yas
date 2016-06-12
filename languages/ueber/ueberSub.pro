% Map language to base language
languageToBase(text, text).
languageToBase(term, term).
languageToBase(prolog, prolog).
languageToBase(X, Z) :-
  X =.. [_,Y],
  languageToBase(Y, Z).

% Iterate language terms towards base
languageTowardsBase(L, L).
languageTowardsBase(L1, L2) :-
  L1 =.. [_,L3],
  languageTowardsBase(L3, L2).
