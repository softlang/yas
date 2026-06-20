module Language.BIPL.Analysis.DeadCode.BasicAnalysis where

import Language.BIPL.Syntax
import Language.BIPL.Analysis.DeadCode.Domain
import Data.List (nub)
import Data.Map ((!))
import qualified Data.Map as Map

-- | Analyze a statement from an abstract environment.
--   Diagnostics identify syntactically present branches whose guard is
--   definitely true or definitely false in the current abstract environment.
analyze :: Stmt -> Env -> AnalysisResult
analyze = analyzeStmt

analyzeStmt :: Stmt -> Env -> AnalysisResult
analyzeStmt Skip env = AnalysisResult env []
analyzeStmt (Assign x e) env = AnalysisResult (Map.insert x (evalExpr env e) env) []
analyzeStmt (Seq s1 s2) env =
  let r1 = analyzeStmt s1 env
      r2 = analyzeStmt s2 (environment r1)
  in AnalysisResult (environment r2) (diagnostics r1 ++ diagnostics r2)
analyzeStmt (If e s1 s2) env =
  case truth (evalExpr env e) of
    BoolKnown True ->
      let r = analyzeStmt s1 env
      in AnalysisResult (environment r) (UnreachableElse e : diagnostics r)
    BoolKnown False ->
      let r = analyzeStmt s2 env
      in AnalysisResult (environment r) (UnreachableThen e : diagnostics r)
    _ ->
      let r1 = analyzeStmt s1 env
          r2 = analyzeStmt s2 env
      in AnalysisResult
           (joinEnv (environment r1) (environment r2))
           (diagnostics r1 ++ diagnostics r2)
analyzeStmt (While e s) env =
  case truth (evalExpr env e) of
    BoolKnown False -> AnalysisResult env [UnreachableLoopBody e]
    _ -> analyzeLoop e s env

-- | Compute a small post-loop approximation. The domain reaches a fixed point
--   quickly for these examples because differing constants are widened to Top
--   by joinValue.
analyzeLoop :: Expr -> Stmt -> Env -> AnalysisResult
analyzeLoop _ body entry = go 20 entry []
  where
    go 0 headEnv ds = AnalysisResult headEnv (nub ds)
    go n headEnv ds =
      let r = analyzeStmt body headEnv
          next = joinEnv entry (environment r)
          ds' = ds ++ diagnostics r
      in if next == headEnv
           then AnalysisResult headEnv (nub ds')
           else go (n - 1) next ds'

truth :: AbsValue -> AbsBool
truth (ValBool b) = b
truth ValBot = BoolBot
truth _ = BoolTop

evalExpr :: Env -> Expr -> AbsValue
evalExpr _ (IntConst i) = ValInt (IntKnown i)
evalExpr env (Var x) = Map.findWithDefault ValTop x env
evalExpr env (Unary op e) = evalUnary op (evalExpr env e)
evalExpr env (Binary op e1 e2) = evalBinary op (evalExpr env e1) (evalExpr env e2)

evalUnary :: UOp -> AbsValue -> AbsValue
evalUnary Negate (ValInt i) = ValInt (negInt i)
evalUnary Not (ValBool b) = ValBool (notBool b)
evalUnary _ ValBot = ValBot
evalUnary _ _ = ValTop

evalBinary :: BOp -> AbsValue -> AbsValue -> AbsValue
evalBinary Add (ValInt x) (ValInt y) = ValInt (arithInt (+) x y)
evalBinary Sub (ValInt x) (ValInt y) = ValInt (arithInt (-) x y)
evalBinary Mul (ValInt x) (ValInt y) = ValInt (arithInt (*) x y)
evalBinary Lt  (ValInt x) (ValInt y) = ValBool (cmpInt (<)  x y)
evalBinary Leq (ValInt x) (ValInt y) = ValBool (cmpInt (<=) x y)
evalBinary Eq  (ValInt x) (ValInt y) = ValBool (eqInt x y)
evalBinary Eq  (ValBool x) (ValBool y) = ValBool (eqBool x y)
evalBinary Geq (ValInt x) (ValInt y) = ValBool (cmpInt (>=) x y)
evalBinary Gt  (ValInt x) (ValInt y) = ValBool (cmpInt (>)  x y)
evalBinary And (ValBool x) (ValBool y) = ValBool (andBool x y)
evalBinary Or  (ValBool x) (ValBool y) = ValBool (orBool x y)
evalBinary _ ValBot _ = ValBot
evalBinary _ _ ValBot = ValBot
evalBinary _ _ _ = ValTop

negInt :: AbsInt -> AbsInt
negInt IntBot = IntBot
negInt (IntKnown i) = IntKnown (-i)
negInt IntTop = IntTop

arithInt :: (Int -> Int -> Int) -> AbsInt -> AbsInt -> AbsInt
arithInt _ IntBot _ = IntBot
arithInt _ _ IntBot = IntBot
arithInt f (IntKnown x) (IntKnown y) = IntKnown (f x y)
arithInt _ _ _ = IntTop

cmpInt :: (Int -> Int -> Bool) -> AbsInt -> AbsInt -> AbsBool
cmpInt _ IntBot _ = BoolBot
cmpInt _ _ IntBot = BoolBot
cmpInt p (IntKnown x) (IntKnown y) = BoolKnown (p x y)
cmpInt _ _ _ = BoolTop

eqInt :: AbsInt -> AbsInt -> AbsBool
eqInt IntBot _ = BoolBot
eqInt _ IntBot = BoolBot
eqInt (IntKnown x) (IntKnown y) = BoolKnown (x == y)
eqInt _ _ = BoolTop

eqBool :: AbsBool -> AbsBool -> AbsBool
eqBool BoolBot _ = BoolBot
eqBool _ BoolBot = BoolBot
eqBool (BoolKnown x) (BoolKnown y) = BoolKnown (x == y)
eqBool _ _ = BoolTop

notBool :: AbsBool -> AbsBool
notBool BoolBot = BoolBot
notBool (BoolKnown b) = BoolKnown (not b)
notBool BoolTop = BoolTop

andBool :: AbsBool -> AbsBool -> AbsBool
andBool BoolBot _ = BoolBot
andBool _ BoolBot = BoolBot
andBool (BoolKnown False) _ = BoolKnown False
andBool _ (BoolKnown False) = BoolKnown False
andBool (BoolKnown True) b = b
andBool b (BoolKnown True) = b
andBool BoolTop BoolTop = BoolTop

orBool :: AbsBool -> AbsBool -> AbsBool
orBool BoolBot _ = BoolBot
orBool _ BoolBot = BoolBot
orBool (BoolKnown True) _ = BoolKnown True
orBool _ (BoolKnown True) = BoolKnown True
orBool (BoolKnown False) b = b
orBool b (BoolKnown False) = b
orBool BoolTop BoolTop = BoolTop
