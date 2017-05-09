:- module(hinzuToMd, []).

main :-
    readJSONFile('dump.json', json(X)),
    member(languages=Langs, X),
    member(representations=Reprs, X),
    member(functions=Funcs, X),
    member(externals=Exts, X),
    member(directories=Dirs, X),
    member(files=Files, X),
    languageIndex(Langs),
    maplist(hinzuToMd:readme, Langs),
    maplist(hinzuToMd:languagePage, Langs),
    representationIndex(Reprs),
    maplist(hinzuToMd:representationPage, Reprs),
    functionIndex(Funcs),
    maplist(hinzuToMd:functionPage, Funcs),
    externalIndex(Exts),
    directoryIndex(Dirs),
    maplist(hinzuToMd:directoryPage, Dirs),
    fileIndex(Files),
    maplist(hinzuToMd:filePage, Files).

languageIndex(Langs) :-
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS languages~n---~n# ~@: YAS index~n~nLanguage&nbsp;&nbsp; | YAS-specific? | Headline~n--- | ---~n~@', [hinzuToMd:caption('Languages'), maplist(hinzuToMd:languageItem, Langs)])),
    writeTextFile('../www/jekyll/yas/languages.md', Md).

languageItem(json(X)) :-
    member(name=Name, X),
    member(uri=Uri, X),
    member(yas=Bool, X),
    (
	Bool == '@'(true) ->
	    Checkmark = '&#10004;'
     ;
	    Checkmark = ''
    ),
    member(headline=Headline, X),
    format('[~w](~w) | ~w | ~w~n', [Name, Uri, Checkmark, Headline]).

languagePage(json(X)) :-
    member(id=Lang, X),
    member(name=Name, X),    
    member(github=GitHub, X),    
    member(expansion=Expansion, X),
    member(headline=Headline, X),
    member(details=Details, X),
    member(properties=Props, X),
    member(representations=Reprs, X),
    member(components=Comps, X),
    atomic_list_concat(['../www/jekyll/yas/languages/', Lang, '.md'], File),    
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS language ~w~n---~n# Language *~w*~n~@', [
		       Name,
		       Name,
		       and([
				  hinzuToMd:uriSection('GitHub', GitHub),
				  hinzuToMd:paragraphSection(true, 'Expansion', Expansion),
				  hinzuToMd:paragraphSection(true, 'Headline', Headline),
				  hinzuToMd:paragraphSection(true, 'Details', Details),
				  hinzuToMd:itemizedSection('Properties', hinzuToMd:propertyItem, Props),
				  hinzuToMd:itemizedSection('Representations', hinzuToMd:representationItem, Reprs),
				  hinzuToMd:itemizedSection('Components', hinzuToMd:componentItem, Comps)
			      ])
		   ])),
    writeTextFile(File, Md).

readme(json(X)) :-
    member(id=Lang, X),
    member(name=Name, X),    
    member(expansion=Expansion, X),
    member(headline=Headline, X),
    member(details=Details, X),
    atomic_list_concat(['languages/', Lang, '/README.md'], File),    
    with_output_to(
	    codes(Md),
	    format('# Language *~w*~n~@', [
		       Name,
		       and([
				  hinzuToMd:paragraphSection(false, 'Expansion', Expansion),
				  hinzuToMd:paragraphSection(false, 'Headline', Headline),
				  hinzuToMd:paragraphSection(false, 'Details', Details)
			      ])
		   ])),
    writeTextFile(File, Md).

representationIndex(Reprs) :-
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS representations~n---~n# ~@: YAS index~n~@', [hinzuToMd:caption('Representations'), maplist(hinzuToMd:representationItem, Reprs)])),
    writeTextFile('../www/jekyll/yas/representations.md', Md).

representationItem(json(X)) :-
    member(name=Name, X),
    member(uri=Uri, X),
    format('* [~w](~w)~n', [Name, Uri]).

representationPage(json(X)) :-
    member(id=Escaped, X),
    member(name=Name, X),    
    member(language=json(Lang), X),    
    member(dependencies=Deps, X),
    member(files=Files, X),
    atomic_list_concat(['../www/jekyll/yas/representations/', Escaped, '.md'], File),    
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS representation ~w~n---~n# YAS representation *~w*~n~@', [
		       Name,
		       Name,
		       and([
				  hinzuToMd:linkSection('Language', Lang),
				  hinzuToMd:itemizedSection('Dependencies', hinzuToMd:dependencyItem, Deps),
				  hinzuToMd:itemizedSection('Files', hinzuToMd:fileItem, Files)
			      ])
		   ])),
    writeTextFile(File, Md).

functionIndex(Funcs) :-
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS functions~n---~n# ~@: YAS index~n~@', [hinzuToMd:caption('Functions'), maplist(hinzuToMd:functionItem, Funcs)])),
    writeTextFile('../www/jekyll/yas/functions.md', Md).

functionItem(json(X)) :-
    member(id=Name, X),
    member(uri=Uri, X),
    format('* [~w](~w)~n', [Name, Uri]).

functionPage(json(X)) :-
    member(id=Name, X),
    member(dependencies=Deps, X),
    atomic_list_concat(['../www/jekyll/yas/functions/', Name, '.md'], File),    
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS function ~w~n---~n# YAS function *~w*~n~@', [
		       Name,
		       Name,
		       hinzuToMd:itemizedSection('Dependencies', hinzuToMd:dependencyItem, Deps)
		   ])),
    writeTextFile(File, Md).

externalIndex(Exts) :-
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS externals~n---~n# ~@: YAS index~n~@', [hinzuToMd:caption('Externals'), maplist(hinzuToMd:externalItem, Exts)])),
    writeTextFile('../www/jekyll/yas/externals.md', Md).

externalItem(json(X)) :-
    member(reluri=Rel, X),
    member(absuri=Abs, X),
    format('* [~w](~w)~n', [Rel, Abs]).

% Represent property as item
propertyItem(json(X)) :-
    member(property=json(Prop), X),
    member(name=PropName, Prop),
    member(uri=PropUri, Prop),
    member(object=json(Obj), X),
    member(name=ObjName, Obj),
    member(uri=ObjUri, Obj),
    format('* **this** *[~w](~w)* [~w](~w)~n', [PropName, PropUri, ObjName, ObjUri]).

% Represent component as item
componentItem(json(X)) :-
    member(subject=json(Subj), X),
    member(property=json(Prop), X),
    member(object=json(Obj), X),
    member(name=SubjName, Subj),
    member(uri=SubjUri, Subj),    
    member(name=instanceOf, Prop),
    member(name=ObjName, Obj),
    member(uri=ObjUri, Obj),    
    format('* [~w](~w) (*[~w](~w)*)~n', [SubjName, SubjUri, ObjName, ObjUri]).
    
% Simple section where content is just a link
uriSection(Caption, Content) :- 
    Content = '@'(null) -> true;
    format('## ~@~n<~w>~n~n---~n', [hinzuToMd:caption(Caption), Content]).

% A section with a linked name
linkSection(Caption, Json) :- 
    member(name=Name, Json),
    member(uri=Uri, Json),
    format('## ~@~n[~w](~w)~n~n---~n', [hinzuToMd:caption(Caption), Name, Uri]).

% Simple section where content is just paragraph
paragraphSection(Bool, Caption, Content) :-
    Content = '@'(null) -> true;
    ( Bool ->
	  format('## ~@~n~w~n~n---~n', [hinzuToMd:caption(Caption), Content])
        ; format('## ~w~n~w~n~n---~n', [Caption, Content]) ).

% Section with itemized content subject to a per-item goal
itemizedSection(Caption, Goal1, Content) :-
    ( Content == [] ->
	  Goal2 = format('*None*~n', []) 
     ;
	  Goal2 = maplist(Goal1, Content)
    ),
    format('## ~@~n~@~n~n---~n', [hinzuToMd:caption(Caption), Goal2]).

fileIndex(Files) :-
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS files~n---~n# ~@: YAS index~n~@', [hinzuToMd:caption('Files'), maplist(hinzuToMd:fileItem, Files)])),
    writeTextFile('../www/jekyll/yas/files.md', Md).

fileItem(json(X)) :-
    member(name=Name, X),
    member(uri=Uri, X),
    format('* [~w](~w)~n', [Name, Uri]).

filePage(json(X)) :-
    member(id=Escaped, X),
    member(name=Name, X),
    member(github=GitHub, X),
    member(representations=Reprs, X),
    member(properties=Props, X),
    member(dependencies=Deps, X),
    atomic_list_concat(['../www/jekyll/yas/files/', Escaped, '.md'], File),    
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS file ~w~n---~n# YAS file *~w*~n~@', [
		       Name,
		       Name,
		       and([
				  hinzuToMd:uriSection('GitHub', GitHub),
				  hinzuToMd:itemizedSection('Representations', hinzuToMd:representationItem, Reprs),
				  hinzuToMd:itemizedSection('Properties', hinzuToMd:propertyItem, Props),
				  hinzuToMd:itemizedSection('Dependencies', hinzuToMd:dependencyItem, Deps)
			      ])				   
		   ])),
    writeTextFile(File, Md).

dependencyItem(json(X)) :-
    member(sym=Sym, X),
    member(directory=json(Y), X),
    member(name=Dir, Y),
    member(uri=Uri, Y),
    member(arguments=Args, X),
    format('* [~w](~w): **~w**~n~@', [Dir, Uri, Sym, maplist(hinzuToMd:ueber(1), Args)]).

ueber(C, json(X)) :-
    member(caption=Caption, X),
    member(name=Name, X),
    member(uri=Uri, X),
    format('~@* ~@ *[~w](~w)*~n', [hinzuToMd:indent(C), hinzuToMd:caption(Caption), Name, Uri]).

ueber(C, json(X)) :-
    member(caption=Caption, X),
    member(name=Name, X),
    \+ member(uri=_, X),
    format('~@* ~@ *~w*~n', [hinzuToMd:indent(C), hinzuToMd:caption(Caption), Name]).

ueber(C0, json(X)) :-
    member(caption=Caption, X),
    member(list=[], X),
    format('~@* ~@: *None*~n', [hinzuToMd:indent(C0), hinzuToMd:caption(Caption)]).

ueber(C0, json(X)) :-
    member(caption=Caption, X),
    member(list=[E], X),
    hinzuToMd:ueber(C0, E).

ueber(C0, json(X)) :-
    member(caption=Caption, X),
    length(L, Len), Len > 1,
    member(list=L, X),
    format('~@* ~@~n', [hinzuToMd:indent(C0), hinzuToMd:caption(Caption)]),
    C1 is C0 + 1,
    maplist(hinzuToMd:ueber(C1), L).

indent(C0) :-
    C0 =< 0 -> true; write('    '), C1 is C0 - 1, indent(C1).

directoryIndex(Dirs) :-
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS directories~n---~n# ~@: YAS index~n~@', [hinzuToMd:caption('Directories'), maplist(hinzuToMd:fileItem, Dirs)])),
    writeTextFile('../www/jekyll/yas/directories.md', Md).

directoryPage(json(X)) :-
    member(id=Escaped, X),
    member(name=Name, X),
    member(github=GitHub, X),
    member(properties=Props, X),
    member(components=Comps, X),
    atomic_list_concat(['../www/jekyll/yas/directories/', Escaped, '.md'], File),    
    with_output_to(
	    codes(Md),
	    format('---~nlayout: yas~ntitle: YAS directory ~w~n---~n# YAS directory *~w*~n~@', [
		       Name,
		       Name,
		       and([
				  hinzuToMd:uriSection('GitHub', GitHub),
				  hinzuToMd:itemizedSection('Properties', hinzuToMd:propertyItem, Props),
				  hinzuToMd:itemizedSection('Components', hinzuToMd:componentItem, Comps)
			      ]) 
		   ])),
    writeTextFile(File, Md).

% Output a caption and link to glossary including plural-to-singular normalization
caption(Term) :-
    (
     Term = 'Components' -> Singular = 'Component';
     Term = 'Dependencies' -> Singular = 'Dependency';
     Term = 'Directories' -> Singular = 'Directory';
     Term = 'Externals' -> Singular = 'External';
     Term = 'Files' -> Singular = 'File';
     Term = 'Languages' -> Singular = 'Language';
     Term = 'Properties' -> Singular = 'Property';
     Term = 'Representations' -> Singular = 'Representation';
     Singular = Term
    ),
    format('[~w](/yas/glossary/~w.html)', [Term, Singular]).
