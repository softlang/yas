% BEGIN ...
% EGL-based concrete syntax definition
% END ...
eglSyntax(Lang) :-
  TextLang =.. [Lang, text],
  TermLang =.. [Lang, term],
  Files = ['cs.term', 'ls.term'],
  atom_concat(Lang, 'Abstract', Mapping),
  Acceptor = eglAcceptor(Mapping:(~>)),
  Parser = eglParser(Mapping:(~>)),
  ueber([
    language(TextLang),
    language(TermLang),
    membership(TextLang, Acceptor, Files),
    function(parse, [TextLang], [TermLang], Parser, Files),
    elementOf('cs.egl', egl(text)),
    elementOf('cs.term', egl(term)),
    elementOf('ls.egl', egl(text)),
    elementOf('ls.term', egl(term)),
    mapsTo(parse, ['cs.egl'], ['cs.term']),
    mapsTo(parse, ['ls.egl'], ['ls.term'])
  ]).
