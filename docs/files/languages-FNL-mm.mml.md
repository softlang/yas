# File _languages/FNL/mm.mml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FNL/mm.mml)**
```
class family {
  value name : atom;
  part members : person*;
}
class person {
  value firstName : atom;
  value emailAddresses : atom*;
  value closestFriend : atom?;
}
datatype atom;
```

## Languages
* [MML](../languages/MML.md) (mml(text))

## References
* elementOf('languages/FNL/mm.mml',mml(text))
* mapsTo(parse,['languages/FNL/mm.mml'],['languages/FNL/mm.term'])
