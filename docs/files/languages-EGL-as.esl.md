# File _languages/EGL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/as.esl)**
```
type grammar = rule* ;
type rule = label? # nonterminal # symbols ;
type symbols = symbol* ;
symbol t : terminal -> symbol ;
symbol n : nonterminal -> symbol ;
symbol star : symbols -> symbol ;
symbol plus : symbols -> symbol ;
symbol option : symbols -> symbol ;
symbol not : symbols -> symbol ;
type label = string ;
type terminal = string ;
type nonterminal = string ;
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/EGL/as.esl',esl(text))
* mapsTo(parse,['languages/EGL/as.esl'],['languages/EGL/as.term'])
