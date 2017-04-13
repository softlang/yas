# File _languages/Ueber/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/as.esl)**
```
type model = decl* ;
symbol language : lang -> decl ;
symbol elementOf : file # lang -> decl ;
symbol notElementOf : file # lang -> decl ;
symbol membership : lang # goal # file* -> decl ;
symbol relation : rela # lang* # goal # file* -> decl ;
symbol relatesTo : rela # file* -> decl ;
...
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/Ueber/as.esl',esl(text))
* mapsTo(parse,['languages/Ueber/as.esl'],['languages/Ueber/as.term'])
