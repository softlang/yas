-- BEGIN ...
module Language.FSML.Rename.Condition (pre, post) where
import Language.FSML.Syntax
-- END ...
pre, post :: StateId -> StateId -> Fsm -> Bool
pre i i' x = elem i (states x) && not (elem i' (states x))
post i i' y = not (elem i (states y)) && elem i' (states y)
states :: Fsm -> [StateId]
states fsm =
  concatMap (\s -> 
    getId s : map getTarget (getTransitions s))
      (getStates fsm)
