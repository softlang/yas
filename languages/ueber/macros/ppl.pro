% Pretty print an AST to text
ppFile(TextFile) :-
  file_name_extension(Base, Lang, TextFile),
  file_name_extension(Base, term, TermFile),
  file_name_extension(Base, ppl, PplFile),
  TextLang =.. [Lang, text],
  TermLang =.. [Lang, term],
  atom_concat(Lang, 'Pp', Pp),
  ueber([
    elementOf(TextFile, TextLang),
    elementOf(TermFile, TermLang),
    elementOf(PplFile, ppl(term)),
    function(pp, [TermLang], [ppl(term)], Pp, []),
    mapsTo(pp, [TermFile], [PplFile]),
    mapsTo(pp, [PplFile], [TextFile])
  ]).
  
% Use a default sample file for a language
ppSample(Lang) :-
  file_name_extension(sample, Lang, TextFile),
  ppFile(TextFile).
