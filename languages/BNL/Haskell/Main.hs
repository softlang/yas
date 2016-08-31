import Language.BNL.Syntax
import Language.BNL.Conversion 
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests =
  TestList [
    TestLabel "0" $ 0 ~=? number (i zero),
    TestLabel "1" $ 1 ~=? number (i one),
    TestLabel "5" $ 5 ~=? number (i five),
    TestLabel "5.25" $ 5.25 ~=? number (r five quarter)
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
