# File _languages/FSML/Python/FsmlResolutionNotOk.py_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/FsmlResolutionNotOk.py)**
```
# BEGIN ...
from FsmlModel import Fsm
# END ...
resolutionNotOk = \
  Fsm() \
    .addState("stateA") \
      .addTransition("eventI", "actionI", "stateB") \
      .addTransition("eventII", "actionII", "stateC") \
    .addState("stateB")
```

## Languages
* [Python](../languages/Python.md)

## References
* elementOf('languages/FSML/Python/FsmlResolutionNotOk.py',python(text))
