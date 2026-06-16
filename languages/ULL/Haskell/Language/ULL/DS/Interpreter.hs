module Language.ULL.DS.Interpreter where

import Prelude hiding (succ, pred)
import Control.Monad.Fix (mfix)
import Data.Map (lookup, insert)
import Language.ULL.Syntax
import Language.ULL.DS.Domains
import Language.ULL.DS.Combinators

-- Direct denotational-style interpreter for ULL.
evaluate :: Expr -> Meaning
evaluate (Var x) =
  var x

evaluate (Lambda x body) =
  lambda x (evaluate body)

evaluate (Apply e1 e2) =
  apply (evaluate e1) (evaluate e2)

evaluate TRUE =
  true

evaluate FALSE =
  false

evaluate Zero =
  zero

evaluate (Succ e) =
  succ (evaluate e)

evaluate (Pred e) =
  pred (evaluate e)

evaluate (IsZero e) =
  isZero (evaluate e)

evaluate (If e0 e1 e2) =
  ifThenElse
    (evaluate e0)
    (evaluate e1)
    (evaluate e2)

evaluate (Fix e) =
  fix (evaluate e)

evaluateClosed :: Expr -> Maybe Value
evaluateClosed = ($ emptyEnv) . evaluate
