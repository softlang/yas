{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}
-- ICL (Intermediate Constraint Language) needed for symbolic evaluation
module Language.BOL.ICL where
import Prelude hiding (and, or, not)
import qualified Prelude (not)
import Language.BOL.Syntax (Class)
import Language.BOL.Evaluator (OId, Val(..))

-- Variables (identity + bounded type)
type Var = (Int, BoundedType)
data BoundedType
 = BoundedIntType [Int] -- e.g., [0, 1, 2, 3, 5, 6]
 | BoundedRefType [OId] -- domain is set of the given identities
 | BoundedSetType [OId] -- domain is powerset of the given identities
 deriving (Eq)

-- Facilitate more concise output representation of variables
instance {-# OVERLAPPING #-} Show Var where
 show = show . fst

-- Formulae
data Form
 = Bool Bool
 | Not Form
 | Conj Form Form
 | Disj Form Form
 | Impl Form Form
 | Lt Term Term
 | ElOf Val Var
 | EqTo Var Val
 deriving (Show, Eq)

-- Terms
data Term
 = ValTerm Val
 | VarTerm Var
 deriving (Show, Eq)

-- Smart constructors
true, false :: Form
true = Bool True
false = Bool False
not :: Form -> Form
not (Bool b) = Bool (Prelude.not b)
not phi = Not phi
conj, disj, impl :: Form -> Form -> Form
disj (Bool True) _ = Bool True
disj (Bool False) phi = phi
disj _ (Bool True) = Bool True
disj phi (Bool False) = phi
disj phi1 phi2 = Disj phi1 phi2
conj (Bool False) _ = Bool False
conj (Bool True) phi = phi
conj _ (Bool False) = Bool False
conj phi (Bool True) = phi
conj phi1 phi2 = Conj phi1 phi2
impl (Bool False) _ = Bool True
impl _ (Bool True) = Bool True
impl (Bool True) phi = phi
impl phi (Bool False) = not phi
impl phi1 phi2 = Impl phi1 phi2
lt :: Term -> Term -> Form
lt (ValTerm (IntVal i1)) (ValTerm (IntVal i2)) = Bool (i1 < i2)
lt t1 t2 = Lt t1 t2

-- List-typed versions of conj and disj
and, or :: [Form] -> Form
and = foldr conj true
or = foldr disj false
