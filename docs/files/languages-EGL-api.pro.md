# File _languages/EGL/api.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/api.pro)**
```
eglAcceptor(Mapping, FileCs, FileLs, Text) :-
  eglLanguage(Mapping, FileCs, FileLs, Text).
eglLanguage(Mapping, FileCs, FileLs, Text) :-
  eglParser(Mapping, FileCs, FileLs, Text, _).
eglParser(Mapping, FileCs, FileLs, Text, Term) :-
  eglParser(layout, Mapping, FileCs, FileLs, Text, Term).
eglParser(Layout, Mapping, FileCs, FileLs, Text, Term) :-
...
```
