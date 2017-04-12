# File _languages/BGL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/as.esl)**
```
type grammar = rule* ;
type rule = label # nonterminal # gsymbols ;
type gsymbols = gsymbol* ;
symbol t : terminal -> gsymbol ;
symbol n : nonterminal -> gsymbol ;
type label = string ;
type terminal = string ;
type nonterminal = string ;
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/BGL/as.esl',esl(text))
* mapsTo(parse,['languages/BGL/as.esl'],['languages/BGL/as.term'])
