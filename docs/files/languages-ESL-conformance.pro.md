# File _languages/ESL/conformance.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ESL/conformance.pro)**
```
% Apply symbol declaration
wellTypedTerm(Decls, sort(Result), Term) :-
  \+ (list(Term); tuple(Term)),
  Term =.. [FSym|Terms],
  member(symbol(FSym, Args, Result), Decls),
  map(wellTypedTerm(Decls), Args, Terms).

...
```
