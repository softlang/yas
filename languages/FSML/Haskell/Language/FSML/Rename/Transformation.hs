-- BEGIN ...
module Language.FSML.Rename.Transformation(rename) where
import Language.FSML.Syntax
import Language.FSML.Rename.Condition
import Control.Monad (guard)

-- END ...
rename :: StateId -> StateId -> Fsm -> Maybe Fsm
rename i i' x = do
    guard $ pre i i' x
    guard $ post i i' y
    return y
  where
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
