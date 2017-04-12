:- module(hinzuToMd, []).

main :-
    index,
    languages,
    files.

% --------------------------------------------------

index :-
    with_output_to(
	    codes(Md),
	    format('# Languages~n**[GitHub](https://github.com/softlang/yas/blob/master/languages)**~n~n## Fabricated languages~n~@~n## Established languages~n~@~n', [languageIndex(hinzuToMd:fabricated), languageIndex(hinzuToMd:established)])),
    writeTextFile('docs/index.md', Md).

languageIndex(Selector) :-
    getLanguages(Selector, Ls),
    maplist(hinzuToMd:languageInIndex, Ls).

getLanguages(Selector, Ls) :-
    findall(L, (
		hdeclaration(l(Is)),
		apply(Selector, [Is]),
		member(lid(L), Is)
	    ),
	    Ls).

languageInIndex(L) :-
    hdeclaration(l(Is)),
    member(lid(L), Is),
    (member(name(N), Is); member(acronym(N), Is)),
    member(explanation(X), Is),
    format('* [~w](languages/~w.html): ~w~n', [N, N, X]).

established(Is) :-
    member(sameAs(_), Is).

fabricated(Is) :-
    \+ established(Is).
	
% --------------------------------------------------

languages :-
    getLanguages(succeed, Ls),
    maplist(hinzuToMd:languagePage, Ls).

languagePage(L) :-
    hdeclaration(l(Is)),
    member(lid(L), Is),
    (member(name(N), Is); member(acronym(N), Is)),
    languagePage(L, repo, RepoMd),
    languagePage(L, pages, PagesMd),
    atomic_list_concat(['languages/', N, '/README.md'], RepoFN),
    atomic_list_concat(['docs/languages/', N, '.md'], PagesFN),
    writeTextFile(RepoFN, RepoMd),
    writeTextFile(PagesFN, PagesMd).

languagePage(L, W, Md) :-
    hdeclaration(l(Is)),
    member(lid(L), Is),
    (
	member(name(N), Is),
	Q = N
    ; 
        member(acronym(N), Is),
        member(expansion(M), Is),
        atomic_list_concat([N, ' ', '(', M, ')'], Q)
    ),
    member(explanation(X), Is),
    with_output_to(
	    codes(Md),
	    format('# Language _~w_~n**[GitHub](https://github.com/softlang/yas/blob/master/languages/~w)**~n~n~w~n~n## Language purposes~n~@~n## Language relationships~n~@~n## Language elements~n~@', [Q, N, X, purposes(L), relationships(L), elements(W, L)])).

purposes(L) :-
    hdeclaration(l(Is)),
    member(lid(L), Is),
    findall(P, member(purpose(P), Is), Ps),
    ( Ps == [] ->
          format('_None_~n', [])
        ; maplist(hinzuToMd:purpose, Ps) ).

purpose(P) :-
    format('* ~w~n', [P]).

relationships(L) :-
    hdeclaration(l(Is)),
    member(lid(L), Is),
    findall(R, (
		member(R, Is),
		member(R, [sameAs(_), similarTo(_), relatesTo(_), variationOf(_), subsetOf(_), supersetOf(_), embeds(_), dependsOn(_)])
	    ),
	    Rs),
    maplist(hinzuToMd:relationship, Rs).

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
    format('* ~w: [~w](http://softlang.github.io/yas/languages/~w.html)~n', [F, N, N]).
        
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
    maplist(hinzuToMd:element(W), FNs).

element(repo, FN) :-
    format('* [~w](../../~w)~n', [FN, FN]).

element(pages, FN1) :-
    hinzuToMd:filename(FN1, FN2),
    format('* [~w](../../~w)~n', [FN1, FN2]).

% --------------------------------------------------

files :-    
    setof(FN, L^udeclaration(elementOf(FN, L)), FNs),
    maplist(hinzuToMd:file, FNs).

file(FN1) :-
    readTextFileLines(FN1, Lines),
    filename(FN1, FN2),
    with_output_to(
	  codes(Md),
	  format('# File _~w_~n**[GitHub](https://github.com/softlang/yas/blob/master/~w)**~n```~n~@```~n', [FN1, FN1, trimLines(Lines)])),
    writeTextFile(FN2, Md).

trimLines(Lines) :-
    length(Lines, Len),
    (
      Len < 15 ->
        maplist(hinzuToMd:line, Lines)
     ;
        append(Lines1, _, Lines),
        length(Lines1, 7),
        append(Lines1, [[0'., 0'., 0'.]], Lines2),
        maplist(hinzuToMd:line, Lines2)
    ).

line(Line) :-
    format('~s~n', [Line]).

filename(FN1, FN3) :-
    name(FN1, L1),
    maplist(slashToHyphen, L1, L2),
    name(FN2, L2),
    atomic_list_concat(['docs/files/', FN2, '.md'], FN3).

slashToHyphen(C1, C2) :- C1 == 0'/ -> C2 = 0'-; C2 = C1.
