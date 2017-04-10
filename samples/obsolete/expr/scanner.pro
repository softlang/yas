% A scanner for the expr language
exprScanner(Input, Ts) :-
  tokens(
    token(['zero', 'succ', '(', ')', '+']),
    Input,
    Ts).

