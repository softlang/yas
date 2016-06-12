-- BEGIN ...
module Language.BFPL.Inliner where

import Language.BFPL.Syntax
import Language.BFPL.Domains hiding (Env)
import Language.BFPL.Interpreter (uop, bop)
import Data.Map (Map, lookup, empty, fromList)
import Data.Maybe

-- Argument names are mapped to expressions as opposed to values
type Env = Map String Expr

-- Return an expression based on inlining
-- END ...
pevaluate :: Program -> Expr
pevaluate (fs, e) = pevaluate' e empty
  where
    pevaluate' :: Expr -> Env -> Expr
    pevaluate' e@(IntConst _) _ = e
    pevaluate' e@(BoolConst _) _ = e
    pevaluate' e@(Arg x) env =
      case Data.Map.lookup x env of
        (Just e') -> e'
        Nothing -> e
    pevaluate' (If e0 e1 e2) env =
      let
        r0 = pevaluate' e0 env
        r1 = pevaluate' e1 env
        r2 = pevaluate' e2 env
      in
       case exprToValue r0 of
         (Just (Right bv)) -> if bv then r1 else r2
         Nothing -> If r0 r1 r2
    pevaluate' (Unary o e) env =
      let
        r = pevaluate' e env
      in
        case exprToValue r of
          (Just v) -> valueToExpr (uop o v)
          _ -> Unary o r
    pevaluate' (Binary o e1 e2) env =
      let
        r1 = pevaluate' e1 env
        r2 = pevaluate' e2 env
      in
        case (exprToValue r1, exprToValue r2) of
          (Just v1, Just v2) -> valueToExpr (bop o v1 v2)
          _ -> Binary o r1 r2
    pevaluate' (Apply fn es) env = pevaluate' body env'
      where
        Just (_, (ns, body)) = Prelude.lookup fn fs
        rs = map (flip pevaluate' env) es
        env' = fromList (zip ns rs)
-- BEGIN ...

-- Attempt extraction of value from expression
exprToValue :: Expr -> Maybe Value
exprToValue (IntConst iv) = Just (Left iv)
exprToValue (BoolConst bv) = Just (Right bv)
exprToValue _ = Nothing

-- Represent value as expression
valueToExpr :: Value -> Expr
valueToExpr (Left iv) = IntConst iv
valueToExpr (Right bv) = BoolConst bv

-- Test for convertibility to value
isValue :: Expr -> Bool
isValue = isJust . exprToValue

-- Force extraction of value
getValue :: Expr -> Value
getValue = fromJust . exprToValue
-- END ..
