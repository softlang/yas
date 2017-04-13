# File _languages/Term/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/.ueber)**
```
[
  % Abstract sublanguages of term
  language(deps(term)), % File dependencies for building
  membership(deps(term), succeed, []),
  language(ini(term)), % Configuration data
  language(tokens(term)), % Token sequences as input for parsing
  language(value(term)), % Values as computed by semantics
  language(formula(term)), % Formulae as computed by semantics
  language(normal(term)), % Normal forms as computed by semantics
  language(store(term)), % Stores as manipulated by semantics
  language(type(term)) % Types as manipulated by type systems
].
```

## Languages
* [Ueber](../languages/Ueber.md) (ueber(term))

## References
* elementOf('languages/Term/.ueber',ueber(term))
