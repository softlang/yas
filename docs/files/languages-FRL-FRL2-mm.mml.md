# File _languages/FRL/FRL2/mm.mml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/FRL2/mm.mml)**
```
class family {
  value name : atom;
  part members : person*;
}
class person {
  value firstName : atom;
  value lastName : atom;
  value emailAddresses : atom*;
  reference closestFriend : person?;
}
datatype atom;
```

## Languages
* [MML](../languages/MML.md) (mml(text))

## References
* elementOf('languages/FRL/FRL2/mm.mml',mml(text))
* mapsTo(parse,['languages/FRL/FRL2/mm.mml'],['languages/FRL/FRL2/mm.term'])
