% BEGIN ...
% MML-based metamodel
% END ...
mmlSyntax(Lang) :-
    mmlSyntax(mm, Lang).

mmlSyntax(Stem, Lang) :-
    GraphLang =.. [Lang, graph(term)],
    atom_concat(Stem, '.mml', TextFile),
    atom_concat(Stem, '.term', TermFile),
    atom_concat(Stem, '.graph', GraphFile),
    ueber([
		 language(GraphLang),
		 elementOf(TextFile, mml(text)),
		 elementOf(TermFile, mml(term)),
		 elementOf(GraphFile, mml(graph(term))),
		 mapsTo(parse, [TextFile], [TermFile]),
		 mapsTo(resolve, [TermFile], [GraphFile]),
		 membership(GraphLang, mmlChecker, [GraphFile])
	     ]).
