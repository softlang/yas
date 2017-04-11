:- module(hinzuMdIndex, []).

main(Hinzu, Md) :-
    with_output_to(
	    codes(Md),
	    format('# Languages~n~@', [languages(Hinzu)])).

languages(Hinzu) :-
    findall((L, N), (
		member(l(Is), Hinzu),
		member(lid(L), Is),
		(member(acronym(N), Is); member(name(N), Is))
	    ),
	    LNs),
    maplist(language, LNs).

language((L, N)) :-
    format('* [~w](languages/~w.html)~n', [N, L]).
