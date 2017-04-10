% BEGIN ...
:- module(mdlToMd, []).
% END ...

main((_, L), Text) :-
  (
    member(acronym(N1), L),
    member(expansion(N2), L),
    atomic_list_concat([N1, ' ', '(', N2, ')'], N)
  ; 
    member(name(N), L)
  ),
  member(explanation(X), L),
  with_output_to(
	  codes(Text),
	  format('# ~w~n~w~n## Language elements~n~@', [N, X, byFilenameExtension(L)])).

byFilenameExtension(L) :-
    member(filenameExtension(FNExt), L),
    findall(FN, (declaration(elementOf(FN, _)), atom_concat(_, FNExt, FN)), FNs),
    \+ FNs == [],
    format('### Language elements by extension ~q~n', [FNExt]),
    maplist(fnitem, FNs).

byFilenameExtension(_).

fnitem(FN) :-
    format('* [~w](../../~w)~n', [FN, FN]).
