% BEGIN ...
% Parse a text file to a term
% END ...
parseFile(TextF) :-
  file_name_extension(Base, L, TextF),
  file_name_extension(Base, term, TermF),
  TextL =.. [L, text],
  TermL =.. [L, term],
  ueber([macro(fxy(parse, TextF, TextL, TermF, TermL))]).
% BEGIN ...
% Use a default sample file for a language
parseSample(L) :-
  file_name_extension(sample, L, TextF),
  parseFile(TextF).
% END ...
