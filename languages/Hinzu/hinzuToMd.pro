% BEGIN ...
:- module(hinzuToMd, []).
% END ...

main(Hinzu, Text) :-
  member(l(L), Hinzu),
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
	  format('# ~w~n~w~n## Language elements~n~@', [N, X, byFilenameExtension(Hinzu)])).

byFilenameExtension(Hinzu) :-
 findall(FNExt, (member(r(R), Hinzu), member(filenameExtension(FNExt), R)), FNExts),
 findall(FN, (udeclaration(elementOf(FN, _)), member(FNExt, FNExts), atom_concat(_, FNExt, FN)), FNs),
 \+ FNs == [],
 format('### Language elements by extension~n', []),
 maplist(fnitem, FNs).

byFilenameExtension(_).

fnitem(FN) :-
    format('* [~w](../../~w)~n', [FN, FN]).
