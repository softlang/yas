% BEGIN ...
:- module(hinzuLanguage, []).
% END ...

main(Hinzu, Md1, Md2) :-
  member(l(Is), Hinzu),
  member(lid(L), Is),
  (
    member(acronym(N1), Is),
    member(expansion(N2), Is),
    atomic_list_concat([N1, ' ', '(', N2, ')'], N)
  ; 
    member(name(N), Is)
  ),
  member(explanation(X), Is),
  page(L, N, X, inplace, Md1),
  page(L, N, X, docs, Md2).

page(L, N, X, W, Md) :-
  with_output_to(
	  codes(Md),
	  format('# ~w~n~w~n## Language elements~n~@', [N, X, elements(W, L)])).

elements(W, L) :-
    findall(R, (
		hdeclaration(r(Is)),
		member(rid(R), Is),
		member(representationOf(L), Is)),
	    Rs),
    findall(FN, (
		udeclaration(elementOf(FN, R)),
		member(R, Rs)),
	    FNs),
    maplist(fnitem(W), FNs).

fnitem(_, FN) :-
    format('* [~w](../../~w)~n', [FN, FN]).
