# File _languages/MML/mm.mml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/mm.mml)**
```
abstract class base { value name : string; }
class metamodel { part classifiers : classifier*; }
abstract class classifier extends base { }
class datatype extends classifier { }
class class extends classifier {
  value abstract : boolean;
  reference super : class?;
...
```
