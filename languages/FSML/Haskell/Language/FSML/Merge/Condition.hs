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

distinctStateIds :: Fsm -> Bool
distinctStateIds fsm = -- ...
-- BEGIN ...
    sids == nub sids
  where
    sids = [ sid | (State _ sid _) <- getStates fsm ]

-- END ...
resolvableTargetStates :: Fsm -> Bool
resolvableTargetStates fsm = -- ...
-- BEGIN ...
  and $ map (\s ->
    and $ map (\t ->
      let ss' = [ s | s <- (getStates fsm), getId s == getTarget t ]
        in not (null ss')) (getTransitions s)) (getStates fsm)

-- END ...
deterministicTransitions :: Fsm -> Bool
deterministicTransitions fsm = -- ...
-- BEGIN ...
  and $ map (\s ->
    let
      events = [ getEvent t | t <- getTransitions s ]
    in
      events == nub events) (getStates fsm)
-- END ...
