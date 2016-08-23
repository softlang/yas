-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
-- Negative test case for resolvableTargets check
module Language.FSML.QQ.ResolvableTargets where
import Language.FSML.Quoter
import Language.FSML.Syntax
-- END ...
sampleFsm :: Fsm
sampleFsm = [fsml|
        initial state state1 {
                event1 -> state2;
        }
|]
