-- BEGIN ...
module Language.BIPL.Algebra.Signature where

import Language.BIPL.Syntax (UOp, BOp)

-- END ...
-- Alias to shorten store transformers
type T x = x -> x
type O x y = x -> y
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
