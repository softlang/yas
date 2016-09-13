import Language.BTL.Syntax
import qualified Language.BTL.Sample as S1
import qualified Language.BTL.Universal.Sample as S2
import qualified Language.BTL.Universal.Term
import Language.BTL.Interpreter as AdHoc
import Language.BTL.BigStep as BigStep1
import Language.BTL.BigStepWithGuards as BigStep2
import Language.BTL.SmallStep
import Language.BTL.Typing
import Language.BTL.Closure
import Language.BTL.Dynamics
import Data.Term
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests =
  TestList [
    TestLabel "explode" $ S2.sampleExpr ~=? explode S1.sampleExpr,
    TestLabel "implode" $ S1.sampleExpr ~=? implode S2.sampleExpr,
    TestLabel "wellTyped" $ True ~=? wellTyped S1.sampleExpr,
    TestLabel "adhoc" $ Left 1 ~=? AdHoc.evaluate S1.sampleExpr,
    TestLabel "bigstep1" $ Just (Succ Zero) ~=? BigStep1.evaluate S1.sampleExpr,
    TestLabel "bigstep2" $ Just (Succ Zero) ~=? BigStep2.evaluate S1.sampleExpr,
    TestLabel "smallstep" $ Just (Succ Zero) ~=? steps S1.sampleExpr,
    TestLabel "dynamics" $ True ~=? expr S2.sampleExpr
  ]

main = do
  counts <- runTestTT $ tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
