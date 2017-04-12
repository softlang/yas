# File _languages/BFPL/Prolog/denotational/expr.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/denotational/expr.pro)**
```
% Meaning of constants
meaningExpr(
  _, % Program irrelevant
  intconst(I), % Syntactical phrase
  const(intval(I)) % Constant function on the environment
).

...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/BFPL/Prolog/denotational/expr.pro',prolog(text))
