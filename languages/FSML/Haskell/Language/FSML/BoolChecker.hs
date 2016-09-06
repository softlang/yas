-- BEGIN ...
module Language.FSML.BoolChecker ( check ) where
import Language.FSML.Syntax
import Data.List (nub)
import Data.Set (fromList, union)
import qualified Data.Set as S

-- END ...
check :: Fsm -> Bool
check fsm = and (map ($ fsm) [
    distinctStateIds,
    singleInitialState,
    resolvableTargetStates,
    deterministicTransitions,
    reachableStates ] )

distinctStateIds :: Fsm -> Bool
distinctStateIds (Fsm ss) = sids == nub sids
  where
    sids = [ sid | (State _ sid _) <- ss ]

singleInitialState :: Fsm -> Bool
singleInitialState (Fsm ss) = length inis == 1
  where inis = [ sid | s@(State initial sid _) <- ss, initial ]

resolvableTargetStates :: Fsm -> Bool
resolvableTargetStates (Fsm ss) = and (map (\(State _ _ ts) -> and (map f ts)) ss)
  where
    f (Transition _ _ target) =
      not (null [ s | s@(State _ source _) <- ss, source == target ])

deterministicTransitions :: Fsm -> Bool
deterministicTransitions (Fsm ss) = and (map (\(State _ _ ts) -> f ts) ss)
  where
    f ts = events == nub events
      where 
        events = [ event | (Transition event _ _) <- ts ]

reachableStates :: Fsm -> Bool
reachableStates (Fsm ss) = -- ...
-- BEGIN ...
    null unreachableStates
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
