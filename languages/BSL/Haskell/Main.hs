import Language.BSL.Conformance
import Language.BTL.Universal.Sample as Sample1
import Language.BNL.Universal.Sample as Sample2
import Language.BTL.Universal.Signature as Sig1
import Language.BNL.Universal.Signature as Sig2
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests =
  TestList [
    TestLabel "btl" $ True ~=? termOfSort Sig1.btlSignature Sample1.sampleExpr "expr",
    TestLabel "bnl" $ True ~=? termOfSort Sig2.bnlSignature Sample2.sampleNumber "number"
  ]

main = do
  -- Run tests
  counts <- runTestTT $ tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
