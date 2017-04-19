:- module(hinzuDump, []).

% Basic dump of declarations into Hinzu file
main(Ds) :-
  findall(
    (D, Dir),
    hdeclaration(D, Dir),
    Ds).

% --------------------------------------------------

% Dump Hinzu and Ueber data (LOD)

% The complete dump
main :-
    languages(Langs),
    representations(Reprs),
    purposes(Purps),
    qualifiers(Quals),
    directories(Dirs),
    files(Files),
    writeJSONFile('dump.json', json([
					   languages=Langs,
					   representations=Reprs,
					   purposes=Purps,
					   qualifiers=Quals,
					   directories=Dirs,
					   files=Files])).

% The dump for languages
languages(Langs) :-
    findall(json([
			id=Lang,
			github=Github,
			name=Name,
			expansion=Expa,
			description=Desc,
			link=Links,
			representation=Reprs]),
	    (
		hdeclaration(l(Items), _),
		member(id(Lang), Items),
		member(name(Name), Items),
		master(Master),
		atomic_list_concat([Master, '/languages/', Name], Github),
		once((member(expansion(Expa), Items); Expa='@'(null))),
		member(description(Desc), Items),
		linksFrom(l, Items, Links),
		representations(Items, Reprs)
	    ),
	    Langs).

% Dump fragment for representations for a given language
representations(Items, Rs) :-
    member(id(L), Items),
    findall(json([id='#'(R), language=U]),
	    (
		(
		  member(U, [text, term, xml, json]),
		  R =.. [L, U],
	 	  udeclaration(language(R), _)
	        ;
		  U = term,
		  X =.. [L, U],
		  R =.. [ok, X]
		)
	    ),	
	    Rs).

% The dump for representations
representations(Reprs) :-
    findall(json([id='#'(Repr), language=Langs, occurrence=Occus, file=Files2]),
	    (
		udeclaration(language(Repr), _),
		representationToLanguages(Repr, Langs),
		findall(json([text='#'(D), exposition=X, ueber=Dir]),
			(
			    udeclaration(D, Dir),
			    ( D = membership(Repr, _, _)
			    ; D = equivalence(Repr, _, _)
			    ; D = normalization(Repr, _, _)
			    ; D = relation(_, Reprs, _, _), member(Repr, Reprs)
			    ; D = function(_, Reprs1, Reprs2, _, _), (member(Repr, Reprs1); member(Repr, Reprs2))
			    ),
			    exposition(D, X)
			),
			Occus),
		findall(File, udeclaration(elementOf(File, Repr), _), Files1),
		list_to_set(Files1, Files2)
	    ),
	    Reprs).	

% Abstract a representation to languages
representationToLanguages(Repr, Langs) :-
    findall(Lang,
	    (
		(Repr1 = Repr; ok(Repr1) = Repr),
		Repr1 =.. [X,Y],
		member(Y, [text, term, xml, json]),
		(Lang=X; Lang=Y)
	    ),
	    Langs1),
    languageToBase(Repr, Base),
    list_to_set([Base|Langs1], Langs).

% Expose Ueber declaration
exposition(
	membership(Repr, Goal, Files),
	json([
		    functor=membership,
		    args=json([
				     representation='#'(Repr),
				     goal='#'(Goal),
				     file=Files])])).

exposition(
	equivalence(Repr, Goal, Files),
	json([
		    functor=equivalence,
		    args=json([
				     representation='#'(Repr),
				     goal='#'(Goal),
				     file=Files])])).

exposition(
	normalization(Repr, Goal, Files),
	json([
		    functor=normalization,
		    args=json([
				     representation='#'(Repr),
				     goal='#'(Goal),
				     file=Files])])).

exposition(
	relation(Name, R1, Goal, Files),
	json([
		    functor=relation,
		    args=json([
				     name=Name,
				     representation=R2,
				     goal='#'(Goal),
				     file=Files])])) :-
    maplist(hinzuDump:show, R1, R2).

exposition(
	function(Name, D1, R1, Goal, Files),
	json([
		    functor=function,
		    args=json([
				     name=Name,
				     domain=json([representation=D2]),
				     range=json([representation=R2]),
				     goal='#'(Goal),
				     file=Files])])) :-
    maplist(hinzuDump:show, D1, D2),
    maplist(hinzuDump:show, R1, R2).

exposition(
	relatesTo(Name, Files),
	json([
		    functor=relatesTo,
		    args=json([
				     name=Name,
				     file=Files])])).

exposition(
	mapsTo(Name, Files1, File2),
	json([
		    functor=mapsTo,
		    args=json([
				     name=Name,
				     argument=json([file=Files1]),
				     result=json([file=Files2])
				 ])])).

exposition(
	elementOf(File, Repr),
	json([
		    functor=elementOf,
		    args=json([
				     file=File,
				     representation='#'(Repr)
				 ])])).

exposition(
	notElementOf(File, Repr),
	json([
		    functor=notElementOf,
		    args=json([
				     file=File,
				     representation='#'(Repr)
				 ])])).

% The dump for purposes
purposes(Purps2) :-
    findall((Purp, Name, Links),
	    (
		hdeclaration(p(Items), _),
		member(id(Purp), Items),
		member(name(Name), Items),
		linksFrom(p, Items, Links)
	    ),
	    Purps1),
    findall(json([id=Purp, name=Name, language=Langs, link=Links]),
	    (
		member((Purp, Name, Links), Purps1),
		findall(Lang,
			(
			    hdeclaration(l(Items), _),
			    member(id(Lang), Items),
			    member(relatesTo(hasPurpose, id(Purp)), Items)
			),
			Langs)
	    ),
	    Purps2).

% Dummp fragment for Links from an entity
linksFrom(NsFrom, Items, Links) :-
    findall(json([qualifier=Q, K=V]),
	    (
		member(relatesTo(Q, Link), Items),
		( Link =.. [uri, V], K = uri
		; Link =.. [id, V], member((Q, NsFrom, NsTo), [
                    (sameAs, NsFrom, NsFrom),
                    (similarTo, NsFrom, NsFrom),
                    (linksTo, NsFrom, NsFrom),
                    (hasPurpose, NsFrom, p),
                    (representationOf, l, r),
                    (subsetOf, l, l),
                    (supersetOf, l, l),
                    (embeds, l, l),
                    (dependsOn, l, l) ]),
		  namespace(NsTo, K)
		)
	    ),
	    Links).

% Map namespaces of Hinzu to JSON keys
namespace(l, language).
namespace(r, representation).
namespace(p, purpose).
namespace(q, qualifier).
namespace(f, file).

% The dump for qualifiers
qualifiers(Qs) :-
    findall(json([id=Id, description=Desc, link=Links]),
		 (
		     hdeclaration(q(Items), _),
		     member(id(Id), Items),
		     member(description(Desc), Items),
		     linksFrom(q, Items, Links)		     
		 ),
		 Qs).

% The dump for directories
directories(Dirs) :-
    findall(Dir,
	    (
		( udeclaration(elementOf(File, ueber(term)), _)
		; udeclaration(elementOf(File, hinzu(term)), _)
		),
		name(File, String),
		append(DirString, [0'/|BaseNameString], String),
		\+ member(0'/, BaseNameString),
		name(Dir, DirString)
	    ),
	    Dirs1),
    list_to_set(Dirs1, Dirs2),
    findall(json([id=Dir, directory=SubDirs, file=Files2]),
	    (
		member(Dir, Dirs2),
		findall(SubDir,
			(
			    member(SubDir, Dirs2),
			    atom_concat(Dir, _, SubDir),
			    \+ Dir == SubDir
			),
			SubDirs),
		findall(File,
			(
			    name(Dir, DirString),
			    ( udeclaration(elementOf(File, _), _)
			    ; udeclaration(notElementOf(File, _), _)
			    ),
			    name(File, FileString),
			    append(DirString, [0'/|BaseNameString], FileString),
			    \+ member(0'/, BaseNameString)
			),
			Files1),
		list_to_set(Files1, Files2)
	    ),
	    Dirs).

% The dump for files
files(Files) :-
    findall(FileName, udeclaration(elementOf(FileName, _), _), FileNames1),
    list_to_set(FileNames1, FileNames2),
    findall(json([id='#'(File), representation=Reprs3, language=Langs, occurrence=Occus]),
	    (
		member(File, FileNames2),
		findall(Repr, udeclaration(elementOf(File, Repr), _), Reprs1),
		list_to_set(Reprs1, Reprs2),
		maplist(hinzuDump:show, Reprs2, Reprs3),
		maplist(hinzuDump:representationToLanguages, Reprs2, Langss),
		concat(Langss, Langs),
		findall(json([text='#'(D), exposition=X, ueber=Dir]),
			(
			    udeclaration(D, Dir),
			    ( D = elementOf(File, Repr)
			    ; D = notElementOf(File, Repr)
			    ; D = equivalence(Repr, _, ArgFiles), member(File, ArgFiles)
			    ; D = normalization(Repr, _, ArgFiles), member(File, ArgFiles)
			    ; D = relation(_, _, _, ArgFiles), member(File, ArgFiles)
			    ; D = function(_, _, _, _, ArgFiles), member(File, ArgFiles)
			    ),
			    exposition(D, X)
			),
			Occus)
	    ),
	    Files).

% --------------------------------------------------

% Infer data -- not used at this point

%
% subsetsOf(-Subs, +Super): infer subsets Subs of Super
%
subsetsOf(Subs, Super) :-
    setof(Sub, Super^subsetOf(Sub, Super), Subs).

subsetOf(Sub, Super) :-
    hdeclaration(l(Items), _),
    member(subsetOf(Super), Items),
    member(id(L), Items),
    (Sub = L; subsetOf(Sub, L)).

subsetOf(Sub, Super) :-
    hdeclaration(l(Items), _),
    member(id(Super), Items),
    member(supersetOf(L), Items),
    (Sub = L; subsetOf(Sub, L)).

% --------------------------------------------------

% Conversion utilities

% The master URI into the GitHub repo
master('https://github.com/softlang/yas/tree/master').

% Tell Prolog to convert term to string
show(X, '#'(X)).

% To relate singular and plural -- not yet used
plural(language, languages).
plural(representation, representations).
plural(purpose, purposes).
plural(qualifier, qualifiers).
plural(directory, directories).
plural(file, files).
