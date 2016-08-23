-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
-- Negative test case for singleInitial check
module Language.FSML.QQ.SingleInitial where
import Language.FSML.Quoter
import Language.FSML.Syntax
-- END ...
sampleFsm :: Fsm
sampleFsm = [fsml|
        initial state state1 {
                event1 -> state2;
        }
        initial state state2 {
                event2 -> state1;
        }
|]
