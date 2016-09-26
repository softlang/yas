import Language.BSL.Conformance
import Language.BSL.Sample
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests =
  TestList [
    TestLabel "conformance" $ True ~=? termOfSort sampleSignature sampleTermRep "number"
  ]

main = do
  -- Run tests
  counts <- runTestTT $ tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
