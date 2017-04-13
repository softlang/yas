# File _languages/TBL/mm.mml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/mm.mml)**
```
class world { part persons : person* ; }
class person {
  value name : string ;
  value buddy : string? ;
}
datatype string ;
```

## Languages
* [MML](../languages/MML.md) (mml(text))

## References
* elementOf('languages/TBL/mm.mml',mml(text))
* mapsTo(parse,['languages/TBL/mm.mml'],['languages/TBL/mm.term'])
