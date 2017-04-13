# File _languages/EGTL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/as.term)**
```
[symbol(sequ,[star(sort(trafo))],trafo),symbol(renameT,[sort(terminal),sort(terminal)],trafo),symbol(renameN,[sort(terminal),sort(terminal)],trafo),symbol(generalize,[sort(rule),sort(rule)],trafo),symbol(specialize,[sort(rule),sort(rule)],trafo),symbol(add,[sort(rule)],trafo),symbol(remove,[sort(rule)],trafo),type(rule,tuple([option(sort(label)),sort(nonterminal),sort(symbols)])),type(symbols,star(sort(symbol))),symbol(t,[sort(terminal)],symbol),symbol(n,[sort(nonterminal)],symbol),symbol(star,[sort(symbols)],symbol),symbol(plus,[sort(symbols)],symbol),symbol(option,[sort(symbols)],symbol),symbol(not,[sort(symbols)],symbol),type(label,string),type(terminal,string),type(nonterminal,string)].
```

## Languages
* [ESL](../languages/ESL.md) (esl(term))

## References
* elementOf('languages/EGTL/as.term',esl(term))
* mapsTo(parse,['languages/EGTL/as.esl'],['languages/EGTL/as.term'])
* membership(egtl(term),eslLanguage,['languages/EGTL/as.term'])
