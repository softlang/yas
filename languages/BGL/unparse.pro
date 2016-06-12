% Unparse parse tree to string
bglTreeToText(Tree, Text) :-
  bglTreeToTokens(Tree, Tokens),
  atomic_list_concat(Tokens, Atom),
  name(Atom, Text).

% Unparse parse tree to token sequence
bglTreeToTokens(Tree, Tokens) :-
  unparse([Tree], Tokens).

% Base case
unparse([], []).

% Copy leaf terminal to output string and recurse
unparse([leaf(T)|Trees], [T|Tokens]) :-
  unparse(Trees, Tokens).

% Unparse sub-trees of fork tree and remaining trees 
unparse([fork(_, Trees1)|Trees2], Tokens3) :-
  unparse(Trees1, Tokens1),
  unparse(Trees2, Tokens2),
  append(Tokens1, Tokens2, Tokens3).
