-- BEGIN ...
module Language.FSML.Interpreter where
import Language.FSML.Syntax
import Language.FSML.Domains
import Data.Maybe (maybeToList)

-- END ...
-- FSM simulation starting from initial state
simulate :: Fsm -> Input -> Output
simulate fsm xs = snd (foldl makeTransition (getInitial, []) xs)
  where
    -- Look up initial state
    getInitial :: Id
    getInitial = id where [(_, id, _)] = [ s | s@(initial, _, _) <- fsm, initial ]

    -- Process event; extent output
    makeTransition :: (Id, Output) -> Event -> (Id, Output)
    makeTransition (id, as) x = (id', maybeToList a ++ as)
      where
        (_, a, id') = getTransition id x

    -- Look up transition
    getTransition :: Id -> Event -> Transition
    getTransition id x = t
      where
        [t] = [ t | t@(x', _, _) <- ts, x == x' ]
        [(_, _, ts)] = [ s | s@(_, id', _) <- fsm, id == id' ]
