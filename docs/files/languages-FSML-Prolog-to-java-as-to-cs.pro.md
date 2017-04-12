# File _languages/FSML/Prolog/to-java/as-to-cs.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/to-java/as-to-cs.pro)**
```
% Render Java declaration
ppJavaDecl(J, S) :-
  once(ppJavaDecl_(J, B)),
  pplRender:render(vbox(text('// Generated code'), B), S).

% Render class declaration
ppJavaDecl_(
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/FSML/Prolog/to-java/as-to-cs.pro',prolog(text))
