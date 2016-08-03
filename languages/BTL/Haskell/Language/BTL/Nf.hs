-- BEGIN ...
-- Normal form in the operational semantics
module Language.BTL.Nf where

import Language.BTL.Syntax
-- END ...
-- Boolean values
isBool :: Expr -> Bool
isBool TRUE = True
isBool FALSE = True
isBool _ = False

-- Natural numbers
isNat :: Expr -> Bool
isNat Zero = True
isNat (Succ t) = isNat t
isNat _ = False

-- Values
isValue :: Expr -> Bool
isValue t = isBool t || isNat t
