# File _languages/FSML/tests/determinismNotOk.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/determinismNotOk.fsml)**
```
initial state stateA {
  eventI/actionI -> stateB;
  eventI/actionII -> stateC;
}
state stateB { }
state stateC { }
```
