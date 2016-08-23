-- BEGIN ...
module Language.FSML.Rename.Transformation(rename) where
import Language.FSML.Syntax
import Language.FSML.Rename.Condition
import Control.Monad (guard)

-- END ...
rename :: StateId -> StateId -> Fsm -> Maybe Fsm
rename i i' x = do
    guard pre
    guard post
    return y
  where
    pre = elem i (states x) && not (elem i' (states x))
    post = not (elem i (states y)) && elem i' (states y)
    y = Fsm (map perState (getStates x))
    perState s =
      State
        (getInitial s)
        (if getId s == i then i' else getId s)
        (map perTransition (getTransitions s))
    perTransition t =
      Transition
        (getEvent t)
        (getAction t)
        (if getTarget t == i then i' else getTarget t)
