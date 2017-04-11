% BEGIN ...
:- module(hinzuToMd, []).
% END ...

main(Hinzu, Text) :-
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
  with_output_to(
	  codes(Text),
	  format('# ~w~n~w~n## Language elements~n~@', [N, X, byMembership(L)])).

byMembership(L) :-
    findall(R, (
		hdeclaration(r(Is)),
		member(rid(R), Is),
		member(representationOf(L), Is)),
	    Rs),
    findall(FN, (
		udeclaration(elementOf(FN, R)),
		member(R, Rs)),
	    FNs),
    maplist(fnitem, FNs).

byMembership(_).

fnitem(FN) :-
    format('* [~w](../../~w)~n', [FN, FN]).
