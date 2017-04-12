# File _languages/BNL/samples/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/samples/.ueber)**
```
[
  macro(parseFilePickily('10.bnl')),
  macro(parseFilePickily('5comma25.bnl')),

  % Results of BNL evaluation
  elementOf('5comma25.formula', bnl(formula(term))),
  elementOf('5comma25.value', bnl(value(term))),
...
```

## Languages
* [Ueber](../languages/Ueber.md)

## References
* elementOf('languages/BNL/samples/.ueber',ueber(term))
