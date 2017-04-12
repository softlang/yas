# File _languages/MML/mmlDdl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/mmlDdl.pro)**
```
:- module(mmlDdl, []).

% Simplicity of metamodels
metamodel(Classifiers) :-
  map(mmlDdl:simpleClassifier, Classifiers).

% Simplicity of classes
...
```
