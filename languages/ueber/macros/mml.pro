% BEGIN ...
% MML-based metamodel
% END ...
mmlSyntax(Lang) :-
  GraphLang =.. [Lang, graph(term)],
  ueber([
    language(GraphLang),
    elementOf('mm.mml', mml(text)),
    elementOf('mm.term', mml(term)),
    elementOf('mm.graph', mml(graph(term))),
    mapsTo(parse, ['mm.mml'], ['mm.term']),
    mapsTo(resolve, ['mm.term'], ['mm.graph']),
    membership(GraphLang, mmlChecker, ['mm.graph'])
  ]).
