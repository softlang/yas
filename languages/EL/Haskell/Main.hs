{-# LANGUAGE ScopedTypeVariables, RankNTypes #-}
import qualified Language.EL.Syntax as S1
import qualified Language.EL.QQ.Syntax as S2
import Language.EL.Parser
import qualified Language.EL.Rules as R1
import qualified Language.EL.MoreRules as MR1
import qualified Language.EL.QQ.Rules as R2
import qualified Language.EL.QQ.MoreRules as MR2
import Language.EL.QuasiQuoter
import Data.Generics (Data, GenericM, extM, GenericM'(GM), unGM)
import Data.Generics.StrategyBasics
import Data.Generics.StrategySchemes
import qualified Data.Generics.SimpleStrategySchemes as Simple
import Data.Map (fromList, (!))
import Text.Parsec
import Control.Exception (throwIO)
import Data.Map (Map, empty, insert)
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)

-- See also ../tests/.ueber
tests p mf ms =
    [
      TestLabel (p++"1") $ rewrite mf ms "simplify" "top-unit" "a",
      TestLabel (p++"2") $ rewrite mf ms "fulltdSimplify" "deep-unit" "a-plus-b",
      TestLabel (p++"3") $ rewrite mf ms "varySimplify" "needs-commute" "a",
      TestLabel (p++"4") $ rewrite mf ms "fulltdSimplify" "needs-fullbu" "top-unit",
      TestLabel (p++"5") $ rewrite mf ms "fullbuSimplify" "needs-fullbu" "a",
      TestLabel (p++"6") $ rewrite mf ms "fullbuAssociate" "left-associated" "mix-associated",
      TestLabel (p++"7") $ rewrite mf ms "innermostAssociate" "left-associated" "right-associated"
    ]

-- Build a map of strategies so that they can be applied to different syntaxes
mapOfTests
  :: Data a
  => (a -> Maybe a)
  -> (a -> Maybe a)
  -> (a -> Maybe a)
  -> (a -> Maybe a)
  -> Map String (GenericM' Maybe)
mapOfTests simplify simplify' commute associate =
      insert "simplify" (GM (orFail simplify))
    $ insert "varySimplify" (GM (orFail simplify'))
    $ insert "fulltdSimplify" (GM (fulltd (orSucceed simplify)))
    $ insert "fullbuSimplify" (GM (fullbu (orSucceed simplify)))
    $ insert "fullbuAssociate" (GM (fullbu (orSucceed associate)))
    $ insert "innermostAssociate" (GM (Simple.innermost associate))
    $ empty

-- Apply a strategy on argument and check baseline
rewrite mf ms s x y = Just (mf!y) ~=? (unGM (ms!s)) (mf!x)

-- See also ../tests/.ueber
files = [
    "a",
    "a-plus-b",
    "top-unit",
    "deep-unit",
    "needs-commute",
    "needs-fullbu",
    "left-associated",
    "mix-associated",
    "right-associated"
  ]

-- Parse file and compare AST with baseline based on read
parseFile f = do
  text <- readFile ("../tests/" ++ f ++ ".el")
  term <- readFile ("baselines/" ++ f ++ ".hsterm")
  let r = parse (spaces *> expr <* eof) "" text
  case r of
    Left err -> throwIO (userError (show err))
    Right e  ->
      if e == read term
        then return e
        else throwIO (userError ("baseline " ++ f ++ " unexpected"))

-- Convert S1.Expr to S2.Expr
parseFile' f = do
  x <- parseFile f
  return (read (show x))

main = do
  (es1::[S1.Expr]) <- mapM parseFile files
  (es2::[S2.Expr]) <- mapM parseFile' files
  let mf1 = fromList (zip files es1)
  let mf2 = fromList (zip files es2)
  let t1 = tests "R1." mf1 (mapOfTests R1.simplify MR1.simplify' R1.commute R1.associate)
  let t2 = tests "R2." mf2 (mapOfTests R2.simplify MR2.simplify' R2.commute R2.associate)
  counts <- runTestTT $ TestList (t1++t2)
  if (errors counts > 0 || failures counts > 0)
    then exitFailure
    else exitSuccess
