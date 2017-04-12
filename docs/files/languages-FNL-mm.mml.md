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
