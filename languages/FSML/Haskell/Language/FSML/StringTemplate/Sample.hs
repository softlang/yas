-- BEGIN ...
module Language.FSML.StringTemplate.Sample where
import Language.FSML.StringTemplate.Syntax
-- END ...
sampleFsm :: Fsm
sampleFsm =
 Fsm [
  State {
   initial=True,
   stateid="locked",
   transitions=[
    Transition { event="ticket", action=Just "collect", target=Just "unlocked" },
    Transition { event="pass", action=Just "alarm", target=Just "exception" }
   ]
  },
  State {
   initial=False,
   stateid="unlocked",
   transitions=[
    Transition { event="ticket", action=Just "eject", target=Nothing },
    Transition { event="pass", action=Nothing, target=Just "locked" }
   ]
  },
  State {
   initial=False,
   stateid="exception",
   transitions=[
    Transition { event="ticket", action=Just "eject", target=Nothing },
    Transition { event="pass", action=Nothing, target=Nothing },
    Transition { event="mute", action=Nothing, target=Nothing },
    Transition { event="release", action=Nothing, target=Just "locked" }
   ]
  }
 ]
