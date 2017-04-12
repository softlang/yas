# File _samples/obsolete/expr/scanner.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/scanner.pro)**
```
% A scanner for the expr language
exprScanner(Input, Ts) :-
  tokens(
    token(['zero', 'succ', '(', ')', '+']),
    Input,
    Ts).

```
