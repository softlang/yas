-- BEGIN ...
module Language.FSML.Extraction where
import Language.FSML.Syntax
import Data.Map (Map, fromList)
import Data.List (nub)
-- END ...
inouts :: Fsm -> Map StateId (Int, Int)
inouts (Fsm ss) = fromList (map f ss)
  where
    -- Per-state fact extraction
    f (State _ sid ts) = (sid, (ins, outs))
      where
        -- Number of states from which sid is reached directly
        ins = length (filter g ss)
          where g (State _ sid' ts') =
                  elem sid [ sid'' | Transition _ _ sid'' <- ts', sid'' /= sid' ]
        -- Number of states reached directly from sid
        outs = length (nub [ sid' | Transition _ _ sid' <- ts, sid /= sid' ])
