import Prelude hiding (succ, pred)
import Language.BTL.Syntax
import Language.BTL.SmartSyntax
import qualified Language.BTL.Sample as S1
import qualified Language.BTL.Universal.Sample as S2
import qualified Language.BTL.Universal.Term
import Language.BTL.Interpreter as AdHoc
import Language.BTL.BigStep as BigStep1
import Language.BTL.BigStepMaybe as BigStep2
import Language.BTL.BigStepWithGuards as BigStep3
import Language.BTL.SmallStep as SmallStep1
import Language.BTL.SmallStepWithGuards as SmallStep2
import Language.BTL.TypeChecker as Typing1
import Language.BTL.TypeCheckerWithGuards as Typing2
import Language.BTL.Closure
import Language.BTL.Dynamics
import Data.Term
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests =
  TestList [
    TestLabel "toTermRep" $ S2.sampleExpr ~=? toTermRep S1.sampleExpr,
    TestLabel "fromTermRep" $ S1.sampleExpr ~=? fromTermRep S2.sampleExpr,
    TestLabel "wellTyped1" $ True ~=? Typing1.wellTyped S1.sampleExpr,
    TestLabel "wellTyped2" $ True ~=? Typing2.wellTyped S1.sampleExpr,
    TestLabel "wellTyped3" $ False ~=? Typing1.wellTyped S1.illtypedSampleExpr,
    TestLabel "wellTyped4" $ False ~=? Typing2.wellTyped S1.illtypedSampleExpr,
    TestLabel "adhoc" $ Left 1 ~=? AdHoc.evaluate S1.sampleExpr,
    TestLabel "bigstep1" $ Succ Zero ~=? BigStep1.evaluate S1.sampleExpr,
    TestLabel "bigstep1" $ Just (Succ Zero) ~=? BigStep2.evaluate S1.sampleExpr,
    TestLabel "bigstep2" $ Succ Zero ~=? BigStep3.evaluate S1.sampleExpr,
    TestLabel "smallstep1" $ Just (Succ Zero) ~=? steps SmallStep1.step S1.sampleExpr,
    TestLabel "smallstep2" $ Just (Succ Zero) ~=? steps SmallStep2.step S1.sampleExpr,
    TestLabel "dynamics" $ True ~=? expr S2.sampleExpr
  ]

main = do
  counts <- runTestTT $ tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
