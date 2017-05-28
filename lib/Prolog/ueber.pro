:- ['languages/Ueber/macros/include.pro'].
:- ['languages/Ueber/macros/bgl-and-bsl.pro'].
:- ['languages/Ueber/macros/egl.pro'].
:- ['languages/Ueber/macros/esl.pro'].
:- ['languages/Ueber/macros/parse.pro'].
:- ['languages/Ueber/macros/pickyParse.pro'].
:- ['languages/Ueber/macros/mml.pro'].
:- ['languages/Ueber/macros/graph.pro'].
:- ['languages/Ueber/macros/ppl.pro'].
:- ['languages/Ueber/macros/test.pro'].
:- ['languages/Ueber/macros/rules.pro'].
:- ['languages/Ueber/macros/fxy.pro'].
:- ['languages/Ueber/macros/forall.pro'].
:- ['languages/Ueber/macros/lal.pro'].
:- nb_setval(ueber_level, 1).
:- nb_setval(ueber_dir, '.').

init :-
  format('Megamodel processing:~n', []).

% Process directory
process_dir(Dir) :-
    % Read Hinzu dump to be used along the way
    readTermFile('languages/Hinzu/dump.term', HinzuDump1),
    maplist(fst, HinzuDump1, HinzuDump2),
    process_dir(HinzuDump2, Dir).  
    
process_dir(HinzuDump, Dir) :-
  % Read Ueber file, if present
  atom_concat(Dir, '/.ueber', UeberFile),
  ( exists_file(UeberFile) -> 
        readTermFile(UeberFile, UeberTerm)
      ; UeberTerm = [] ),

  % Enter directory
  nb_getval(ueber_level, OldLevel),
  Level is OldLevel + 1,
  nb_setval(ueber_level, Level),
  nb_getval(ueber_dir, OldDir),
  nb_setval(ueber_dir, Dir),
  ueber_indent,
  format('> enter(~q)~n',[Dir]),
  
  % Auto-inject conformance test for Ueber file, if present
  ( exists_file(UeberFile) -> 
        ueber(elementOf('.ueber', ueber(term)))
      ; true ),

  % Process local files
  atom_concat(Dir, '/*', Wildcard),
  expand_file_name(Wildcard, FilesAndDirs),
  filter(exists_file, FilesAndDirs, Files),
  filter(exists_directory, FilesAndDirs, Dirs),
  maplist(process_file(HinzuDump), Files),
  
  atom_concat(Dir, '/*.pro', ProWildcard),
  atom_concat(Dir, '/*.dcg', DcgWildcard),
  expand_file_name(ProWildcard, ProFiles),
  map(load, ProFiles),
  expand_file_name(DcgWildcard, DcgFiles),
  map(load, DcgFiles),

  % Process Ueber file
  maplist(ueber, UeberTerm),

  % Check for Hinzu file
  atom_concat(Dir, '/.hinzu', HinzuFile),
  ( exists_file(HinzuFile) ->
        readTermFile(HinzuFile, HinzuTerm),
	hinzu(HinzuTerm)
      ;
        true
  ),
  
  % Recurse into subdirectories
  map(process_dir(HinzuDump), Dirs),
  
  % Leave directory
  nb_setval(ueber_level, OldLevel),
  nb_setval(ueber_dir, OldDir).


% Process a file
process_file(HinzuDump, File) :-
  file_name_extension(_, FNExt, File),
  ( ( member(r(X), HinzuDump),
      member(extension(FNExt), X) ) ->
          member(id(I), X),
          assertUDecl(elementOf(File, I))
        ;
          true ).

% Load a Prolog file
load(File) :-
  ueber_indent,
  format(' * load(~q)~n',[File]),
  consult(File).

% Process lists of Ueber declarations
ueber(L) :-
  is_list(L),
  map(ueber, L).
  
% Process language declaration
ueber(language(Lang)) :-
  ueber_indent,
  format(' * language(~q)~n',[Lang]),
  assertUDecl(language(Lang)).

% Process language declaration
ueber(membership(Lang, Pred, ArgsRel)) :-
  ueber_indent,
  format(' * membership(~q, ~q, ~q)~n',[Lang, Pred, ArgsRel]),
  map(ueber_absolute, ArgsRel, ArgsAbs),
  assertUDecl(membership(Lang, Pred, ArgsAbs)).

% Process equivalence declaration
ueber(equivalence(Lang, Pred, ArgsRel)) :-
  ueber_indent,
  format(' * equivalence(~q, ~q, ~q)~n',[Lang, Pred, ArgsRel]),
  map(ueber_absolute, ArgsRel, ArgsAbs),
  assertUDecl(equivalence(Lang, Pred, ArgsAbs)).

% Process normalization declaration
ueber(normalization(Lang, Pred, ArgsRel)) :-
  ueber_indent,
  format(' * normalization(~q, ~q, ~q)~n',[Lang, Pred, ArgsRel]),
  map(ueber_absolute, ArgsRel, ArgsAbs),
  assertUDecl(normalization(Lang, Pred, ArgsAbs)).

% Process relation declaration
ueber(relation(Func, LangsIn, Pred, ArgsRel)) :-
  ueber_indent,
  format(' * relation(~q, ~q, ~q, ~q)~n',[Func, LangsIn, Pred, ArgsRel]),
  map(ueber_absolute, ArgsRel, ArgsAbs),
  assertUDecl(function(Func, LangsIn, [], Pred, ArgsAbs)).

% Process function declaration
ueber(function(Func, LangsIn, LangsOut, Pred, ArgsRel)) :-
  ueber_indent,
  format(' * function(~q, ~q, ~q, ~q, ~q)~n',[Func, LangsIn, LangsOut, Pred, ArgsRel]),
  map(ueber_absolute, ArgsRel, ArgsAbs),
  assertUDecl(function(Func, LangsIn, LangsOut, Pred, ArgsAbs)).
  
% Process elementOf/2 relationship
ueber(elementOf(Rel, Lang)) :-
  ueber_absolute(Rel, Abs),
  ueber_indent,
  format(' * elementOf(~q, ~q)~n',[Rel, Lang]),
  assertUDecl(elementOf(Abs, Lang)).

% Process negated elementOf/2 relationship
ueber(notElementOf(Rel, Lang)) :-
  ueber_absolute(Rel, Abs),
  ueber_indent,
  format(' * notElementOf(~q, ~q)~n',[Rel, Lang]),
  assertUDecl(notElementOf(Abs, Lang)).

% Process relatesTo relationship
ueber(relatesTo(Func, ArgsRel)) :-
  map(ueber_absolute, ArgsRel, ArgsAbs),
  ueber_indent,
  format(' * relatesTo(~q, ~q)~n',[Func, ArgsRel]),
  assertUDecl(mapsTo(Func, ArgsAbs, [])).

% Process mapsTo relationship
ueber(mapsTo(Func, ArgsRel, RessRel)) :-
  map(ueber_absolute, ArgsRel, ArgsAbs),
  map(ueber_absolute, RessRel, RessAbs),
  ueber_indent,
  format(' * mapsTo(~q, ~q, ~q)~n',[Func, ArgsRel, RessRel]),
  assertUDecl(mapsTo(Func, ArgsAbs, RessAbs)).

% Process macro applications
ueber(macro(X)) :-
  call(X).

% Error handling for Ueber
ueber(X) :-
  format('Failing on Ueber declaration ~w.~n',[X]),
  abort.

% Process Hinzu declaration
hinzu(HinzuTerm) :-
    maplist(assertHDecl, HinzuTerm),
    ueber(elementOf('.hinzu', hinzu(term))).

% Make a pseudo-absolute filename
ueber_absolute(Rel, Abs2) :-
  nb_getval(ueber_dir, Dir),
  (  
    Dir == '' ->
        Abs1 = Rel
      ; atomic_list_concat([Dir, '/', Rel], Abs1)
  ),
  ueber_normalize(Abs1, Abs2).

% Normalize ".." for uniqueness
ueber_normalize(Atom1, Atom3) :-
  name(Atom1, Str1),
  ( append(Str2, [0'/, 0'., 0'., 0'/|Str3], Str1) ->
        (
          \+ member(0'/, Str2),
          Str6 = Str3
	; append(Str4, [0'/|Str5], Str2),
          \+ member(0'/, Str5),
          concat([Str4, [0'/], Str3], Str6)
        ),
        name(Atom2, Str6),
        ueber_normalize(Atom2, Atom3)
      ;
        Atom3 = Atom1 
  ).

% Indentation
ueber_indent :-
  nb_getval(ueber_level, L),
  ueber_indent(L).
ueber_indent(0).
ueber_indent(L1) :- 
  L1 > 0,
  write(' '),
  L2 is L1 - 1,
  ueber_indent(L2).

% Assert Ueber declaration, if needed
assertUDecl(X) :-
    nb_getval(ueber_dir, Dir),
    assertz(udeclaration(X, Dir)).

% Assert Hinzu declaration
assertHDecl(X) :-
    nb_getval(ueber_dir, Dir),
    assertz(hdeclaration(X, Dir)).

% Test for mode of verification
mode(M) :-
  current_prolog_flag(argv, Argv),
  member(M, Argv).
