-- BEGIN ...
module Language.FSML.Merge.Transformation(merge) where
import Language.FSML.Syntax
import Language.FSML.Merge.Condition
import Data.List (nub)
import Data.Map (fromList, toList, unionWith)
import Control.Monad (guard)
-- END ...
merge :: Fsm -> Fsm -> Maybe Fsm
merge x y = do
    guard $ ok x
    guard $ ok y
    let z = fromMap (unionWith f (toMap x) (toMap y))
    guard $ ok z
    return z
  where
    f sx sy = State
        (getInitial sx || getInitial sy)
        (getId sx)
        (nub (getTransitions sx ++ getTransitions sy))
    toMap = fromList . map (\s -> (getId s, s)) . getStates
    fromMap = Fsm . map snd . toList
