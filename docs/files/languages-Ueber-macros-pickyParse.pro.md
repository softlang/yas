# File _languages/Ueber/macros/pickyParse.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/pickyParse.pro)**
```
% BEGIN ...
% Pattern of parsing a
% END ...
parseFilePickily(TextF) :-
  file_name_extension(Base, L, TextF),
  file_name_extension(Base, tokens, TokensF),
  file_name_extension(Base, tree, TreeF),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Ueber/macros/pickyParse.pro',prolog(text))
