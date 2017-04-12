# File _languages/BFPL/Prolog/big-step/evaluate.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/big-step/evaluate.pro)**
```
% BEGIN ...
:- module(bfplBigstep, []).
% END ...
% Evaluate main expression of program
evaluate((Fs, E), V) :-
  evaluate(Fs, [], E, V).

...
```
