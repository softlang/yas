# File _languages/FSML/Python/FsmlSample.py_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/FsmlSample.py)**
```
# BEGIN ...
from FsmlModel import Fsm
# END ...
turnstile = \
  Fsm() \
    .addState("locked") \
      .addTransition("ticket", "collect", "unlocked") \
...
```

## Languages
* [Python](../languages/Python.md)

## References
* elementOf('languages/FSML/Python/FsmlSample.py',python(text))
