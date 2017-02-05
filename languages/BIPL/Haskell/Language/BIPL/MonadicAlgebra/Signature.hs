-- BEGIN ...
module Language.BIPL.MonadicAlgebra.Signature where
import Language.BIPL.Syntax (UOp, BOp)
-- END ...
-- Aliases to shorten function signatures
type Trafo m sto = sto -> m sto -- Store transformation
type Obs m sto val = sto -> m val -- Store observation
-- The signature of algebras for interpretation
data Alg m sto val = Alg {
  skip' :: Trafo m sto,
  assign' :: String -> Obs m sto val -> Trafo m sto,
  seq' :: Trafo m sto -> Trafo m sto -> Trafo m sto,
  -- ...
-- BEGIN ...
  if' :: Obs m sto val -> Trafo m sto -> Trafo m sto -> Trafo m sto,
  while' :: Obs m sto val -> Trafo m sto -> Trafo m sto,
  intconst' :: Int -> Obs m sto val,
  var' :: String -> Obs m sto val,
  unary' :: UOp -> Obs m sto val -> Obs m sto val,
  binary' :: BOp -> Obs m sto val -> Obs m sto val -> Obs m sto val 
-- END ...
}
