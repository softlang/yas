module TestEvaluation where
import Language.BOL.Syntax
import Language.BOL.Samples.Lt5
import Language.BOL.Evaluator
import Data.Map
import Test.HUnit (Test(TestLabel), (~=?))

env1, env2 :: Env
env1 = (ei, ep, ev) -- positive test case
env2 = (ei, ep', ev) -- negative test case

ei :: EnvI
ei = insert "A" ["a1", "a2"] -- a1, a2
   $ insert "B" ["b1", "b2", "b3"]
   $ empty

ep, ep' :: EnvP
ep = insert "a1" ((insert "bs" (ListVal ["b1", "b2"])) $ empty)
   $ insert "a2" ((insert "bs" (ListVal ["b3"])) $ empty)
   $ insert "b1" ((insert "c" (IntVal 1)) $ empty)
   $ insert "b2" ((insert "c" (IntVal 5)) $ empty)
   $ insert "b3" ((insert "c" (IntVal 3)) $ empty)
   $ empty
ep' = insert "b3" ((insert "c" (IntVal 42)) $ empty)
    $ ep

ev :: EnvV
ev = (Nothing, empty)

tests =
  [
    TestLabel "invTrue" $ True ~=? evalInv inv env1,
    TestLabel "invFalse" $ False ~=? evalInv inv env2
  ]
