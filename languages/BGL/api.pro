% BGL-based conformance for token sequences
bglConformance(Input, Grammar) 
 :-
    once(bglAcceptTopDown:accept(Grammar, Input)).
    
% BGL-based top-down acceptor for token sequences
bglAcceptor(File, Input) :-
  bglTopDownAcceptor(File, Input).

bglTopDownAcceptor(File, Input)
 :-
    readTermFile(File, Grammar),
    once(bglAcceptTopDown:accept(Grammar, Input)).

% BGL-based top-down acceptor with scanner
bglAcceptor(Pred, File, Input1) :-
  bglTopDownAcceptor(Pred, File, Input1).

bglTopDownAcceptor(Pred, File, Input1)
 :-
    apply(Pred, [Input1, Input2]),
    bglTopDownAcceptor(File, Input2).

% BGL-based bottom-up acceptor for token sequences
bglBottomUpAcceptor(File, Input)
 :-
    readTermFile(File, Grammar),
    once(bglAcceptBottomUp:accept(Grammar, Input)).

% BGL-based bottom-up acceptor with scanner
bglBottomUpAcceptor(Pred, File, Input1)
 :-
    apply(Pred, [Input1, Input2]),
    bglBottomUpAcceptor(File, Input2).

% BGL-based imploder for parse trees
cstToAst(Input, Output)
 :-
    apply(cstToAst:(~>), [Input, Output]).

% BGL-based exploder for parse trees
astToCst(File, Input, Output)
 :-
    readTermFile(File, Grammar),
    apply(astToCst:(~>), [(Grammar, Input), Output]).
 
% BGL-based top-down parser for token sequences
bglParser(File, Text, Term) :-
  bglTopDownParser(File, Text, Term).

bglTopDownParser(File, Text, Term)
 :-
    readTermFile(File, Grammar),
    once(bglParseTopDown:parse(Grammar, Text, PTree)),
    apply(cstToAst:(~>), [PTree, Term]).

% BGL-based top-down parser with scanner
bglParser(Pred, File, Text1, Term) :-
  bglTopDownParser(Pred, File, Text1, Term).

bglTopDownParser(Pred, File, Text1, Term)
 :-
    apply(Pred, [Text1, Text2]),
    bglTopDownParser(File, Text2, Term).

% Parser of BGL grammars relying on EGL
parserOfBgl(Text, Term2) :-
  require(
    scannerFailed(egl),
    tokens(eglToken, Text, Tokens)),
  File = 'languages/EGL/cs.term',
  require(
    fileNotReadable(File),
    readTermFile(File, Egl)),
  require(
    parserFailed(egl),
    eglScannerfull:parse(Egl, fail, Tokens, Term1)),
  require(
    bglSubset,
    eglToBgl(Term1, Term2)
  ).

% Membership test for BGL by attempted parsing
elementOfBgl(Text) :-
  parserOfBgl(Text, _).
