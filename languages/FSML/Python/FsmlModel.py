# BEGIN ...
from collections import defaultdict
# END ...
class Fsm():
    def __init__(self):
    	self.fsm = defaultdict(list)
    	self.stateObject = dict()
    	self.currentState = ""
    def addState(self, idText):
        return self.addStateNoDefault(self.currentState=="", idText)
    def addStateNoDefault(self, initial, idText):
        self.stateObject = dict()
        self.stateObject['transitions'] = defaultdict(list)
        self.stateObject['initial'] = initial
        self.fsm[idText] += [self.stateObject]
        self.currentState = idText
        return self
    def addTransition(self, inputText, actionText, targetStateText):
        self.stateObject['transitions'][inputText] += \
          [(actionText, \
            self.currentState if targetStateText is None else targetStateText)]
        return self
