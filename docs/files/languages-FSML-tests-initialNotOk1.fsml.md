# File _languages/FSML/tests/initialNotOk1.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/initialNotOk1.fsml)**
```
state stateA {
  eventI/actionI -> stateB;
}
state stateB {
  eventII/actionII -> stateA;
}
```
