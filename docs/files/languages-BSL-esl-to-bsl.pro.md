# File _languages/BSL/esl-to-bsl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/esl-to-bsl.pro)**
```
/*
Map more complex ESL signature notation to BSL
*/

eslToBsl(Ss1, Ss2) :-
  map(eslToBslSymbol, Ss1, Ss2).

...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BSL/esl-to-bsl.pro',prolog(text))
