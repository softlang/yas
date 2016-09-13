import Language.BNL.Syntax
import Language.BNL.Conversion 
import qualified Language.BNL.Acceptor as A
import qualified Language.BNL.Parser as P
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests =
  TestList [
    TestLabel "0" $ 0 ~=? number (i zero),
    TestLabel "1" $ 1 ~=? number (i one),
    TestLabel "5" $ 5 ~=? number (i five),
    TestLabel "5.25" $ 5.25 ~=? number (r five quarter),
    TestLabel "accept-5.25" $ True ~=? A.accept "101.01",
    TestLabel "parse-5.25" $ Just (r five quarter) ~=? P.parse "101.01"
  ]
 where
  i x = Number x Integer
  r x y = Number x (Rational y)
  zero = Single Zero
  one = Single One
  five = Many One (Many Zero one)
  quarter = Many Zero (Single One)
  
main = do
  -- Run tests
  counts <- runTestTT $ tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
