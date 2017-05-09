:- module(hinzuReasoning, []).

main :-
    annotateFiles,
    annotateReprs.

% --------------------------------------------------

/*
 Find all representations with reasoning items such that the files
 that are elements of these representations are annotated according to
 the reasoning items.
*/

annotateFiles :-    
    findall((File, ItemsF),
	    (
		% Consider all representations
		hdeclaration(r(ItemsR), DirR),
		member(id(Repr), ItemsR),

		% Collect reasoning for representation
		findall(Reason,
			(
			    Reason = reason(_, _),
			    member(Reason, ItemsR)
			),
			Reasons),
		\+ Reasons == [], 

		% Collect all elements of representation
		setof(File, DirUeber^udeclaration(elementOf(File, Repr), DirUeber), Files),

		% Reason!
		member(File, Files),
		maplist(hinzuReasoning:annotateFile(File), Reasons, ItemsFs),
		concat(ItemsFs, ItemsF)

	    ),
	    Annotations),
    maplist(hinzuReasoning:assertFileAnnotation, Annotations).

% Apply annotation to file
annotateFile(File, reason(Goal, Items1), Items2) :-
    apply(Goal, [File]) -> Items2 = Items1; Items2 = [].

% Assert inferred file annotation
assertFileAnnotation((File, Items)) :-
    file_directory_name(File, Dir),
    Decl = hdeclaration(f([id(File)|Items]), Dir),
    assertz(Decl).

% Guards used in some reasoning annotations
testLexical(File) :- file_base_name(File, 'ls.egl').
testContextFree(File) :- file_base_name(File, 'cs.egl').

% --------------------------------------------------

/*
 Find all representations that don't have associated languages
 explicitly and use heuristics to associate them while using "None" as
 a last resort.
*/

annotateReprs :-
    setof(Repr,
	  Dir^udeclaration(language(Repr), Dir),
	  ReprsUsed),
    setof(Repr,
	    Items^Dir^(
		hdeclaration(r(Items), Dir),
		member(id(Repr), Items)
	    ),
	    ReprsDeclared),
    ord_subtract(ReprsUsed, ReprsDeclared, ReprsUndeclared),
    findall((Repr, Lang, Dir),
	    (
		member(Repr, ReprsUndeclared),
		( ( Repr =.. [Lang, Base],
		    member(Base, [term, text, json, xml]),
		    hdeclaration(l(Items), Dir),
		    member(id(Lang), Items) ) -> true
		;
		  Lang = none,
		  Dir = ''
		)
	    ),
	    Annotations),
    maplist(hinzuReasoning:assertReprAnnotation, Annotations).

% Assert inferred representation annotation
assertReprAnnotation((Repr, Lang, Dir)) :-
    Decl = hdeclaration(r([id(Repr),representationOf(Lang)]), Dir),
    assertz(Decl).
