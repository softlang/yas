# File _languages/FSML/Python/FsmlPythonGenerator.py_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/FsmlPythonGenerator.py)**
```
# BEGIN ...
import json
import sys
from jinja2 import Environment, FileSystemLoader
# END ...
def generatePython(fsm):
        actions = set() # Accumulate actions for handler class
...
```
