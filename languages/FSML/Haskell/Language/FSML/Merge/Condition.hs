-- BEGIN ...
module Language.FSML.Merge.Condition(ok) where
import Language.FSML.Syntax
import Data.List (nub)

-- END ...
ok :: Fsm -> Bool
ok fsm = and $ map ($fsm) [
  zeroOrOneInitialState,
  distinctStateIds, 
  resolvableTargetStates,
  deterministicTransitions ]

zeroOrOneInitialState :: Fsm -> Bool
zeroOrOneInitialState fsm = -- ...
    length inis < 2
  where
    inis = [ getId s | s <- getStates fsm, getInitial s ]

-- ...
-- BEGIN ...
distinctStateIds :: Fsm -> Bool
distinctStateIds fsm =
    sids == nub sids
  where
    sids = [ sid | (State _ sid _) <- getStates fsm ]

resolvableTargetStates :: Fsm -> Bool
resolvableTargetStates fsm =
  and $ map (\s ->
    and $ map (\t ->
      let ss' = [ s | s <- (getStates fsm), getId s == getTarget t ]
        in not (null ss')) (getTransitions s)) (getStates fsm)

deterministicTransitions :: Fsm -> Bool
deterministicTransitions fsm =
  and $ map (\s ->
    let
      events = [ getEvent t | t <- getTransitions s ]
    in
      events == nub events) (getStates fsm)
-- END ...
