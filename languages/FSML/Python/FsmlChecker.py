import sys
import json
from FsmlConstraints import ok
from FsmlExceptions import FsmlException

try:
    fsm = json.load(open(sys.argv[1], 'r'))
    ok(fsm)
except FsmlException:
    sys.exit(1)
