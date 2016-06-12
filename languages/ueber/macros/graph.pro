% An element of a graph language
graphSample(Lang, Sample) :-
  GraphLang =.. [Lang, graph(term)],
  atom_concat(Sample, '.graph', Graph),
  ueber(elementOf(Graph, GraphLang)).

% Default for the sample's name
graphSample(Lang) :-
  graphSample(Lang, sample).
