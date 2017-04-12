# File _languages/FRL/FRL2/dd.ddl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/FRL2/dd.ddl)**
```
CREATE TABLE family (
  objectId INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(42) NOT NULL
);

CREATE TABLE person (
  objectId INTEGER NOT NULL PRIMARY KEY,
...
```

## Languages
* [DDL](../languages/DDL.md)

## References
* elementOf('languages/FRL/FRL2/dd.ddl',ddl(text))
* mapsTo(parse,['languages/FRL/FRL2/dd.ddl'],['languages/FRL/FRL2/dd.term'])
