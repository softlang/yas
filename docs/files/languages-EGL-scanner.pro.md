# File _languages/EGL/scanner.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/scanner.pro)**
```
% Quoted string literals
eglToken(qstring(Atom)) -->
  char(quote),
  star(not(char(quote)), String),
  char(quote),
  { atom_codes(Atom, String) }.

...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EGL/scanner.pro',prolog(text))
