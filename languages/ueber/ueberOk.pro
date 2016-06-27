% BEGIN ...
:- module(ueberOk, []).
ok(_, language(L)) :-
  assume(
    languageToBase(L, _),
    'Language ~w: invalid base.', [L] ).

ok(Ds, D) :-
  ( D = membership(L, _, _)
  ; D = equivalence(L, _, _)
  ; D = normalization(L, _, _)),
  assumeLanguage(Ds, L).
% END ...

ok(Ds, elementOf(F, L)) :-
  assumeMembership(Ds, L),
  assumeBase(Ds, F, L).

ok(Ds, function(_, InLs, OutLs, _, _)) :-
  map(ueberOk:assumeLanguage(Ds), InLs),
  map(ueberOk:assumeLanguage(Ds), OutLs).

ok(Ds, mapsTo(R, InFs, OutFs)) :-
  assume(
    member(function(R, _, _, _, _), Ds),
    'Function ~w: missing.', [R] ),
  map(ueberOk:assumeFile(Ds), InFs),
  map(ueberOk:assumeFile(Ds), OutFs),
  assume(
    ueberDispatch:overloads(Ds, R, InFs, OutFs, [_|_]),
    'Overload ~w:(~w) -> (~w): missing.', [R, InFs, OutFs] ).
% ...
% BEGIN ...
ok(Ds, notElementOf(F, L)) :-
  assumeMembership(Ds, L),
  assumeBase(Ds, F, L),
  assumeFile(Ds, F).

assumeMembership(Ds, L) :-
  assumeLanguage(Ds, L),
  assume(
    member(membership(L, _, _), Ds),
    'Language ~w: membership test missing.', [L] ).

assumeLanguage(Ds, L) :-
  assume(
    member(language(L), Ds),
    'Language ~w: missing.', [L]).

assumeBase(Ds, F, L) :-
  assume(
    \+ ( languageToBase(L, B1),
         ( member(elementOf(F, L2), Ds)
         ; member(notElementOf(F, L2), Ds) ),
         languageToBase(L2, B2),
         \+ B1 == B2
    ),
    'File ~w: base language ambiguous.', [F] ).

assumeFile(Ds, F) :-
  assume(
    member(elementOf(F, _), Ds),
    'File ~w: language missing.', [F]).
% END ...
