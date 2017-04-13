# File _languages/BGL/unparse.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/unparse.pro)**
```
% Unparse parse tree to string
bglTreeToText(Tree, Text) :-
  bglTreeToTokens(Tree, Tokens),
  atomic_list_concat(Tokens, Atom),
  name(Atom, Text).

% Unparse parse tree to token sequence
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BGL/unparse.pro',prolog(text))
