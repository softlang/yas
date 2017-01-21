import Language.FSML.Syntax
import Language.FSML.Eq
import Language.FSML.Sample as S1
import Language.FSML.StringTemplate.Sample as S2
import Language.FSML.SampleIO
import Language.FSML.Interpreter
import Language.FSML.CombinatorFormatter as F1
import Language.FSML.TemplateFormatter as F2
import qualified Language.FSML.MonadicParser as P1
import qualified Language.FSML.ApplicativeParser as P2
import qualified Language.FSML.Acceptor as A
import qualified Language.FSML.BoolChecker as C1
import qualified Language.FSML.StringChecker as C2
import Language.FSML.QuasiQuoter
import Language.FSML.QQ.Sample as S3
import Language.FSML.Merge.Transformation
import Language.FSML.Rename.Sample as S4
import Language.FSML.Rename.Transformation
import Language.FSML.Merge.Sample as S5
import Language.FSML.Extraction
import Text.Parsec hiding (State)
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

tests pos neg =
  TestList [
    TestLabel "boolcheck" $ True ~=? C1.check S1.turnstileFsm,
    TestLabel "stringcheck" $ [] ~=? C2.check S1.turnstileFsm,
    TestLabel "simulate" $ sampleOutput ~=? simulate S1.turnstileFsm sampleInput,
    TestLabel "accept" $ (Right ()) ~=? parse (spaces >> A.fsm >> eof) "" pos,
    TestLabel "parse1" $ (Right S1.turnstileFsm) ~=? parse (spaces *> P1.fsm <* eof) "" pos,
    TestLabel "parse2" $ (Right S1.turnstileFsm) ~=? parse (spaces *> P2.fsm <* eof) "" pos,
    TestLabel "format1" $ lines pos ~=? lines (show (F1.fsm S1.turnstileFsm)),
    TestLabel "format1" $ lines pos ~=? lines (F2.format S2.turnstileFsm),
    TestLabel "qq" $ S1.turnstileFsm ~=? S3.turnstileFsm,
    TestLabel "rename" $ Just S4.baseline ~=? S4.turnstileFsm,
    TestLabel "merge" $ Just S1.turnstileFsm ~=? S5.turnstileFsm,
    TestLabel "neg" $ ["Missing state stateC"] ~=? either undefined C2.check (parse (spaces *> P1.fsm <* eof) "" neg)
  ]

main = do
  -- Read input from file
  pos <- readFile "../sample.fsml"
  neg <- readFile "../tests/resolutionNotOk.fsml"
  -- Run tests
  counts <- runTestTT $ tests pos neg
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
