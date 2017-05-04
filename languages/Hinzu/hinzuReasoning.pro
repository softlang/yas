:- module(hinzuReasoning, []).

/*
 Find all representations with reasoning items such that the files
 that are elements of these representations are annotated according to
 the reasoning items.
*/

main :-
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
		maplist(hinzuReasoning:annotate(File), Reasons, ItemsFs),
		concat(ItemsFs, ItemsF)

	    ),
	    Annotations),
    maplist(hinzuReasoning:assert, Annotations).

% Apply annotation to file
annotate(File, reason(Goal, Items1), Items2) :-
    apply(Goal, [File]) -> Items2 = Items1; Items2 = [].

% Assert inferred annotation
assert((File, Items)) :-
    file_directory_name(File, Dir),
    Decl = hdeclaration(f([id(File)|Items]), Dir),
    writeln(Decl),
    assertz(Decl).

% Guards used in some reasoning annotations
testLexical(File) :- file_base_name(File, 'ls.egl').
testContextFree(File) :- file_base_name(File, 'cs.egl').
