-- BEGIN ...
module Language.FSML.Interpreter where
import Language.FSML.Syntax
import Language.FSML.Domains
import Data.Maybe (maybeToList)

-- END ...
-- FSM simulation starting from initial state
simulate :: Fsm -> Input -> Output
simulate (Fsm ss) xs = snd (foldl makeTransition (getInitial, []) xs)
  where
    -- Look up initial state
    getInitial :: StateId
    getInitial = ini
      where [State _ ini _] =
              [ s | s@(State initial _ _) <- ss, initial ]

    -- Process event; extent output
    makeTransition :: (StateId, Output) -> Event -> (StateId, Output)
    makeTransition (source, as) x = (target, as ++ maybeToList a)
      where
        (Transition _ a target) = getTransition source x

    -- Look up transition
    getTransition :: StateId -> Event -> Transition
    getTransition sid x = t
      where
        [t] = [ t | t@(Transition x' _ _) <- ts, x == x' ]
        [(State _ _ ts)] = [ s | s@(State _ sid' _) <- ss, sid == sid' ]
