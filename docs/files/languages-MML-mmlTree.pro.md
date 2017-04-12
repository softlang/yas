# File _languages/MML/mmlTree.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/mmlTree.pro)**
```
% BEGIN ...
:- module(mmlTree, []).
% END ...
metamodel(Classifiers) :-
  map(mmlTree:classifier, Classifiers).

classifier(datatype(_)).
classifier(class(_, _, _, Members)) :-
  map(mmlTree:member, Members).

member((value, _, _, _)).
member((part, _, _, _)).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/mmlTree.pro',prolog(text))
