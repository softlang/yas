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
  with_output_to(codes(Text), format('+ ~w~n~w', [N, X])).
