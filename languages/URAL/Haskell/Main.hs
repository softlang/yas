import Language.URAL.Syntax
import Language.URAL.Semantics as Semantics
import Language.URAL.Completion as Completion
import Language.URAL.Meta.Syntax
import Language.URAL.Conformance as Conformance
import Language.URAL.Repr.Syntax
import Language.URAL.Repr.Conformance
import Data.Conformance
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

-- Test URAs
ura0, ura1 :: URA
ura0 = []
ura1 = [Tag "B", Index 0, Tag "C", Selector "y"]

-- Test representation
repr1 :: Repr
repr1 =
  Tagged
    "B"
    (List [Tagged
             "C"
             (Record [
               ("x", Tagged "B" (List [])),
               ("y", Tagged "Void" (List []))])])

-- Test metamodel
mm1 = MM
  [AType "A" ["B", "C"]]
  [
    CType "B" (ListType (NominalType "A") Star),
    CType "C" (RecordType [("x", NominalType "B"), ("y", NominalType "Void")]),
    CType "Void" (ProductType [])
  ]
  (NominalType "A")

-- Tests
tests =
  TestList [
    TestLabel "step" $ Just (ListType (NominalType "A") Star) ~=? Conformance.step (Tag "B") mm1,
    TestLabel "uraOk1" $ True ~=? conformsTo ura0 mm1,
    TestLabel "uraOk2" $ True ~=? conformsTo ura1 mm1,
    TestLabel "reprOk" $ True ~=? conformsTo repr1 mm1,
    TestLabel "semantics" $ Just (Tagged "Void" (List [])) ~=? evaluate ura1 repr1
  ]

main = do
  -- Run tests
  counts <- runTestTT $ tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
