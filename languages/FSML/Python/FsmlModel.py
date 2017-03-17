# BEGIN ...
from collections import defaultdict
from FsmlExceptions import *
# END ...
class Fsm():
    def __init__(self):
    	self.fsm = defaultdict(list)
    	self.current = None
    def addState(self, id):
        return self.addStateNoDefault(self.current is None, id)
    def addStateNoDefault(self, initial, id):
        if id in self.fsm[id]: raise FsmlDistinctIdsException;
        self.stateObject = dict()
        self.stateObject['transitions'] = defaultdict(list)
        self.stateObject['initial'] = initial
        self.fsm[id] += [self.stateObject]
        self.current = id
        return self
    def addTransition(self, event, action, target):
        if event in self.stateObject['transitions']: raise FsmlDeterminismException;
        self.stateObject['transitions'][event] += \
          [(action, self.current if target is None else target)]
        return self
