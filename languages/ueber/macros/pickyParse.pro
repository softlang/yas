% BEGIN ...
% Pattern of parsing a
% END ...
parseFilePickily(TextF) :-
  file_name_extension(Base, L, TextF),
  file_name_extension(Base, tokens, TokensF),
  file_name_extension(Base, tree, TreeF),
  file_name_extension(Base, term, TermF),
  TextL =.. [L, text],
  TokensL =.. [L, tokens(term)],
  TreeL =.. [L, bgtl(term)],
  TermL =.. [L, term],
  ueber([
    macro(fxy(scan, TextF, TextL, TokensF, TokensL)),
    macro(fxy(parse, TokensF, TokensL, TermF, TermL)),
    macro(fxy(parse, TextF, TextL, TermF, TermL)),
    macro(fxy(unparse, TreeF, TreeL, TokensF, TokensL)),
    macro(fxy(unparse, TreeF, TreeL, TextF, TextL)),
    macro(fxy(implode, TreeF, TreeL, TermF, TermL)),
    macro(fxy(explode, TermF, TermL, TreeF, TreeL))
  ]).
% BEGIN ...
% Use a default sample file for a language
parseSamplePickily(L) :-
  file_name_extension(sample, L, TextF),
  parseFilePickily(TextF).
% END ...
