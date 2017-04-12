# File _languages/EGTL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/as.esl)**
```
symbol sequ : trafo* -> trafo ;
symbol renameT : terminal # terminal -> trafo ;
symbol renameN : terminal # terminal -> trafo ;
symbol generalize : rule # rule -> trafo ;
symbol specialize : rule # rule -> trafo ;
symbol add : rule -> trafo ;
symbol remove : rule -> trafo ;
...
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/EGTL/as.esl',esl(text))
* mapsTo(parse,['languages/EGTL/as.esl'],['languages/EGTL/as.term'])
