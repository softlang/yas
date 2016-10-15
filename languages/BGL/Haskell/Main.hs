import Language.BGL.Syntax
import Language.BGL.Sample as S1
import Language.BGL.SampleWithoutEpsilon as S2
import Language.BGL.SampleWithGreediness as S3
import Language.BGL.TopDownAcceptor as TD
import Language.BGL.BottomUpAcceptor as BU
import Language.BGL.TopDownParser
import Data.Tree
import Data.Maybe
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests =
  TestList [
    TestLabel "accept'TD1" $ True ~=? TD.accept S1.bnlGrammar "101.01",
    TestLabel "accept'TD2" $ True ~=? TD.accept S2.bnlGrammar "101.01",
    TestLabel "accept'BU" $ True ~=? BU.accept S2.bnlGrammar "101.01",
    TestLabel "parse'TD" $ True ~=? isJust (parse S3.bnlGrammar "101.01")
  ]

main = do
  -- Run tests
  counts <- runTestTT tests
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
