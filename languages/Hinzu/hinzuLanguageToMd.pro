:- module(hinzuLanguageToMd, []).

main(Hinzu, Md1, Md2) :-
  member(l(Is), Hinzu),
  member(lid(L), Is),
  (
    member(name(N), Is)
  ; 
    member(acronym(N1), Is),
    member(expansion(N2), Is),
    atomic_list_concat([N1, ' ', '(', N2, ')'], N)
  ),
  member(explanation(X), Is),
  page(L, N, X, repo, Md1),
  page(L, N, X, pages, Md2).

page(L, N, X, W, Md) :-
  with_output_to(
	  codes(Md),
	  format('# ~w~n~w~n## Language purposes~n~@~n## Language relationships~n~@~n## Language elements~n~@', [N, X, purposes(L), relationships(L), elements(W, L)])).

purposes(L) :-
    findall(P, (
		hdeclaration(l(Is)),
		member(lid(L), Is),
		member(purpose(P), Is)),
	    Ps),
    ( Ps == [] ->
          format('_None_', [])
        ; maplist(purpose, Ps) ).

purpose(P) :-
    format('* ~w~n', [P]).

relationships(L) :-
    findall(R, (
		hdeclaration(l(Is)),
		member(lid(L), Is),
		member(R, Is),
		member(R, [sameAs(_), similarTo(_), relatesTo(_), variationOf(_), subsetOf(_), supersetOf(_), embeds(_), dependsOn(_)])
	    ),
	    Rs),
    maplist(relationship, Rs).

relationship(R) :-
    member(F, [sameAs, similarTo, relatesTo]),
    R =.. [F, U],
    format('* ~w: [~w](~w)~n', [F, U, U]).

relationship(R) :-
    member(F, [variationOf, subsetOf, supersetOf, embeds, dependsOn]),
    R =.. [F, L],
    hdeclaration(l(Is)),
    member(lid(L), Is),
    (member(name(N), Is); member(acronym(N), Is)),
    format('* ~w: [~w](~w.html)~n', [F, N, L]).
        
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
    maplist(element(W), FNs).

element(repo, FN) :-
    format('* [~w](../../~w)~n', [FN, FN]).

element(pages, FN) :-
    format('* [~w](https://github.com/softlang/yas/blob/master/~w)~n', [FN, FN]).
