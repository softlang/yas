# File _languages/TDL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TDL/as.esl)**
```
symbol id : -> diff ;
symbol replace : term # term -> diff ;
symbol subterms : diff* -> diff ;
symbol list : diffl -> diff ;
symbol nil : -> diffl ;
symbol cons : diff # diffl -> diffl ;
symbol add : term # diffl -> diffl ;
symbol sub : term # diffl -> diffl ;
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/TDL/as.esl',esl(text))
* mapsTo(parse,['languages/TDL/as.esl'],['languages/TDL/as.term'])
