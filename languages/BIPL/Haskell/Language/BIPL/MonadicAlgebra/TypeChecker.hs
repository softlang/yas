-- BEGIN ...
-- A monadic algebra for typechecking
module Language.BIPL.MonadicAlgebra.TypeChecker where
import Prelude hiding (lookup)
import Language.BIPL.MonadicAlgebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Data.Map (Map, lookup, insert)
import Control.Monad ((<=<), guard      )
import Control.Monad.Fix (fix)
-- END ...
data Type = IntType | BoolType
-- BEGIN ...
  deriving (Eq, Show)
-- END ...
type VarTypes = Map String Type
algebra :: Alg Maybe VarTypes Type
algebra = Alg {
  skip' = Just,
  assign' = \x f m -> f m >>= \t ->
    case lookup x m of
      (Just t') -> guard (t==t') >> Just m
      Nothing -> Just (insert x t m),
  seq' = flip (<=<),
  if' = \f g h m -> do
    t <- f m
    guard (t==BoolType)
    m1 <- g m
    m2 <- h m
    guard (m1==m2)
    Just m1,
  while' = \f g m -> do
    t <- f m
    guard (t==BoolType)
    m' <- g m
    guard (m==m')
    Just m,
  intconst' = const (const (Just IntType)),
  var' = \x m -> lookup x m,
  unary' = \o f m -> f m >>= \t ->
    case (o, t) of
      (Negate, IntType) -> Just IntType
      (Not, BoolType) -> Just BoolType
      _ -> Nothing,
  binary' = \o f g m -> -- ...
-- BEGIN ...
    f m >>= \v1 -> g m >>= \v2 ->
      case (o, v1, v2) of
        (Add, IntType, IntType) -> Just IntType
        (Sub, IntType, IntType) -> Just IntType
        (Mul, IntType, IntType) -> Just IntType
        (Geq, IntType, IntType) -> Just BoolType
        _ -> Nothing
-- END ...
}
