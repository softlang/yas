% BEGIN ...
:- module(eglParser, []).
% END ...
% The case for terminals
parse((_, Terminal, _, _), t(T), [], Input0, Input1) :-
    apply(Terminal, [T, Input0, Input1]).

% The case for nonterminals
parse(Config, n(N), [Tree2], Input0, Input1) :-
    Config = (Rules, _, _, Mapping),
    member(Rule1, Rules),
    Rule1 = (LOpt, N, Rhs),
    parseSeq(Config, Rhs, Trees, Input0, Input1),
    (LOpt = [L] -> Tree1 =.. [L|Trees]; list2tuple([], Trees, Tree1)),
    once((apply(Mapping, [(N, Tree1), Tree2]); Tree1=Tree2)). 

% The case for "external" nonterminals
parse(Config, n(N), [Tree], Input0, Input1) :-
    Config = (Rules, _, External, _),
    \+ member((_, N, _), Rules),
    apply(External, [N, Tree, Input0, Input1]).
% ...
% BEGIN ...
% "*" / "+" / "?"
parse(Config, EbnfSymbol, [Trees], Input0, Input1 ) :-
    EbnfSymbol =.. [Func,Symbols],
    member(Func, [star, plus, option]),
    Pred = eglParser:parseTuple(Config, Symbols),
    Goal =.. [Func, Pred, Trees, Input0, Input1],
    Goal.
% END ...
% BEGIN ...
% "~"
parse(Config, not(Symbols), [H], Input0, Input1) :-
    Input0 = [H|Input1],
    \+ parseSeq(Config, Symbols, _, Input0, _).
% END ...

% Parse groups (sequences) of symbols
parseSeq(_, [], [], Input, Input).
parseSeq(Config, [Symbol|Symbols], Trees0, Input0, Input2) :-
    eglParser:parse(Config, Symbol, Trees1, Input0, Input1),
    parseSeq(Config, Symbols, Trees2, Input1, Input2),
    append(Trees1, Trees2, Trees0).
% BEGIN ...
% Parse groups (sequences) of symbols as a tuple
parseTuple(Config, Symbols, Tree, Input0, Input1) :-
    parseSeq(Config, Symbols, Trees, Input0, Input1),
    list2tuple([], Trees, Tree).
% END ...
