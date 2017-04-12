# File _languages/LAL/config/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/config/as.term)**
```
[type(config,star(sort(entry))),symbol(sort,[string,term],entry),symbol(constant,[string,string],entry),symbol(function,[string,string],entry),symbol(relation,[string,string],entry),symbol(axiom,[string,sort(map)],entry),type(map,star(tuple([string,string])))].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/LAL/config/as.term',esl(term))
* mapsTo(parse,['languages/LAL/config/as.esl'],['languages/LAL/config/as.term'])
* membership(lal(config(term)),eslLanguage,['languages/LAL/config/as.term'])
