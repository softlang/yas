# File _languages/GBL/mm.mml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/mm.mml)**
```
class world { part persons : person* ; }
class person {
  value name : string ;
  reference buddy : person? ;
}
datatype string ;
```

## Languages
* [MML](../languages/MML.md)

## References
* elementOf('languages/GBL/mm.mml',mml(text))
* mapsTo(parse,['languages/GBL/mm.mml'],['languages/GBL/mm.term'])
