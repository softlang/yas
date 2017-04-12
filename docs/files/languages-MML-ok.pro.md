# File _languages/MML/ok.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/ok.pro)**
```
% Wellness of metamodels
metamodelOk(Classifiers) :-

  % Uniqueness of classifier names
  map(nameOfClassifier, Classifiers, Names),
  set(Names),

...
```
