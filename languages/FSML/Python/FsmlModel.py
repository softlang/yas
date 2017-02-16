# BEGIN ...
from collections import defaultdict
# END ...
class FsmlModel():

    def __init__(self):
    	self.fsm = defaultdict(list)
    	self.stateObject = dict()
    	self.currentState = ""

    def addState(self, initial, idText):
        self.stateObject = dict()
        self.stateObject['transitions'] = defaultdict(list)
        self.stateObject['initial'] = initial
        self.fsm[idText] += [self.stateObject]
        self.currentState = idText

    def addTransition(self, inputText, actionText, targetStateText):
        self.stateObject['transitions'][inputText] += \
          [(actionText, self.currentState if targetStateText is None else targetStateText)]
