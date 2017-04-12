# File _languages/BGL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/as.term)**
```
[type(grammar,star(sort(rule))),type(rule,tuple([sort(label),sort(nonterminal),sort(gsymbols)])),type(gsymbols,star(sort(gsymbol))),symbol(t,[sort(terminal)],gsymbol),symbol(n,[sort(nonterminal)],gsymbol),type(label,string),type(terminal,string),type(nonterminal,string)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/BGL/as.term',esl(term))
* mapsTo(parse,['languages/BGL/as.esl'],['languages/BGL/as.term'])
* membership(bgl(term),eslLanguage,['languages/BGL/as.term'])
