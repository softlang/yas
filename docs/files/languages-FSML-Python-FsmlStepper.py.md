# File _languages/FSML/Python/FsmlStepper.py_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/FsmlStepper.py)**
```
class FsmlStepper():

    def add(self, fromState, input, action, toState):
        if not fromState in self.fsm:
            self.fsm[fromState] = dict()
            self.fsm[fromState]["transitions"] = dict()
        self.fsm[fromState]["transitions"][input] = (action, toState)
...
```

## Languages
* [Python](../languages/Python.md) (python(text))

## References
* elementOf('languages/FSML/Python/FsmlStepper.py',python(text))
