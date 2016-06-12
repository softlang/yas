-- BEGIN ...
module Language.FSML.Sample where
import Language.FSML.Syntax
-- END ...
sampleFsm :: Fsm
sampleFsm = [
  (True, "locked", [
    ("ticket", Just "collect", "unlocked"),
    ("pass", Just "alarm", "exception")]),
  (False, "unlocked", [
    ("ticket", Just "eject", "unlocked"),
    ("pass", Nothing, "locked")]),
  (False, "exception", [
    ("ticket", Just "eject", "exception"),
    ("pass", Nothing, "exception"),
    ("mute", Nothing, "exception"),
    ("release", Nothing, "locked")])
 ]
