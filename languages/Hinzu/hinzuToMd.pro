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
	    format('# Language _~w_~n~@~w~n~n## Purposes~n~@~n## Links~n~@~n## Representations~n~@~n## References~n~@~n## Elements~n~@', [Q, linkToLanguage(W, N), X, purposes(L), linksForLanguage(W, L), representationsOfLanguage(L), referencesToLanguage(L), elementsOfLanguage(W, L)])).

linkToLanguage(repo, _).
linkToLanguage(pages, N) :-
    format('**[GitHub](https://github.com/softlang/yas/blob/master/languages/~w)**~n~n', [N]).

purposes(L) :-
    hdeclaration(l(Is)),
    member(lid(L), Is),
    findall(P, member(purpose(P), Is), Ps),
    ( Ps == [] ->
          format('_None_~n', [])
        ; maplist(hinzuToMd:purpose, Ps) ).

purpose(P) :-
    format('* ~w~n', [P]).

linksForLanguage(W, L) :-
    hdeclaration(l(Is)),
    member(lid(L), Is),
    findall(R, (
		member(R, Is),
		member(R, [sameAs(_), similarTo(_), relatesTo(_), variationOf(_), subsetOf(_), supersetOf(_), embeds(_), dependsOn(_)])
	    ),
	    Rs),
    maplist(hinzuToMd:linkForLanguage(W), Rs).

linkForLanguage(repo, R) :-
    format('* ~w~n', [R]).

linkForLanguage(pages, R) :-
    member(F, [sameAs, similarTo, relatesTo]),
    R =.. [F, U],
    format('* ~w: [~w](~w)~n', [F, U, U]).

linkForLanguage(pages, R) :-
    member(F, [variationOf, subsetOf, supersetOf, embeds, dependsOn]),
    R =.. [F, L],
    hdeclaration(l(Is)),
    member(lid(L), Is),
    (member(name(N), Is); member(acronym(N), Is)),
    format('* ~w: [~w](http://softlang.github.io/yas/languages/~w.html)~n', [F, N, N]).

representationsOfLanguage(L) :-
    findall(R, (
		hdeclaration(r(Is)),
		member(rid(R), Is),
		member(representationOf(L), Is)
	    ),
	    Rs),
    maplist(hinzuToMd:representationOfLanguage, Rs).

representationOfLanguage(R) :-
    format('* ~q~n', [R]).

referencesToLanguage(L) :-
    findall(R, (
		hdeclaration(r(Is)),
		member(rid(R), Is),
		member(representationOf(L), Is)
	    ),
	    Rs),
    findall(D, (
		udeclaration(D),
		( D = membership(R, _, _), member(R, Rs)
		; D = function(_, Rs1, Rs2, _, _), member(R, Rs), (member(R, Rs1); member(R, Rs2) )
                )
	    ),
	    Ds),
    maplist(hinzuToMd:referenceToLanguage, Ds).

referenceToLanguage(D) :-
    format('* ~q~n', [D]).

elementsOfLanguage(W, L) :-
    findall(R, (
		hdeclaration(r(Is)),
		member(rid(R), Is),
		member(representationOf(L), Is)),
	    Rs),
    findall(FN, (
		udeclaration(elementOf(FN, R)),
		member(R, Rs)),
	    FNs),
    maplist(hinzuToMd:elementOfLanguage(W), FNs).

elementOfLanguage(repo, FN) :-
    format('* [~w](../../~w)~n', [FN, FN]).

elementOfLanguage(pages, FN1) :-
    hinzuToMd:relative_filename(FN1, FN2),
    format('* [~w](~w)~n', [FN1, FN2]).

% --------------------------------------------------

files :-    
    setof(FN, L^udeclaration(elementOf(FN, L)), FNs),
    maplist(hinzuToMd:file, FNs).

file(FN1) :-
    readTextFileLines(FN1, Lines),
    absolute_filename(FN1, FN2),
    with_output_to(
	  codes(Md),
	  format('# File _~w_~n**[GitHub](https://github.com/softlang/yas/blob/master/~w)**~n```~n~@```~n~n## Languages~n~@~n## References~n~@', [FN1, FN1, trimLines(Lines), languagesOfFile(FN1), referencesToFile(FN1)])),
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

languagesOfFile(FN) :-
    findall((L, R), (
		udeclaration(elementOf(FN, R)),
		hdeclaration(r(Is)),
		member(rid(R), Is),
		member(representationOf(L), Is)
	    ),
	    LRs),
    maplist(hinzuToMd:languageOfFile, LRs).

languageOfFile((L, R)) :-
    hdeclaration(l(Is)),
    member(lid(L), Is),
    (member(name(N), Is); member(acronym(N), Is)),
    format('* [~w](../languages/~w.md) (~w)~n', [N, N, R]).

referencesToFile(FN) :-
    findall(D, (
		udeclaration(D),
		( D = elementOf(FN, _)
		; D = membership(_, _, FNs), member(FN, FNs)
		; D = mapsTo(_, FNs1, FNs2), ( member(FN, FNs1); member(FN, FNs2) )
		; D = function(_, _, _, _, FNs), member(FN, FNs)
                )
	    ),
	    Ds),
    maplist(hinzuToMd:referenceToFile, Ds).

referenceToFile(D) :-
    format('* ~q~n', [D]).

% --------------------------------------------------

absolute_filename(FN1, FN3) :-
    basename(FN1, FN2),
    atomic_list_concat(['docs/files/', FN2, '.md'], FN3).

relative_filename(FN1, FN3) :-
    basename(FN1, FN2),
    atomic_list_concat(['../files/', FN2, '.md'], FN3).

basename(FN1, FN2) :-
    name(FN1, L1),
    maplist(slashToHyphen, L1, L2),
    name(FN2, L2).

slashToHyphen(C1, C2) :- C1 == 0'/ -> C2 = 0'-; C2 = C1.
