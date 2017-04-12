# File _languages/EGL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/as.term)**
```
[type(grammar,star(sort(rule))),type(rule,tuple([option(sort(label)),sort(nonterminal),sort(symbols)])),type(symbols,star(sort(symbol))),symbol(t,[sort(terminal)],symbol),symbol(n,[sort(nonterminal)],symbol),symbol(star,[sort(symbols)],symbol),symbol(plus,[sort(symbols)],symbol),symbol(option,[sort(symbols)],symbol),symbol(not,[sort(symbols)],symbol),type(label,string),type(terminal,string),type(nonterminal,string)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/EGL/as.term',esl(term))
* mapsTo(parse,['languages/EGL/as.esl'],['languages/EGL/as.term'])
* membership(egl(term),eslLanguage,['languages/EGL/as.term'])
