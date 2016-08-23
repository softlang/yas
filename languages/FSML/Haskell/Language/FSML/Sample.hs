-- BEGIN ...
module Language.FSML.Sample where
import Language.FSML.Syntax
-- END ...
sampleFsm :: Fsm
sampleFsm = Fsm [
  State True "locked" [
    (Transition "ticket" (Just "collect") "unlocked"),
    (Transition "pass" (Just "alarm") "exception") ],
  State False "unlocked" [
    (Transition "ticket" (Just "eject") "unlocked"),
    (Transition "pass" Nothing "locked") ],
  State False "exception" [
    (Transition "ticket" (Just "eject") "exception"),
    (Transition "pass" Nothing "exception"),
    (Transition "mute" Nothing "exception"),
    (Transition "release" Nothing "locked") ]
 ]
