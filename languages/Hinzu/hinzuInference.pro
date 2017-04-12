:- module(hinzuInference, []).

main :-
    findall((L, R), (
		hdeclaration(l(Is1)),
		member(lid(L), Is1),
		udeclaration(language(R)),
		( R =.. [L,X],
                  atom(X) % To surpress ...value... 
                ;
		  R =.. [ok,X],
		  X =.. [L,Y],
		  atom(Y)
                ),
 		\+ (
		    hdeclaration(r(Is2)),
		    member(rid(R), Is2),
		    member(representationOf(L), Is2)
		)
	    ),
	    LRs),
    maplist(hinzuInference:addRepresentation, LRs).

addRepresentation((L, R)) :-
    assertHDecl(r([
			 rid(R),
			 representationOf(L)
		     ])).
