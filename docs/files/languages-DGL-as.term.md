# File _languages/DGL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DGL/as.term)**
```
[type(graph,tuple([star(sort(node)),star(sort(edge))])),type(node,tuple([sort(id),sort(label),sort(shape),option(sort(style))])),type(edge,tuple([sort(id),sort(id),option(sort(label))])),type(id,string),type(label,string),symbol(box,[],shape),symbol(ellipse,[],shape),symbol(bold,[],style),symbol(dotted,[],style),symbol(filled,[],style)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/DGL/as.term',esl(term))
* mapsTo(parse,['languages/DGL/as.esl'],['languages/DGL/as.term'])
* membership(dgl(term),eslLanguage,['languages/DGL/as.term'])
