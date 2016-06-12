% BEGIN ...
% Testing parsing and well-formedness
% END ...
% Positive sample for parsing
parseable(TextF) :-  
  file_name_extension(_, L, TextF), 
  TextL =.. [L, text],
  ueber([elementOf(TextF, TextL)]).

% Negative sample for parsing
unparseable(TextF) :-  
  file_name_extension(_, L, TextF), 
  TextL =.. [L, text],
  ueber([
    elementOf(TextF, text),
    notElementOf(TextF, TextL) ]).

% Positive sample for well-formedness
well_formed(TextF) :-
  file_name_extension(Base, L, TextF), 
  file_name_extension(Base, term, TermF), 
  TermL =.. [L, term],
  ueber([
    macro(parseFile(TextF)),
    elementOf(TermF, ok(TermL)) ]).

% Negative sample for well-formedness
ill_formed(TextF) :-
  file_name_extension(Base, L, TextF), 
  file_name_extension(Base, term, TermF), 
  TermL =.. [L, term],
  ueber([
    macro(parseFile(TextF)),
    notElementOf(TermF, ok(TermL)) ]).
