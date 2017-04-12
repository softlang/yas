# File _languages/Ueber/macros/ppl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/ppl.pro)**
```
% Pretty print an AST to text
ppFile(TextFile) :-
  file_name_extension(Base, Lang, TextFile),
  file_name_extension(Base, term, TermFile),
  file_name_extension(Base, ppl, PplFile),
  TextLang =.. [Lang, text],
  TermLang =.. [Lang, term],
...
```
