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
    hinzuReasoning:main,
    languages(Langs),
    externals(Exts),
    representations(Reprs),
    functions(Funcs),
    files(Files),
    directories(Dirs),
    writeJSONFile('dump.json', json([
					   languages=Langs,
					   externals=Exts,
					   representations=Reprs,
					   functions=Funcs,
					   files=Files,
					   directories=Dirs
				       ])).

% The dump for languages
languages(Langs) :-
    master(Master),
    findall(json([
			id=Lang,
			uri=Uri,
			github=Github,
			name=Name,
			yas=Bool,
			expansion=Expansion,
			headline=Headline,
			details=Details,
			properties=Props,
			representations=Reprs,
			components=Comps
		    ]),
	    (
		hdeclaration(l(Items), Dir),
		member(id(Lang), Items),
		member(name(Name), Items),
		isYasLanguage(Items, Bool),
		atomic_list_concat(['/yas/languages/', Lang, '.html'], Uri),
		atomic_list_concat([Master, '/languages/', Name], Github),
		once((member(expansion(Expansion), Items); Expansion='@'(null))),
		member(headline(Headline), Items),
		once((member(details(Details), Items); Details='@'(null))),
		properties(hinzuDump:languageObject, Items, Props),
		representations(Lang, Reprs),
		components(Dir, Comps)
	    ),
	    Langs).

isYasLanguage(Items, Bool) :-
    member(sameAs(extern(_)), Items) ->
	Bool = '@'(false); Bool = '@'(true).

% The dump for functions
functions(FuncsJson) :-
    setof(Func,
	  LangsIn^LangsOut^Goal^Files^Dir^udeclaration(
		function(Func, LangsIn, LangsOut, Goal, Files), Dir),
	  Funcs),
    findall(json([
			id=Func,
			uri=Uri,
			dependencies=Deps
		    ]),
	    (
		member(Func, Funcs),
		atomic_list_concat(['/yas/functions/', Func, '.html'], Uri),
		funcDependencies(Func, Deps)
	    ),
	    FuncsJson).

% The dump for externals
externals(Exts2) :-
    wiki(Wiki),
    psymbols(PSyms),
    setof(Rel,
	    Items^Dir^F^T^(
		hdeclaration(l(Items), Dir),
		member(F, PSyms),
		T =.. [F,extern(Rel)],
		member(T, Items)
	    ),
	    Exts1),
    findall(json([reluri=Rel, absuri=Abs]),
	    (
		member(Rel, Exts1),
		atomic_list_concat([Wiki, Rel], Abs)
	    ),
	    Exts2).

representations(ReprsJson) :-
    setof(Repr, Dir^udeclaration(language(Repr), Dir), Reprs),
    findall(json([
			id='#'(Escaped),
			name='#'(Repr),
			uri='#'(ReprUri),
			language=json([id=Lang, name=LangName, uri=LangUri]),
			dependencies=Deps,
			files=FilesJson
		    ]),
	    (
		member(Repr, Reprs),
		hdeclaration(r(ItemsR), _),
		member(id(Repr), ItemsR),
		member(representationOf(Lang), ItemsR),
                escapeRepr(Repr, Escaped),
		representationToUri(Repr, ReprUri),
		hdeclaration(l(ItemsL), _),
		member(id(Lang), ItemsL),
		member(name(LangName), ItemsL),
		atomic_list_concat(['/yas/languages/', Lang, '.html'], LangUri),
		reprDependencies(Repr, Deps),
		once((
		    setof(File, Dir^udeclaration(elementOf(File, Repr), Dir), Files)
		  ; Files = [])),
		findall(json([name='#'(File), uri='#'(FileUri)]),
			(
			    member(File, Files),
			    filenameToUri(File, FileUri)
			),
			FilesJson)
	    ),
	    ReprsJson).
    
% Dump fragment for representations of a given language
representations(Lang, Reprs) :-
    findall(json([name='#'(Repr), uri='#'(Uri)]),
	    (
		hdeclaration(r(Items), _),
		member(representationOf(Lang), Items),
		member(id(Repr), Items),
		representationToUri(Repr, Uri)
	    ),	
	    Reprs).

% Components for a directory
components(Dir, Comps) :-
    wiki(Wiki),
    findall(json([
			subject=json([name='#'(FileOrDir), uri='#'(FileOrDirUri)]),
			property=json([name=instanceOf, uri=PropUri]),
			object=json([name=ObjName, uri='#'(ObjUri)])
		]),
	    (
		(
		  hdeclaration(f(Items), Dir),
		  member(id(FileOrDir), Items),
		  filenameToUri(FileOrDir, FileOrDirUri)
		;
		  hdeclaration(d(Items), FileOrDir),
		  atom_concat(Dir, _, FileOrDir),
		  \+ Dir == FileOrDir,
		  dirnameToUri(FileOrDir, FileOrDirUri)
		),
		member(instanceOf(extern(ObjName)), Items),
		atomic_list_concat([Wiki, ObjName], ObjUri),
		atomic_list_concat([Wiki, 'Property:instanceOf'], PropUri)
	    ),
	    Comps).

files(FilesJson) :-
    setof(File, Repr^Dir^udeclaration(elementOf(File, Repr), Dir), Files),
    master(Master),
    findall(json([
			id='#'(FileEscaped),
			name='#'(File),
			uri='#'(Uri),
			github='#'(Github),
			representations=ReprsJson,
			properties=Props,
			dependencies=Deps
		    ]),
	    (
		member(File, Files),
		once((
		    hdeclaration(f(Items), _),
		    member(id(File), Items)
		  ; Items=[])),
                escapeFilename(File, FileEscaped),
		filenameToUri(File, Uri),
		atomic_list_concat([Master, '/', File], Github),
		setof(Repr, Dir^udeclaration(elementOf(File, Repr), Dir), Reprs),
		findall(json([
				    id='#'(ReprEscaped),
				    name='#'(Repr),
				    uri='#'(ReprUri)
				]),
			(
			    member(Repr, Reprs),
			    escapeRepr(Repr, ReprEscaped),
			    representationToUri(Repr, ReprUri)
			),
			ReprsJson),
		fileDependencies(File, Deps),
		properties(fail, Items, Props)
	    ),
	    FilesJson).

% Dependencies of a file
fileDependencies(File, Deps) :-
    findall(json([
			sym=Sym,
			directory=json([name='#'(Dir), uri='#'(Uri)]),
			arguments=Ueber
		    ]),
	    (
		udeclaration(Decl, Dir),
		Decl =.. [Sym|Args],
		(
		    Decl = mapsTo(Goal, FilesIn, FilesOut),
		    once((member(File, FilesIn); member(File, FilesOut)))
		;
		    Decl = membership(_, _, Files),
		    once(member(File, Files))
		;
		    Decl = equivalence(_, _, Files),
		    once(member(File, Files))
		;
		    Decl = normalization(_, _, Files),
		    once(member(File, Files))
		;
		    Decl = function(_, _, _, _, Files),
		    once(member(File, Files))
		),
		udecl(Sym, Args, Ueber),
		dirnameToUri(Dir, Uri)
	    ),
	    Deps).

% Dependencies of a representation
reprDependencies(Repr, Deps) :-
    findall(json([
			sym=Sym,
			directory=json([name='#'(Dir), uri='#'(Uri)]),
			arguments=Ueber
		    ]),
	    (
		udeclaration(Decl, Dir),
		Decl =.. [Sym|Args],
		(
		    Decl = membership(Repr, _, _)
		;
		    Decl = equivalence(Repr, _, _)
		;
		    Decl = normalization(Repr, _, _)
		;
		    Decl = function(_, ReprsIn, ReprsOut, _, _),
		    once((member(Repr, ReprsIn); member(Repr, ReprsOut)))
		),
		udecl(Sym, Args, Ueber),
		dirnameToUri(Dir, Uri)
	    ),
	    Deps).

% Dependencies of a function
funcDependencies(Func, Deps) :-
    findall(json([
			sym=Sym,
			directory=json([name='#'(Dir), uri='#'(Uri)]),
			arguments=Ueber
		    ]),
	    (
		( Decl = function(Func, _, _, _, _)
		; Decl = mapsTo(Func, _, _)
		),
		udeclaration(Decl, Dir),
		Decl =.. [Sym|Args],
		udecl(Sym, Args, Ueber),
		dirnameToUri(Dir, Uri)
	    ),
	    Deps).

% Dump Ueber declarations
udecl(Sym, Args, Ueber) :-
    (
	Sym = mapsTo,
	Types = [
	    sort(func),
	    star(sort(file)),
	    star(sort(file))
	];
	member(Sym, [membership, equivalence, normalization]),
	Types = [
	    sort(lang),
	    sort(goal),
	    star(sort(file))
	];
	Sym = function,
	Types = [
	    sort(func),
	    star(sort(lang)),
	    star(sort(lang)),
	    sort(goal),
	    star(sort(file))
	]
    ),
    map(hinzuDump:udeclarg, Types, Args, Ueber).

% Dump arguments of Ueber declarations
udeclarg(
	sort(lang),
	Repr,
	json([caption='Representation', name='#'(Repr), uri='#'(Uri)])
    ) :-
    representationToUri(Repr, Uri).
    
udeclarg(
	sort(func),
	Func,
	json([caption='Function', name='#'(Func), uri='#'(Uri)])
    ) :-
    functionToUri(Func, Uri).
    
udeclarg(
	sort(goal),
	Goal,
	json([caption='Goal', name='#'(Goal)])).

udeclarg(
	sort(file),
	File,
	json([caption='File', name='#'(File), uri='#'(Uri)])
    ) :-
    filenameToUri(File, Uri).
    
udeclarg(star(X), Y, json([caption=C, list=Z])) :-
    ( X = sort(file), C = 'Files'
    ; X = sort(lang), C = 'Languages'
    ),
    maplist(hinzuDump:udeclarg(X), Y, Z).

directories(Dirs) :-
    findall(Dir,
	    ( udeclaration(_, Dir)
	    ; hdeclaration(_, Dir)
	    ),
	    UnsortedDirBag),
    list_to_set(UnsortedDirBag, SortedDirSet),
    master(Master),
    findall(json([
			id='#'(Escaped),
			name='#'(Dir),
			uri='#'(Uri),
			github='#'(Github),
			properties=Props,
			components=Comps
		    ]),
	    (
		member(Dir, SortedDirSet),
		once((hdeclaration(d(Items), Dir); Items=[])),
                escapeFilename(Dir, Escaped),
		dirnameToUri(Dir, Uri),
		atomic_list_concat([Master, '/', Dir], Github),
		properties(fail, Items, Props),
		components(Dir, Comps)
	    ),
	    Dirs).

% The properties for an entity
properties(Resolver, Items, Props) :-
    wiki(Wiki),
    psymbols(PSyms),
    findall(json([property=json([name=PropName, uri=PropUri]), object=json([name=ObjName, uri=ObjUri])]),
	    (
		member(PropName, PSyms),
		T =.. [PropName, Link],
		member(T, Items),
		( Link = extern(ObjName),
  		  atomic_list_concat([Wiki, ObjName], ObjUri)
		; Link = intern(ObjId),
		  apply(Resolver, [ObjId, ObjName, ObjUri])
		),
		atomic_list_concat([Wiki, 'Property:', PropName], PropUri)
	    ),
	    Props).

% Interpret an internal link (an ID) as a language id and resolve it to name and URI
languageObject(ObjId, ObjName, ObjUri) :-
    hdeclaration(l(ObjItems), _),
    member(id(ObjId), ObjItems),
    member(name(LangName), ObjItems),
    atomic_list_concat(['Language:', LangName], ObjName),
    atomic_list_concat(['/yas/languages/', ObjId, '.html'], ObjUri).

% --------------------------------------------------

% Utilities

% The master URI into the GitHub repo
master('https://github.com/softlang/yas/tree/master').

% The baseuri for the 101wiki
wiki('https://101wiki.softlang.org/').

% All of 101wiki's property symbols
psymbols([instanceOf, sameAs, similarTo, relatesTo, uses, facilitates, defines, subsetOf, supersetOf, embeds, dependsOn, linksTo]).

% Tell Prolog to convert term to string
show(X, '#'(X)).

% Convert file name to URI
filenameToUri(File, Uri) :-
    escapeFilename(File, Escaped),
    atomic_list_concat(['/yas/files/', Escaped, '.html'], Uri).

% Convert file name to URI
dirnameToUri(Dir, Uri) :-
    escapeFilename(Dir, Escaped),
    atomic_list_concat(['/yas/directories/', Escaped, '.html'], Uri).

% Convert representation to URI
representationToUri(Repr, Uri) :-
    escapeRepr(Repr, Escaped),
    atomic_list_concat(['/yas/representations/', Escaped, '.html'], Uri).

% Convert function to URI
functionToUri(Func, Uri) :-
    atomic_list_concat(['/yas/functions/', Func, '.html'], Uri).

% Escape file name
escapeFilename(File, Escaped) :-
    name(File, L1),
    maplist(hinzuDump:slashToHyphen, L1, L2),
    name(Escaped, L2).
    
slashToHyphen(C1, C2) :- C1 == 0'/ -> C2 = 0'-; C2 = C1.

% Escape representation
escapeRepr(Repr, Escaped) :-
    with_output_to(codes(L1), write(Repr)),
    maplist(hinzuDump:parenToHyphen, L1, L2),
    name(Escaped, L2).
    
parenToHyphen(C1, C2) :- C1 == 0'( -> C2 = 0'-; C1 == 0') -> C2 = 0'-; C2 = C1.
