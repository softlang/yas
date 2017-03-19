-- BEGIN ...
module Language.BTL.TypeChecker where
import Language.BTL.Syntax
import Data.Maybe (isJust)
import Control.Monad (guard)
-- END ...
-- Types of expressions
data Type = NatType | BoolType
-- BEGIN ...
  deriving (Eq, Show)
-- END ...

-- Well-typedness of expressions
wellTyped :: Expr -> Bool
wellTyped e = isJust (typeOf e)

-- Types of expressions
typeOf :: Expr -> Maybe Type
typeOf TRUE = return BoolType
typeOf FALSE = return BoolType
typeOf Zero = return NatType
typeOf (Succ e) = do { NatType <- typeOf e; return NatType }
typeOf (Pred e) = do { NatType <- typeOf e; return NatType }
typeOf (IsZero e) = do { NatType <- typeOf e; return BoolType }
typeOf (If e0 e1 e2) = do
  BoolType <- typeOf e0
  t1 <- typeOf e1
  t2 <- typeOf e2
  guard (t1==t2)
  return t1
