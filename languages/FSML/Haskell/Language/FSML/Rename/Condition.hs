-- BEGIN ...
module Language.FSML.Rename.Condition(states) where
import Language.FSML.Syntax

-- END ...
states :: Fsm -> [StateId]
states fsm =
  concatMap (\s -> 
    getId s : map getTarget (getTransitions s))
      (getStates fsm)
