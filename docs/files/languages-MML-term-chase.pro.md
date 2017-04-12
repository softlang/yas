# File _languages/MML/term-chase.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/term-chase.pro)**
```
% End of chasing
chaseMembers(_, [], []).

% Chase along "super"
chaseMembers(Classifiers, [Name], Members3) :-
  member(class(_, Name, Super, Members1), Classifiers),
  chaseMembers(Classifiers, Super, Members2),
  append(Members1, Members2, Members3).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/term-chase.pro',prolog(text))
