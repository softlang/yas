class Handler():

    def __init__(self):
        self.actions = dict()
        self.actions['']= self.handleEmpty
        self.actions['collect']= self.handleCollect
        self.actions['alarm']= self.handleAlarm
        self.actions['eject']= self.handleEject
        
    def handle(self, Action):
        self.actions[Action]()
    
    def handleEmpty(self):
        pass
    
    def handleCollect(self):
        pass
    
    def handleAlarm(self):
        pass
    
    def handleEject(self):
        pass
    