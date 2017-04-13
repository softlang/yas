# File _languages/TDL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TDL/as.term)**
```
[symbol(id,[],diff),symbol(replace,[term,term],diff),symbol(subterms,[star(sort(diff))],diff),symbol(list,[sort(diffl)],diff),symbol(nil,[],diffl),symbol(cons,[sort(diff),sort(diffl)],diffl),symbol(add,[term,sort(diffl)],diffl),symbol(sub,[term,sort(diffl)],diffl)].
```

## Languages
* [ESL](../languages/ESL.md) (esl(term))

## References
* elementOf('languages/TDL/as.term',esl(term))
* mapsTo(parse,['languages/TDL/as.esl'],['languages/TDL/as.term'])
* membership(tdl(term),eslLanguage,['languages/TDL/as.term'])
