-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
-- Negative test case for determinism check
module Language.FSML.QQ.Determinism where
import Language.FSML.Quoter
import Language.FSML.Syntax
-- END ...
sampleFsm :: Fsm
sampleFsm = [fsml|
        initial state state1 {
                event1 -> state1;
                event1 -> state1;
        }
|]
