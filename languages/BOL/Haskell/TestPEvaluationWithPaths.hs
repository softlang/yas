module TestPEvaluationWithPaths where
import TestEvaluation (ev)
import TestPEvaluation (expected1, expected2, expected3, expected4, env1, env2)
import Language.BOL.ICL
import Language.BOL.Evaluator (Val(..))
import Language.BOL.PEvaluator (Env, EnvI, EnvP)
import Language.BOL.PEvaluatorWithPaths
import qualified Language.BOL.Samples.Lt5 as S1
import qualified Language.BOL.Samples.PathExpr as S2
import Data.Map
import Test.HUnit (Test(TestLabel), (~=?))

env3 :: Env
env3 = (ei, ep, ev)

repoA, repoB, repoC :: [OId]
repoA = ["a1"]
repoB = ["b1", "b2"]
repoC = ["c1", "c2"]
ints = [1,2]

ei :: EnvI
ei = insert "A" (repoA, v1)
   $ insert "B" (repoB, v2)
   $ insert "C" (repoB, v3)
   $ empty

-- Repo variables: all instances are known
v1 = (1, BoundedSetType [])
v2 = (2, BoundedSetType [])
v3 = (3, BoundedSetType [])

-- All properties are unknown
ep :: EnvP
ep = insert "a1" (insert "x" (VarTerm v4) $ insert "b" (VarTerm v5) $ empty)
   $ insert "a2" (insert "x" (VarTerm v6) $ insert "b" (VarTerm v7) $ empty)
   $ insert "b1" (insert "y" (VarTerm v8) $ insert "c" (VarTerm v9) $ empty)
   $ insert "b2" (insert "y" (VarTerm v10) $ insert "c" (VarTerm v11) $ empty)
   $ insert "c1" (insert "z" (VarTerm v12) $ empty)
   $ insert "c2" (insert "z" (VarTerm v13) $ empty)
   $ empty

-- Property variables
v4, v5, v6, v7, v8, v9, v10, v11, v12, v13  :: Var
v4 = (4, BoundedIntType ints)
v5 = (5, BoundedRefType repoB)
v6 = (6, BoundedIntType ints)
v7 = (7, BoundedRefType repoB)
v8 = (8, BoundedIntType ints)
v9 = (9, BoundedRefType repoC)
v10 = (10, BoundedIntType ints)
v11 = (11, BoundedRefType repoC)
v12 = (12, BoundedIntType ints)
v13 = (13, BoundedIntType ints)

{-
        (v5 = "b1" => v4 < v8) 
    and (v5 = "b2" => v4 < v10)
    and ((v5 = "b1" and v9 = "c1") => v4 < v12)
    and ((v5 = "b1" and v9 = "c2") => v4 < v13)
    and ((v5 = "b2" and v11 = "c1") => v4 < v12)
    and ((v5 = "b2" and v11 = "c2") => v4 < v13)
-}
expected5 :: Form
expected5
 = Conj
     (Conj
       (Impl (EqTo v5 (ObjectVal "b1"))
             (Lt (VarTerm v4) (VarTerm v8)))
       (Impl (EqTo v5 (ObjectVal "b2"))
             (Lt (VarTerm v4) (VarTerm v10))))
     (Conj
       (Impl (Conj (EqTo v5 (ObjectVal "b1")) (EqTo v9 (ObjectVal "c1")))
             (Lt (VarTerm v4) (VarTerm v12))) (Conj
       (Impl (Conj (EqTo v5 (ObjectVal "b1")) (EqTo v9 (ObjectVal "c2")))
             (Lt (VarTerm v4) (VarTerm v13))) (Conj
       (Impl (Conj (EqTo v5 (ObjectVal "b2")) (EqTo v11 (ObjectVal "c1")))
             (Lt (VarTerm v4) (VarTerm v12)))
       (Impl (Conj (EqTo v5 (ObjectVal "b2")) (EqTo v11 (ObjectVal "c2")))
             (Lt (VarTerm v4) (VarTerm v13))))))

tests =
  [
    TestLabel "PEcUnknownWithPaths" $ expected1 ~=? pevalInv S1.invI env1,
    TestLabel "PEbsUnknownWithPaths" $ expected2 ~=? pevalInv S1.invI env2,
    TestLabel "invJwithPaths" $ expected3 ~=? pevalInv S1.invJ env2,
    TestLabel "invKwithPaths" $ expected4 ~=? pevalInv S1.invK env2,
    TestLabel "PathExpr" $ expected5 ~=? pevalInv S2.inv env3
  ]
