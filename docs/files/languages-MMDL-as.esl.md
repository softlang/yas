# File _languages/MMDL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MMDL/as.esl)**
```
symbol sequ : diff* -> diff ;
symbol removeClassifier : classifier -> diff ;
symbol removeMember : cname # member -> diff ;
symbol addClassifier : classifier -> diff ;
symbol addMember : cname # member -> diff ;

// MML constructs
...
```

## Languages
* [ESL](../languages/ESL.md)

## References
* elementOf('languages/MMDL/as.esl',esl(text))
* mapsTo(parse,['languages/MMDL/as.esl'],['languages/MMDL/as.term'])
