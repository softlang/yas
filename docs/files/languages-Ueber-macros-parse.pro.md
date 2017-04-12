# File _languages/Ueber/macros/parse.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/parse.pro)**
```
% BEGIN ...
% Parse a text file to a term
% END ...
parseFile(TextF) :-
  file_name_extension(Base, L, TextF),
  file_name_extension(Base, term, TermF),
  TextL =.. [L, text],
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Ueber/macros/parse.pro',prolog(text))
