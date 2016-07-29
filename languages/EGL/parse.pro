:- multifile xparse/5.

% The case for terminals
xparse(Config, t(T), [], Input0, Input1) :-
  Config = (_, ParseTerminal, _, _),
  apply(ParseTerminal, [T, Input0, Input1]).

% The case for nonterminals
xparse(
    Config,
    n(N),
    [Tree2],
    Input0, Input1
  ) :-
       Config = (Rules, _, _, Mapping),
       member(Rule1, Rules),
       Rule1 = (LOpt, N, Rhs),
       xparseSeq(Config, Rhs, Trees, Input0, Input1),
       (
         % Use label when available
         LOpt = [L],
         Tree1 =.. [L|Trees]
       ; 
         % Use trees as is for nonterminal
         LOpt = [],
         list2tuple([], Trees, Tree1)
       ),
       ( apply(Mapping, [(N, Tree1), Tree2]) -> 
             true
           ; Tree1 = Tree2 ). 

% The case for external nonterminals
xparse(Config, n(N), [Tree], Input0, Input1) :-
  Config = (Rules, _, ParseExternal, _),
  \+ member((_, N, _), Rules),
  apply(ParseExternal, [N, Tree, Input0, Input1]).

% "*" / "+" / "?"
xparse(
    Config,
    EbnfSymbol,
    [Trees],
    Input0, Input1
  ) :-
       EbnfSymbol =.. [Func,Symbols],
       member(Func, [star, plus, option]),
       Pred = xparseTuple(Config, Symbols),
       Goal =.. [Func, Pred, Trees, Input0, Input1],
       Goal.

% "~"
xparse(
    Config,
    not(Symbols),
    [H],
    Input0, Input1
  ) :-
       Input0 = [H|Input1],
       \+ xparseSeq(Config, Symbols, _, Input0, _).
       
% Parse groups (sequences) of symbols
xparseSeq(
    Config,
    Symbols,
    Trees2,
    Input0, Input1
  ) :-
       seq(xparse(Config), Symbols, Trees1, Input0, Input1),
       concat(Trees1, Trees2).

% Parse groups (sequences) of symbols as a tuple
xparseTuple(Config, Symbols, Tree, Input0, Input1) :-
  xparseSeq(Config, Symbols, Trees, Input0, Input1),
  list2tuple([], Trees, Tree).
