eglAcceptor(Mapping, FileCs, FileLs, Text) :-
  eglLanguage(Mapping, FileCs, FileLs, Text).
eglLanguage(Mapping, FileCs, FileLs, Text) :-
  eglParser(Mapping, FileCs, FileLs, Text, _).
eglParser(Mapping, FileCs, FileLs, Text, Term) :-
  eglParser(layout, Mapping, FileCs, FileLs, Text, Term).
eglParser(Layout, Mapping, FileCs, FileLs, Text, Term) :-
  readTermFile(FileCs, CfSyn),  
  readTermFile(FileLs, LexSyn),
  scannerless(Layout, Mapping, CfSyn, LexSyn, Text, Term).
eglParserScannerless(Layout, Mapping, FileCs, FileLs, Text, Term) :-
  eglParser(Layout, Mapping, FileCs, FileLs, Text, Term).
eglParserScannerfull(Mapping, FileCs, Input, Tree) :-
  readTermFile(FileCs, CfSyn),  
  scannerfull(Mapping, CfSyn, Input, Tree).

% Scannerfull parsing
scannerfull(
    Mapping, % tree mapping
    CfSyn, % context-free syntax
    Input0, % input string of terminals
    Tree % parse tree
  ) :-
       CfSyn = [(_, Root, _)|_],
       Config = (
         CfSyn,
         scannerfullTerminal,
         scannerfullLexical,
         Mapping
       ),
       xparse(Config, n(Root), [Tree], Input0, []).
 
% Handle terminals as tokens previously scanned
scannerfullTerminal(T, [T|Input], Input).

% Handle external nonterminals as token class
scannerfullLexical(N, V, [T|Input], Input) :-
  T =.. [N, V].

% Scannerless parsing
scannerless(
    Layout, % layout nonterminal
    Mapping, % tree mapping
    CfSyn, % rules of context-free syntax
    LexSyn, % rules of lexical syntax
    Input0, % input string of terminals
    Tree % parse tree
    ) :-
       CfSyn = [(_,Root,_)|_],
       Config = (
         CfSyn,
         scannerlessTerminal(LexSyn, Layout, Mapping),
         scannerlessLexical(LexSyn, Layout, Mapping),
         Mapping
       ),
       xparse(Config, n(Root), [Tree], Input0, Input1),
       skipLayout(LexSyn, Layout, Mapping, Input1, []).

% Handle terminals as prefixes of the input (and skip layout)
scannerlessTerminal(LexSyn, Layout, Mapping, T, Input0, Input2) :-
  skipLayout(LexSyn, Layout, Mapping, Input0, Input1),
  scannerlessTerminal(T, Input1, Input2).

% Handle terminals as prefixes of the input
scannerlessTerminal(T, Input0, Input1) :-
  name(T, String),
  append(String, Input1, Input0).

% Parse nonterminals according to lexical syntax
scannerlessLexical(LexSyn, Layout, Mapping, N, Tree, Input0, Input2) :-
  skipLayout(LexSyn, Layout, Mapping, Input0, Input1),
  parseLexical(LexSyn, Mapping, n(N), [Tree], Input1, Input2).

% Skip layout
skipLayout(LexSyn, Layout, Mapping, Input0, Input1) :- 
  parseLexical(LexSyn, Mapping, star([n(Layout)]), _, Input0, Input1).

% Parse symbols according to lexical syntax
parseLexical(LexSyn, Mapping, Symbol, Trees, Input0, Input1) :-
  Config = (
    LexSyn,
    scannerlessTerminal,
    scannerlessChar,
    Mapping
  ),
  once(xparse(Config, Symbol, Trees, Input0, Input1)).

% Parse externals of lexical syntax as char constraints
scannerlessChar(N, Char, Input0, Input1) :-
  char(N, Char, Input0, Input1).

% Collect all labels
labels(G, Ls3) :-
  map(extractL, G, Ls1),
  concat(Ls1, Ls2),
  list_to_set(Ls2, Ls3).

% Collect all nonterminals -- defined or used
allNs(G, Ns3) :-
  definedNs(G, Ns1),
  usedNs(G, Ns2),
  union(Ns1, Ns2, Ns3).

% Collect all defined nonterminals
definedNs(G, Ns3) :-
  map(extractDN, G, Ns1),
  concat(Ns1, Ns2),
  list_to_set(Ns2, Ns3).
     
% Collect all used nonterminals
usedNs(G, Ns2) :-
  collect(extractUN, G, Ns1),
  list_to_set(Ns1, Ns2).

% Extract label 
extractL((L, _, _), L).

% Extract defined nonterminal 
extractDN((_, N, _), [N]).
  
% Extract used nonterminal 
extractUN(n(N), [N]).
