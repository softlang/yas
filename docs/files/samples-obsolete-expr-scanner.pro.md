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

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('samples/obsolete/expr/scanner.pro',prolog(text))
