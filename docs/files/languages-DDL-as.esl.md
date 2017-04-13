# File _languages/DDL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DDL/as.esl)**
```
type schema = table* ;
type table = tname # column* ;
type column = cname # type # clause* ;
symbol integer : -> type ;
symbol varchar : integer -> type ;
symbol notNull : -> clause ;
symbol primaryKey : -> clause ;
symbol foreignKey : tname # cname -> clause ;
type tname = string ;
type cname = string ;
```

## Languages
* [ESL](../languages/ESL.md) (esl(text))

## References
* elementOf('languages/DDL/as.esl',esl(text))
* mapsTo(parse,['languages/DDL/as.esl'],['languages/DDL/as.term'])
