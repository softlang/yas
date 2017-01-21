-- BEGIN ...
module Language.FSML.Merge.Sample(turnstileFsm) where
import Language.FSML.Syntax
import Language.FSML.Merge.Transformation
-- END ...

turnstileFsm :: Maybe Fsm
turnstileFsm = sampleFsmRegular `merge` sampleFsmException

sampleFsmRegular, sampleFsmException :: Fsm
sampleFsmRegular = Fsm [
  State True "locked" [
    (Transition "ticket" (Just "collect") "unlocked") ],
  State False "unlocked" [
    (Transition "ticket" (Just "eject") "unlocked"),
    (Transition "pass" Nothing "locked") ]
 ]
sampleFsmException = Fsm [
  State True "locked" [
    (Transition "pass" (Just "alarm") "exception") ],
  State False "exception" [
    (Transition "ticket" (Just "eject") "exception"),
    (Transition "pass" Nothing "exception"),
    (Transition "mute" Nothing "exception"),
    (Transition "release" Nothing "locked") ]
 ]
