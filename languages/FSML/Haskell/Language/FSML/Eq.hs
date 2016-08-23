-- BEGIN ...
module Language.FSML.Eq where
import Language.FSML.Syntax (Fsm, getStates)
import Language.FSML.Normalization
-- END ...
instance Eq Fsm where
  x == y =
    getStates (normalize x) == getStates (normalize y)
