-- BEGIN ...
module Language.BIPL.Algebra.Signature where
import Language.BIPL.Syntax (UOp, BOp)
-- END ...
-- Aliases to shorten function signatures
type Trafo sto = sto -> sto -- Store transformation
type Obs sto val = sto -> val -- Store observation
-- The signature of algebras for interpretation
data Alg sto val = Alg {
  skip' :: Trafo sto,
  assign' :: String -> Obs sto val -> Trafo sto,
  seq' :: Trafo sto -> Trafo sto -> Trafo sto,
  if' :: Obs sto val -> Trafo sto -> Trafo sto -> Trafo sto,
  while' :: Obs sto val -> Trafo sto -> Trafo sto,
  intconst' :: Int -> Obs sto val,
  var' :: String -> Obs sto val,
  unary' :: UOp -> Obs sto val -> Obs sto val,
  binary' :: BOp -> Obs sto val -> Obs sto val -> Obs sto val 
}
