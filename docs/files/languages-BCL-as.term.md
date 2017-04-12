# File _languages/BCL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BCL/as.term)**
```
[symbol(leaf,[sort(terminal)],ptree),symbol(fork,[sort(rule),star(sort(ptree))],ptree),type(rule,tuple([sort(label),sort(nonterminal),sort(symbols)])),type(symbols,star(sort(symbol))),symbol(t,[sort(terminal)],symbol),symbol(n,[sort(nonterminal)],symbol),type(label,string),type(terminal,string),type(nonterminal,string)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/BCL/as.term',esl(term))
* mapsTo(parse,['languages/BCL/as.esl'],['languages/BCL/as.term'])
* membership(bcl(term),eslLanguage,['languages/BCL/as.term'])
