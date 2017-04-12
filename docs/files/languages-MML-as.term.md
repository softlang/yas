# File _languages/MML/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/as.term)**
```
[type(metamodel,star(sort(classifier))),symbol(class,[sort(abstract),sort(cname),option(sort(extends)),star(sort(member))],classifier),symbol(datatype,[sort(cname)],classifier),type(member,tuple([sort(kind),sort(mname),sort(cname),sort(cardinality)])),symbol(value,[],kind),symbol(part,[],kind),symbol(reference,[],kind),symbol(one,[],cardinality),symbol(option,[],cardinality),symbol(star,[],cardinality),type(abstract,boolean),type(extends,sort(cname)),type(cname,string),type(mname,string)].
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/MML/as.term',esl(term))
* mapsTo(parse,['languages/MML/as.esl'],['languages/MML/as.term'])
* membership(mml(term),eslLanguage,['languages/MML/as.term'])
