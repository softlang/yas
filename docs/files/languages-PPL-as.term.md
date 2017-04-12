# File _languages/PPL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/PPL/as.term)**
```
[symbol(empty,[],box),symbol(text,[string],box),symbol(integer,[integer],box),symbol(hbox,[sort(box),sort(box)],box),symbol(hlist,[star(sort(box))],box),symbol(hseplist,[sort(box),star(sort(box))],box),symbol(vbox,[sort(box),sort(box)],box),symbol(vlist,[star(sort(box))],box),symbol(indent,[sort(box)],box)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/PPL/as.term',esl(term))
* mapsTo(parse,['languages/PPL/as.esl'],['languages/PPL/as.term'])
* membership(ppl(term),eslLanguage,['languages/PPL/as.term'])
