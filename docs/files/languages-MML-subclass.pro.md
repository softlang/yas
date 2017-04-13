# File _languages/MML/subclass.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/subclass.pro)**
```
% Subclassing is reflective
subclassOf(_, N, N).

% Subclassing considers super
subclassOf(MM, N1, N2) :-
  N1 \= N2,
  lookupClass(N1, MM, C),
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/MML/subclass.pro',prolog(text))
