-- BEGIN ...
module Language.BFPL.Interpreter where

import Language.BFPL.Syntax
import Language.BFPL.Domains
import Data.Map ((!), empty, fromList)

-- END ...
-- Evaluation of a program's main expression
evaluate :: Program -> Value
evaluate (fs, e) = f e empty
 where
  -- Evaluation of expressions
  f :: Expr -> Env -> Value
  f (IntConst i) _ = Left i
  f (BoolConst b) _ = Right b
  f (Arg x) m = m!x
  f (If e0 e1 e2) m = f (if b then e1 else e2) m where Right b = f e0 m 
  f (Unary o e) m = uop o (f e m)
  f (Binary o e1 e2) m = bop o (f e1 m) (f e2 m)
  f (Apply x es) m = f body m'
    where
      Just (_, (xs, body)) = lookup x fs
      vs = map (flip f m) es
      m' = fromList (zip xs vs)

-- Interpretation of unary operators
uop :: UOp -> Value -> Value 
uop Negate (Left i) = Left (negate i)
uop Not (Right b) = Right (not b)

-- Interpretation of binary operators
bop :: BOp -> Value -> Value -> Value
bop Add (Left i1) (Left i2) = Left (i1+i2)
-- ...
-- BEGIN ...
bop Sub (Left i1) (Left i2) = Left (i1-i2)
bop Mul (Left i1) (Left i2) = Left (i1*i2)
bop Eq (Left i1) (Left i2) = Right (i1==i2)
bop Geq (Left i1) (Left i2) = Right (i1>=i2)
-- END ...
