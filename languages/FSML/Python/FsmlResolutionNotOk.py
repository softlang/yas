# BEGIN ...
from FsmlModel import Fsm
# END ...
resolutionNotOk = \
  Fsm() \
    .addState("stateA") \
      .addTransition("eventI", "actionI", "stateB") \
      .addTransition("eventII", "actionII", "stateC") \
    .addState("stateB")
