-- BEGIN ...
module Language.FSML.StringChecker ( check ) where
import Language.FSML.Syntax
import Data.List (concatMap, nub)
import Data.List ((\\))
import Data.Set (fromList, toList, union)
import qualified Data.Set as S

-- END ...
check :: Fsm -> [String]
check fsm = concatMap ($ fsm) [
    distinctStateIds,
    singleInitialState,
    resolvableTargetStates,
    deterministicTransitions,
    reachableStates ]

distinctStateIds :: Fsm -> [String]
distinctStateIds (Fsm ss) = map ("Multiple declarations of state " ++) doubles
  where
    sids = [ sid | (State _ sid _) <- ss ]
    doubles = (\\) sids (nub sids)

singleInitialState :: Fsm -> [String]
singleInitialState (Fsm ss) =
    if length inis == 0 then ["Missing initial state"]
    else if length inis > 1 then ["Multiple initial states " ++ show inis]
    else []
  where inis = [ sid | s@(State initial sid _) <- ss, initial ]

resolvableTargetStates :: Fsm -> [String]
resolvableTargetStates (Fsm ss) = concatMap (\(State _ _ ts) -> concatMap f ts) ss
  where
    f (Transition _ _ target) =
      if null [ s | s@(State _ source _) <- ss, source == target ]
        then ["Missing state " ++ target]
        else []

deterministicTransitions :: Fsm -> [String]
deterministicTransitions (Fsm ss) = -- ...
-- BEGIN ...
    concatMap (\(State _ source ts) -> f source ts) ss
  where
    f source ts =
        map (\event ->
               "Multiple transitions for event " ++ event ++
               " in state " ++ source) doubles
      where 
        events = [ event | (Transition event _ _) <- ts ]
        doubles = (\\) events (nub events)
-- END ...

reachableStates :: Fsm -> [String]
reachableStates (Fsm ss) = -- ...
-- BEGIN ...
    map ("Unreachable state " ++) (toList unreachableStates)
  where
    unreachableStates = (S.\\) allStates reachableStates
    allStates = fromList [ sid | (State _ sid _) <- ss ]
    reachableStates = chaseStates initialStates
      where
        initialStates =
          fromList [ sid | (State initial sid _) <- ss, initial ]
        chaseStates sids =
          if S.null ((S.\\) sids' sids)
            then sids
            else chaseStates (union sids sids')
          where
            sids' = fromList [ target |
              (State _ source ts) <- ss,
              elem source sids,
              (Transition _ _ target) <- ts ]
-- END ...
