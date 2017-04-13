# File _languages/BGL/bglAcceptTopDown.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/bglAcceptTopDown.pro)**
```
% BEGIN ...
:- module(bglAcceptTopDown, []).
% END ... 
% Start acceptance from start symbol (LHS of first rule)
accept(G, I) :- G = [(_, N, _)|_], steps(G, [n(N)], I).

% Acceptance succeeds (empty stack; all input consumed)
steps(_, [], []).

% Consume terminal at top of stack from input
steps(G, [t(T)|Z], [T|I]) :- steps(G, Z, I).

% Expand a nonterminal; try different alternatives
steps(G, [n(N)|Z0], I) :- member((_, N, Rhs), G), append(Rhs, Z0, Z1), steps(G, Z1, I).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BGL/bglAcceptTopDown.pro',prolog(text))
