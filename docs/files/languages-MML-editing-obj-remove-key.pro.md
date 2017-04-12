# File _languages/MML/editing/obj-remove-key.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/editing/obj-remove-key.pro)**
```
% Remove a key from certain objects
removeKey(
  P, % Predicate for object selection
  Key, % Key to be removed
  O1, O2)
 :-
    topdownGraph(
      removeKey_(P, Key, O1),
      O1, O2).

% Per-object logic
removeKey_(P, Key, R, O1, O2) :-
  apply(P, [R, O1]),
  remove(Key, O1, O2).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/editing/obj-remove-key.pro',prolog(text))
