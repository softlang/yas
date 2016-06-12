processLal(TextF) :-
  file_name_extension(Base, _, TextF),
  file_name_extension(Base, 'term', TermF),
  file_name_extension(Base, 'deps', TermD),
  file_name_extension(Base, 'term2', TermF2),
  file_name_extension(Base, 'ppl', PplF),
  file_name_extension(Base, 'lal2', TextF2),
  ueber([
    macro(parseFile(TextF)),
    macro(fxy(deps, TermF, lal(term), TermD, deps(term))),
    macro(fxy(transform, TermF, lal(term), TermF2, lal(term))),
    macro(fxy(pp, TermF2, lal(term), TextF2, lal(text))),
    macro(fxy(parse, TextF2, lal(text), TermF2, lal(term))),
    elementOf(TermF2, ok(lal(term)))
  ]).
