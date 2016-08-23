-- BEGIN ...
module Language.FSML.Rename.Sample where
import Language.FSML.Syntax
import qualified Language.FSML.Sample
import Language.FSML.Rename.Transformation
-- END ...
sampleFsm :: Maybe Fsm
sampleFsm = do
  let fsm1 = Language.FSML.Sample.sampleFsm
  fsm2 <- rename "locked" "closed" fsm1
  rename "unlocked" "open" fsm2
  
baseline :: Fsm
baseline = Fsm [
  State True "closed" [
    (Transition "ticket" (Just "collect") "open"),
    (Transition "pass" (Just "alarm") "exception") ],
  State False "open" [
    (Transition "ticket" (Just "eject") "open"),
    (Transition "pass" Nothing "closed") ],
  State False "exception" [
    (Transition "ticket" (Just "eject") "exception"),
    (Transition "pass" Nothing "exception"),
    (Transition "mute" Nothing "exception"),
    (Transition "release" Nothing "closed") ]
 ]
