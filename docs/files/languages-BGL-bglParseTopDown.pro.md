# File _languages/BGL/bglParseTopDown.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/bglParseTopDown.pro)**
```
% BEGIN ...
:- module(bglParseTopDown, []).
% END ...
% Start parsing from start symbol (LHS of first rule)
parse(G, I, T) :- G = [(_, N, _)|_], tree(G, n(N), T, I, []).

% Consume terminal at top of stack from input
...
```
