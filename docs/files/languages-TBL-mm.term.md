# File _languages/TBL/mm.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/mm.term)**
```
[class(false,world,[],[ (part,persons,person,star)]),class(false,person,[],[ (value,name,string,one), (value,buddy,string,option)]),datatype(string)].
```

## Languages
* [MML](../languages/MML.md)

## References
* mapsTo(mmTransform,['languages/GBL/tblToGbl.term','languages/TBL/mm.term'],['languages/GBL/mm.term'])
* elementOf('languages/TBL/mm.term',mml(term))
* mapsTo(parse,['languages/TBL/mm.mml'],['languages/TBL/mm.term'])
* mapsTo(resolve,['languages/TBL/mm.term'],['languages/TBL/mm.graph'])
* elementOf('languages/TBL/mm.term',tree(mml(term)))
