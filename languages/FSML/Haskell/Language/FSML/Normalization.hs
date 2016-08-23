-- BEGIN ...
module Language.FSML.Normalization where
import Language.FSML.Syntax
import Data.List (sort, sortOn)
-- END ...
normalize :: Fsm -> Fsm
normalize =
    Fsm
  . sortOn getId
  . map (\s -> State
                 (getInitial s)
                 (getId s)
                 (sort (getTransitions s)))
  . getStates
