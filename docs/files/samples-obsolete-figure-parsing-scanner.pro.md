# File _samples/obsolete/figure/parsing/scanner.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/figure/parsing/scanner.pro)**
```
% (Non-negative) integer literals
figureToken(integer(Int)) -->
  plus(char(digit), Digits),
  {  number_codes(Int, Digits) }.

% Keywords and special characters
figureToken(Atom) -->
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('samples/obsolete/figure/parsing/scanner.pro',prolog(text))
