# File _languages/FSML/Python/FsmlChecker.py_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/FsmlChecker.py)**
```
import sys
import json
from FsmlConstraints import ok
from FsmlExceptions import FsmlException

try:
    fsm = json.load(open(sys.argv[1], 'r'))
    ok(fsm)
except FsmlException:
    sys.exit(1)
```

## Languages
* [Python](../languages/Python.md)

## References
* elementOf('languages/FSML/Python/FsmlChecker.py',python(text))
