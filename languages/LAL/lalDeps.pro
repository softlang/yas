:- module(lalDeps, []).

deps(Ds, Deps) :-
    findall((MN, F), (
		member(reuse(MN, _), Ds),
		filename(MN, F) ),
	    Deps).

filename(MN, F2) :-
    atomic_list_concat(MN, '/', F1),
    atomic_list_concat(['languages/LAL/lib/', F1, '.term2'], F2).
