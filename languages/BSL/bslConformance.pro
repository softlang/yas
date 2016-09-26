% BEGIN ...
:- module(bslConformance, []).
% END ...
termOfSort(Profiles, Term, Sort) :-
  Term =.. [Symbol|Terms],
  member((Symbol, Arguments, Sort), Profiles),
  map(bslConformance:termOfSort(Profiles), Terms, Arguments).
