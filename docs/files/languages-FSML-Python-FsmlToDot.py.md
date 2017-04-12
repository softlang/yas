# File _languages/FSML/Python/FsmlToDot.py_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/FsmlToDot.py)**
```
import sys
import json
from FsmlVisualizer import draw
from FsmlExceptions import FsmlException

try:
    jsonFile = open(sys.argv[1], 'r')
    fsm = json.load(jsonFile)
    draw(fsm).write(sys.argv[2])
except FsmlException:
    sys.exit(1)
```
