# BEGIN ...
from FsmlStepper import FsmlStepper
from Handler import Handler
# END ...
class Stepper(FsmlStepper):

    def __init__(self):
        self.fsm = dict()
        self.currentState = "locked"
        self.handler = Handler()
        self.add("unlocked", "pass", None, "locked")
        self.add("unlocked", "ticket", "eject", "unlocked")
        self.add("locked", "pass", "alarm", "exception")
        self.add("locked", "ticket", "collect", "unlocked")
        self.add("exception", "mute", None, "exception")
        self.add("exception", "pass", None, "exception")
        self.add("exception", "ticket", "eject", "exception")
        self.add("exception", "release", None, "locked")
        