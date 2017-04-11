:- module(hinzuMdIndex, []).

main(Hinzu, Md) :-
    with_output_to(
	    codes(Md),
	    format('## Fabricated languages~n~@## Established languages~n~@', [languages(hinzuMdIndex:fabricated, Hinzu), languages(hinzuMdIndex:established, Hinzu)])).

languages(Selector, Hinzu) :-
    findall((L, N, X), (
		member(l(Is), Hinzu),
		apply(Selector, [Is]),
		member(lid(L), Is),
		(member(name(N), Is); member(acronym(N), Is)),
		member(explanation(X), Is)
	    ),
	    LNXs),
    maplist(language, LNXs).

language((L, N, X)) :-
    format('* [~w](languages/~w.html): ~w~n', [N, L, X]).

established(Is) :-
    member(sameAs(_), Is).

fabricated(Is) :-
    \+ established(Is).
