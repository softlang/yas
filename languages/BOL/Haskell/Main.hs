import qualified TestEvaluation as E
import qualified TestTranslation as T
import qualified TestPEvaluation as P1
import qualified TestPEvaluationWithPaths as P2
import Test.HUnit (runTestTT, Test(TestList), errors, failures)
import System.Exit (exitSuccess, exitFailure)

tests = TestList (E.tests ++ T.tests ++ P1.tests ++ P2.tests)

main = do
  counts <- runTestTT $ tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
