# File _languages/MML/conformance/member.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/conformance/member.pro)**
```
% Conformance for values
memberConforms(_, _, V, value, Type, Times) :-
  lookup(class, Type, datatype),
  lookup(name, Type, Name1),
  mml2pro(Name1, Name2),
  cardinalityConforms(Times, Name2, V).

...
```
