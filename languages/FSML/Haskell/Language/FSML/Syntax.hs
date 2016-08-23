-- BEGIN ...
{-# LANGUAGE DeriveDataTypeable, DeriveLift #-}
module Language.FSML.Syntax where
import Language.Haskell.TH.Syntax (Lift)
import Data.Generics
-- END ...
data Fsm = Fsm { getStates :: [State] }
-- BEGIN ...
  deriving (Show, Typeable, Data, Lift)
-- END ...
data State = State {
    getInitial :: Initial,
    getId :: StateId,
    getTransitions :: [Transition]
  }
-- BEGIN ...
  deriving (Eq, Show, Typeable, Data, Lift)
-- END ...
data Transition = Transition {
    getEvent :: Event,
    getAction :: (Maybe Action),
    getTarget :: StateId
  }
-- BEGIN ...
  deriving (Eq, Ord, Show, Typeable, Data, Lift)
-- END ...
type Initial = Bool
type StateId = String
type Event = String
type Action = String
