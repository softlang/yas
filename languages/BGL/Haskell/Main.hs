import Language.BGL.Syntax
import Language.BGL.Sample
import Language.BGL.TopDownAcceptor
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests =
  TestList [
    TestLabel "accept101'01" $ True ~=? accept bnlGrammar "101.01"
  ]

main = do
  -- Run tests
  counts <- runTestTT tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
