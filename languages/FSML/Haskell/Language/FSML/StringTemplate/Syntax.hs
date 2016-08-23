-- BEGIN ...
{-# LANGUAGE DeriveDataTypeable #-}
module Language.FSML.StringTemplate.Syntax where
import Data.Typeable
import Data.Data
-- END ...
newtype Fsm = Fsm { states :: [State] }
  deriving (Typeable, Data)
data State = State {
               initial :: Bool,
               stateid :: String,
               transitions :: [Transition]
             }
  deriving (Typeable, Data)
data Transition = Transition {
                    event :: String,
                    action :: Maybe String,
                    target :: Maybe String
             }
  deriving (Typeable, Data)
