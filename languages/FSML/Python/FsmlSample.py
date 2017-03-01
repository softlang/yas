# BEGIN ...
from FsmlModel import Fsm
# END ...
turnstile = \
  Fsm() \
    .addState("locked") \
      .addTransition("ticket", "collect", "unlocked") \
      .addTransition("pass", "alarm", "exception") \
    .addState("unlocked") \
      .addTransition("ticket", "eject", "unlocked") \
      .addTransition("pass", None, "locked") \
    .addState("exception") \
      .addTransition("ticket", "eject", "exception") \
      .addTransition("pass", None, "exception") \
      .addTransition("mute", None, "exception") \
      .addTransition("release", None, "locked")
