# File _languages/BCL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BCL/as.esl)**
```
symbol leaf : terminal -> ptree ;
symbol fork : rule # ptree* -> ptree ;
// Rules as in BGL
// ...
// BEGIN ...
type rule = label # nonterminal # symbols ;
type symbols = symbol* ;
symbol t : terminal -> symbol ;
symbol n : nonterminal -> symbol ;
type label = string ;
type terminal = string ;
type nonterminal = string ;
// END ...
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/BCL/as.esl',esl(text))
* mapsTo(parse,['languages/BCL/as.esl'],['languages/BCL/as.term'])
