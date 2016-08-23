-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
-- Negative test case for reachability check
module Language.FSML.QQ.Reachability where
import Language.FSML.Quoter
import Language.FSML.Syntax
-- END ...
sampleFsm :: Fsm
sampleFsm = [fsml|
        initial state state1 {
                event1 -> state2;
        }
        state state2 {
        }
        state state3 {
        }
|]
