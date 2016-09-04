import Language.EGL.Syntax
import Language.EGL.Parser
import Language.EGL.Lexer
import Language.EGL.Sample
import Language.EGL.Interpreter
import Data.Map (empty, insert)
import Text.Parsec
import Text.Parsec.Utilities
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests grammarText fsmText =
  TestList [
    TestLabel "grammar" $ Right sampleGrammar ~=? parse (completeParser grammar) "" grammarText,
    TestLabel "fsml" $ Right () ~=? accept sampleGrammar fsmlMap fsmText
  ]

fsmlMap = insert "name" (identifier >> return ()) empty

main = do
  -- Read inputs from files
  grammarText <- readFile "../../FSML/cs.egl"
  fsmText <- readFile "../../FSML/sample.fsml"
  -- Run tests
  counts <- runTestTT $ tests grammarText fsmText
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
