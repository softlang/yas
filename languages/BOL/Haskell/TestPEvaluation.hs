module TestPEvaluation where
import TestEvaluation (ev)
import TestTranslation (v3, v4, ints, v5, v6, v7)
import Language.BOL.Evaluator (Val(..))
import Language.BOL.PEvaluator
import Language.BOL.ICL
import Language.BOL.Samples.Lt5
import Data.Map
import Test.HUnit (Test(TestLabel), (~=?))

-- Environments with different unknowns
env1, env2 :: Env
env1 = (ei, ep1, ev)
env2 = (ei, ep2, ev)

repoA, repoB :: [OId]
repoA = ["a1", "a2"]
repoB = ["b1", "b2", "b3"]

-- All instances are known.

v1 = (1, BoundedSetType [])
v2 = (2, BoundedSetType [])

ei :: EnvI
ei = insert "A" (repoA, v1)
   $ insert "B" (repoB, v2)
   $ empty

ep1, ep2 :: EnvP

-- Properties "bs" known; properties "c" unknown
ep1 = insert "a1" ((insert "bs" (ValTerm (ListVal ["b1", "b2"]))) $ empty)
    $ insert "a2" ((insert "bs" (ValTerm (ListVal ["b3"]))) $ empty)
    $ insert "b1" ((insert "c" (VarTerm v5)) $ empty)
    $ insert "b2" ((insert "c" (VarTerm v6)) $ empty)
    $ insert "b3" ((insert "c" (VarTerm v7)) $ empty)
    $ empty

-- Properties "bs" unknown; properties "c" known
ep2 = insert "a1" (insert "bs" (VarTerm v3) empty)
    $ insert "a2" (insert "bs" (VarTerm v4) empty)
    $ insert "b1" (insert "c" (ValTerm (IntVal 1)) empty)
    $ insert "b2" (insert "c" (ValTerm (IntVal 5)) empty)
    $ insert "b3" (insert "c" (ValTerm (IntVal 3)) empty)
    $ empty

expected1, expected2 :: Form
expected1 = Conj (Disj (Lt (VarTerm v5) (ValTerm (IntVal 5))) (Lt (VarTerm v6) (ValTerm (IntVal 5)))) (Lt (VarTerm v7) (ValTerm (IntVal 5)))
expected2 = Conj (Disj (ElOf (ObjectVal "b1") v3) (ElOf (ObjectVal "b3") v3)) (Disj (ElOf (ObjectVal "b1") v4) (ElOf (ObjectVal "b3") v4))

tests =
  [
    TestLabel "PEcUnknown" $ expected1 ~=? pevalInv inv env1,
    TestLabel "PEbsUnknown" $ expected2 ~=? pevalInv inv env2
  ]
