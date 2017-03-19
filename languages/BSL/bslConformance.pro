% BEGIN ...
:- module(bslConformance, []).
% END ...
termOfSort(Profiles, Term, Sort) :-
  Term =.. [Symbol|Terms],
  member((Symbol, Sorts, Sort), Profiles),
  map(bslConformance:termOfSort(Profiles), Terms, Sorts).
