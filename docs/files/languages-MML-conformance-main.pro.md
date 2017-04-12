# File _languages/MML/conformance/main.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/conformance/main.pro)**
```
% Conformance of model to a metamodel
conforms(M, MM) :-
  require(
    graphMissing,
    graph(M)),
  require(
    metamodelMissing,
...
```
