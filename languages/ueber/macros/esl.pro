% BEGIN ...
% ESL-based abstract syntax definition
% END ...
eslSyntax(Lang) :-
  TermLang =.. [Lang, term],
  ueber([
    language(TermLang),
    elementOf('as.esl', esl(text)),
    elementOf('as.term', esl(term)),
    mapsTo(parse, ['as.esl'], ['as.term']),
    membership(TermLang, eslLanguage, ['as.term'])
  ]).
