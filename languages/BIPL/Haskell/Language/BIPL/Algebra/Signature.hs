-- BEGIN ...
module Language.BIPL.Algebra.Signature where

import Language.BIPL.Syntax (UOp, BOp)

-- END ...
-- Aliases to shorten function signatures
type O x y = x -> y -- Store observation
type T x = x -> x -- Store transformation
-- The signature of algebras for interpretation
data Alg sto v = Alg {
  skip' :: T sto,
  assign' :: String -> O sto v -> T sto,
  seq' :: T sto -> T sto -> T sto,
  if' :: O sto v -> T sto -> T sto -> T sto,
  while' :: O sto v -> T sto -> T sto,
  intConst' :: Int -> O sto v,
  var' :: String -> O sto v,
  unary' :: UOp -> O sto v -> O sto v,
  binary' :: BOp -> O sto v -> O sto v -> O sto v 
}
