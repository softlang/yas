-- BEGIN ...
module Language.EGL.Sample where
import Language.EGL.Syntax
-- END ...
sampleGrammar :: Grammar
sampleGrammar = [
  (Nothing,"fsm",[Star [N "state"]]),
  (Nothing,"state",[Option [T "initial"],T "state",N "stateid",T "{",Star [N "transition"],T "}"]),
  (Nothing,"transition",[N "event",Option [T "/",N "action"],Option [T "->",N "stateid"],T ";"]),
  (Nothing,"stateid",[N "identifier"]),
  (Nothing,"event",[N "identifier"]),
  (Nothing,"action",[N "identifier"])
 ]
