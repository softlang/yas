# File _languages/Ueber/ueberMain.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberMain.pro)**
```
% Run the megamodel
ueberRun :-
  findall(D, udeclaration(D), Ds),
  initTesting,
  ueberReport:report(Ds),
  ( mode(verbose) ->
       format('~nMegamodel well-formedness:~n', []),
...
```
