# File _languages/Ueber/macros/test.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/test.pro)**
```
% BEGIN ...
% Testing parsing and well-formedness
% END ...
% Positive sample for parsing
parseable(TextF) :-  
  file_name_extension(_, L, TextF), 
  TextL =.. [L, text],
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/Ueber/macros/test.pro',prolog(text))
