import qualified TestEvaluation as E
import qualified TestTranslation as T
import qualified TestPEvaluation as P
import Test.HUnit (runTestTT, Test(TestList), errors, failures)
import System.Exit (exitSuccess, exitFailure)

tests = TestList (E.tests ++ T.tests ++ P.tests)

main = do
  counts <- runTestTT $ tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
