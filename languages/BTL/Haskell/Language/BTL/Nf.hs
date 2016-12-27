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
isNat (Succ e) = isNat e
isNat _ = False

-- Values
isValue :: Expr -> Bool
isValue e = isBool e || isNat e
