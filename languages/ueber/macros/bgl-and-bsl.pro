% BEGIN ...
% Combo of BGL- and BSL-based syntax definition
% END ...
basicSyntax(L) :-
  % Languages for representation
  TextL =.. [L, text],
  TokensL =.. [L, tokens(term)],
  TreeL =.. [L, bgtl(term)],
  TermL =.. [L, term],
  % Synthesize scanner predicate
  atom_concat(L, 'Scanner', S),
  ueber([
    language(TextL),
    language(TokensL),
    language(TreeL),
    language(TermL),
    % Syntax definition artifacts
    macro(fxy(parse, 'cs.bgl', bgl(text), 'cs.term', bgl(term))),
    macro(fxy(parse, 'as.bsl', bsl(text), 'as.term', bsl(term))),
    macro(fxy(project, 'cs.term', bgl(term), 'as.term', bsl(term))),
    % Membership tests for artifacts
    membership(TextL, bglAcceptor(S), ['cs.term']),
    membership(TokensL, bglAcceptor, ['cs.term']),
    membership(TreeL, bgtlOk:main, ['cs.term']),
    membership(TermL, bslTerm, ['as.term']),  
    % Functions for scanning, parsing, unparsing, etc.
    function(scan, [TextL], [TokensL], S, []),
    function(parse, [TokensL], [TermL], bglParser, ['cs.term']),
    function(parse, [TextL], [TermL], bglParser(S), ['cs.term']),
    function(implode, [TreeL], [TermL], bglImploder, []),
    function(explode, [TermL], [TreeL], bglExploder, ['cs.term']),
    function(unparse, [TreeL], [TokensL], bglTreeToTokens, []),
    function(unparse, [TreeL], [TextL], bglTreeToText, []) ]).
