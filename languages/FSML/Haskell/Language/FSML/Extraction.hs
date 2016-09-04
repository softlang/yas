-- BEGIN ...
module Language.FSML.Extraction where
import Language.FSML.Syntax
import Data.Map (Map, fromList)
import Data.List (nub)
-- END ...
inouts :: Fsm -> Map StateId (Int, Int)
inouts (Fsm ss) = fromList (map perState ss)
  where
    perState s =
      ( (getId s), -- The stateid
        ( ins (getId s), -- Number of states transition to s
          outs s ) ) -- Number of states transitioned to from s
      where
        ins :: StateId -> Int
        ins sid = length (filter f ss)
          where
            f :: State -> Bool
            f (State _ sid' ts) =
              elem sid [ sid'' | Transition _ _ sid'' <- ts, sid'' /= sid' ]
        outs :: State -> Int
        outs (State _ sid ts) =
          length (nub [ sid' | Transition _ _ sid' <- ts, sid /= sid' ])
