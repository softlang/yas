% Conformance for ESL
eslConformance(Term, Decls) :-
  [Decl|_] = Decls,
  ( Decl = symbol(_, _, Sort)
  ; Decl = type(Sort, _) ),
  wellTypedTerm(Decls, sort(Sort), Term).

% Membership test
eslChecker(File, Term) :-
  eslLanguage(File, Term).

eslLanguage(File, Term) :-
  readTermFile(File, Decls),
  [Decl|_] = Decls,
  ( Decl = symbol(_, _, Sort)
  ; Decl = type(Sort, _) ),
  wellTypedTerm(Decls, sort(Sort), Term).

% Collect all symbols
symbols(G, Fs3) :-
  map(extractF, G, Fs1),
  concat(Fs1, Fs2),
  list_to_set(Fs2, Fs3).

% Collect all sorts -- defined or used
allSs(G, Ss3) :-
  definedSs(G, Ss1),
  usedSs(G, Ss2),
  union(Ss1, Ss2, Ss3).

% Collect all defined sorts
definedSs(G, Ss3) :-
  map(extractDS, G, Ss1),
  concat(Ss1, Ss2),
  list_to_set(Ss2, Ss3).

% Collect all used sorts
usedSs(G, Ss2) :-
  collect(extractUS, G, Ss1),
  list_to_set(Ss1, Ss2).

% Extract symbol
extractF(symbol(F, _, _), [F]).

% Extract defined sort
extractDS(type(S, _), [S]).
extractDS(symbol(_, _, S), [S]).

% Extract used sort
extractUS(sort(S), [S]).

