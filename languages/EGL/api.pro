eglAcceptor(Mapping, FileCs, FileLs, Text) :-
  eglLanguage(Mapping, FileCs, FileLs, Text).
eglLanguage(Mapping, FileCs, FileLs, Text) :-
  eglParser(Mapping, FileCs, FileLs, Text, _).
eglParser(Mapping, FileCs, FileLs, Text, Term) :-
  eglParser(layout, Mapping, FileCs, FileLs, Text, Term).
eglParser(Layout, Mapping, FileCs, FileLs, Text, Term) :-
  readTermFile(FileCs, CfSyn),  
  readTermFile(FileLs, LexSyn),
  eglScannerless:parse(CfSyn, LexSyn, Layout, Mapping, Text, Term).
eglParserScannerless(Layout, Mapping, FileCs, FileLs, Text, Term) :-
  eglParser(Layout, Mapping, FileCs, FileLs, Text, Term).
eglParserScannerfull(Mapping, FileCs, Input, Tree) :-
  readTermFile(FileCs, CfSyn),  
  eglScannerfull:parse(CfSyn, Mapping, Input, Tree).

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
