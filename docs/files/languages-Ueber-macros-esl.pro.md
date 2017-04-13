# File _languages/Ueber/macros/esl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/esl.pro)**
```
% BEGIN ...
% ESL-based abstract syntax definition
% END ...
eslSyntax(Lang) :-
  TermLang =.. [Lang, term],
  ueber([
    language(TermLang),
    elementOf('as.esl', esl(text)),
    elementOf('as.term', esl(term)),
    mapsTo(parse, ['as.esl'], ['as.term']),
    membership(TermLang, eslLanguage, ['as.term'])
  ]).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/Ueber/macros/esl.pro',prolog(text))
