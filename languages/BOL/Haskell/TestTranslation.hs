module TestTranslation where
import Language.BOL.Translator
import Language.BOL.ICL
import Language.BOL.Sample
import Data.Map
import Test.HUnit (Test(TestLabel), (~=?))

env :: Env
env = (ei, ep, ev)

repoA, repoB :: [OId]
repoA = ["a1", "a2"]
repoB = ["b1", "b2", "b3"]

v1 = (1, BoundedPowerType repoA)
v2 = (2, BoundedPowerType repoB)

ei :: EnvI
ei = insert "A" v1
   $ insert "B" v2
   $ empty

v3 = (3, BoundedListType "B")
v4 = (4, BoundedListType "B")

ints = [0, 1, 2, 3, 5]

v5 = (5, BoundedIntType ints)
v6 = (6, BoundedIntType ints)
v7 = (7, BoundedIntType ints)

ep :: EnvP
ep = insert "a1" ((insert "bs" v3) $ empty)
   $ insert "a2" ((insert "bs" v4) $ empty)
   $ insert "b1" ((insert "c" v5) $ empty)
   $ insert "b2" ((insert "c" v6) $ empty)
   $ insert "b3" ((insert "c" v7) $ empty)
   $ empty

ev :: EnvV
ev = (Nothing, empty)

expected :: Form
expected
 = Conj
    (Impl (ElOf "a1" v1) (Disj
      (Conj (ElOf "b1" v3) (Lt (Var v5) (Int 5))) (Disj
      (Conj (ElOf "b2" v3) (Lt (Var v6) (Int 5)))
      (Conj (ElOf "b3" v3) (Lt (Var v7) (Int 5))))))
    (Impl (ElOf "a2" v1) (Disj
      (Conj (ElOf "b1" v4) (Lt (Var v5) (Int 5))) (Disj
      (Conj (ElOf "b2" v4) (Lt (Var v6) (Int 5)))
      (Conj (ElOf "b3" v4) (Lt (Var v7) (Int 5))))))

tests =
  [
    TestLabel "transInv" $ expected ~=? transInv inv env
  ]
